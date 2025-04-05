// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:socket_io_client/socket_io_client.dart' as IO;
import '../../flutter_flow/flutter_flow_util.dart'; // For FFAppState
import '/backend/schema/structs/index.dart'; // For ChatMessageStruct
import 'dart:async'; // For Completer

Future<String> initializeSocket(String userId, String authToken) async {
  final completer = Completer<String>();
  final registerCompleter =
      Completer<String>(); // To wait for register response

  try {
    // Validate inputs
    if (userId.isEmpty) {
      FFAppState().update(() {
        FFAppState().errorMessage =
            "Error initializing socket: userId is empty";
      });
      return "Error initializing socket: userId is empty";
    }
    if (authToken.isEmpty) {
      FFAppState().update(() {
        FFAppState().errorMessage =
            "Error initializing socket: authToken is empty";
      });
      return "Error initializing socket: authToken is empty";
    }

    // Check if already connected
    if (FFAppState().isConnected && FFAppState().mainSocket != null) {
      return "Socket already connected";
    }

    // If there's an existing socket, clean it up
    if (FFAppState().mainSocket != null) {
      FFAppState().mainSocket.disconnect();
      FFAppState().mainSocket = null;
    }

    // Initialize the socket
    final socket = IO.io('wss://chat-api.clothes2wear.com', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
      'auth': {'token': authToken},
    });

    // Store the socket in FFAppState
    FFAppState().update(() {
      FFAppState().mainSocket = socket;
    });

    // Debug logging
    print("Attempting to connect with token: $authToken");

    // Handle connection success
    socket.onConnect((_) {
      print("Socket connected successfully");
      FFAppState().update(() {
        FFAppState().isConnected = true;
        FFAppState().errorMessage = "";
      });

      // Register the user
      print("Emitting register event for userId: $userId");
      socket.emit('register', userId);

      if (!completer.isCompleted) {
        completer.complete("Socket initialized successfully");
      }
    });

    // Handle connection error
    socket.onConnectError((error) {
      print("Connection error: $error");
      FFAppState().update(() {
        FFAppState().isConnected = false;
        FFAppState().errorMessage = "Connection error: ${error.toString()}";
        FFAppState().mainSocket = null;
      });
      socket.disconnect();
      if (!completer.isCompleted) {
        completer.complete("Error connecting to socket: ${error.toString()}");
      }
      if (!registerCompleter.isCompleted) {
        registerCompleter.complete("Error: Connection failed");
      }
    });

    // Handle disconnection
    socket.onDisconnect((_) {
      print("Socket disconnected");
      FFAppState().update(() {
        FFAppState().isConnected = false;
        FFAppState().errorMessage = "Disconnected from server";
        FFAppState().mainSocket = null;
      });
    });

    // Listen for incoming messages
    socket.on('receiveMessage', (data) {
      try {
        print("Received message: $data");
        if (data is Map<String, dynamic>) {
          final chatMessage = ChatMessageStruct(
            id: data['id']?.toString() ?? '',
            senderId: data['senderId']?.toString() ?? '',
            receiverId: data['receiverId']?.toString() ?? '',
            message: data['message']?.toString() ?? '',
            createdAt: DateTime.tryParse(data['createdAt']?.toString() ?? '') ??
                DateTime.now(),
          );
          FFAppState().update(() {
            FFAppState().chatMessages = List.from(FFAppState().chatMessages)
              ..add(chatMessage);
            FFAppState().errorMessage = "";
          });
        } else {
          print("Received message data is not a Map: $data");
        }
      } catch (e) {
        print("Error parsing received message: $e");
        FFAppState().update(() {
          FFAppState().errorMessage =
              "Error parsing received message: ${e.toString()}";
        });
      }
    });

    // Listen for errors
    socket.on('error', (data) {
      try {
        print("Server error: $data");
        if (data is Map<String, dynamic>) {
          final errorMessage = data['message']?.toString() ?? 'Unknown error';
          FFAppState().update(() {
            FFAppState().errorMessage = "Server error: $errorMessage";
          });
          if (!registerCompleter.isCompleted &&
              errorMessage.contains('User not found')) {
            registerCompleter.complete("Error: User not found");
          } else if (!registerCompleter.isCompleted &&
              errorMessage.contains('Error registering user')) {
            registerCompleter.complete("Error: Server failed to register user");
          }
        } else {
          print("Error data is not a Map: $data");
        }
      } catch (e) {
        print("Error parsing server error: $e");
        FFAppState().update(() {
          FFAppState().errorMessage =
              "Error parsing server error: ${e.toString()}";
        });
      }
    });

    // Listen for updateOnlineUsers
    socket.on('updateOnlineUsers', (data) {
      try {
        print("Received updateOnlineUsers: $data");
        if (data is List<dynamic>) {
          final userIds =
              data.map((user) => user['id']?.toString() ?? '').toList();
          FFAppState().update(() {
            FFAppState().onlineUsers = userIds;
            FFAppState().errorMessage = "";
          });
          if (!registerCompleter.isCompleted) {
            if (userIds.contains(userId)) {
              registerCompleter.complete("Register successful: User is online");
            } else {
              registerCompleter
                  .complete("Register failed: User not in online users list");
            }
          }
        } else {
          print("updateOnlineUsers data is not a List: $data");
        }
      } catch (e) {
        print("Error parsing updateOnlineUsers: $e");
        FFAppState().update(() {
          FFAppState().errorMessage =
              "Error parsing updateOnlineUsers: ${e.toString()}";
        });
      }
    });

    // Listen for updateChatPairs
    socket.on('updateChatPairs', (data) {
      try {
        print("Received updateChatPairs: $data");
        if (data is List<dynamic>) {
          final chatPairStrings = data.map((pair) {
            final user1Id = pair['user1']?['id']?.toString() ?? 'Unknown';
            final user2Id = pair['user2']?['id']?.toString() ?? 'Unknown';
            return "$user1Id-$user2Id";
          }).toList();
          FFAppState().update(() {
            FFAppState().chatPairs = chatPairStrings;
            FFAppState().errorMessage = "";
          });
        } else {
          print("updateChatPairs data is not a List: $data");
        }
      } catch (e) {
        print("Error parsing updateChatPairs: $e");
        FFAppState().update(() {
          FFAppState().errorMessage =
              "Error parsing updateChatPairs: ${e.toString()}";
        });
      }
    });

    // Connect to the server
    socket.connect();

    // Wait for connection result with a timeout
    await completer.future.timeout(Duration(seconds: 10), onTimeout: () {
      print("Connection timed out after 10 seconds");
      FFAppState().update(() {
        FFAppState().isConnected = false;
        FFAppState().errorMessage = "Connection timed out";
        FFAppState().mainSocket = null;
      });
      socket.disconnect();
      throw "Error initializing socket: Connection timed out";
    });

    // Wait for register response with a timeout
    final registerResult = await registerCompleter.future
        .timeout(Duration(seconds: 5), onTimeout: () {
      print("Register event timed out after 5 seconds");
      FFAppState().update(() {
        FFAppState().errorMessage =
            "Register event timed out: No response from server";
      });
      return "Error: Register event timed out";
    });

    print("Register result: $registerResult");
    return "Socket initialized successfully, $registerResult";
  } catch (e) {
    print("Error initializing socket: $e");
    FFAppState().update(() {
      FFAppState().errorMessage = "Error initializing socket: ${e.toString()}";
      FFAppState().mainSocket = null;
    });
    return "Error initializing socket: ${e.toString()}";
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
