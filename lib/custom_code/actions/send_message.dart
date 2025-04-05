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

/// Sends a message via socket, assuming the message is already encrypted.
/// This function expects the `message` parameter to be pre-encrypted by a separate custom action.
Future<String> sendMessage(
    String senderId, String receiverId, String message) async {
  final completer = Completer<String>();

  try {
    // Validate inputs
    if (senderId.isEmpty || receiverId.isEmpty || message.isEmpty) {
      FFAppState().update(() {
        FFAppState().errorMessage =
            "Error sending message: senderId, receiverId, or message is empty";
      });
      return "Error sending message: Missing required fields";
    }

    // Retrieve the socket from FFAppState
    final socket = FFAppState().mainSocket as IO.Socket?;

    // Log socket state for debugging
    print("Socket: $socket, isConnected: ${FFAppState().isConnected}, "
        "socket.connected: ${socket?.connected}");

    // Check if the socket is initialized and connected
    if (socket == null || !FFAppState().isConnected || !socket.connected) {
      FFAppState().update(() {
        FFAppState().errorMessage = "Socket not initialized or not connected";
      });
      return "Error: Socket not initialized or not connected";
    }

    // Prepare the message payload with the already encrypted message
    final messagePayload = {
      'senderId': senderId,
      'receiverId': receiverId,
      'message': message, // Assuming message is already encrypted
    };

    // Emit the sendMessage event
    print("Emitting sendMessage with payload: $messagePayload");
    socket.emit('sendMessage', messagePayload);

    // Listen for confirmation from the server
    socket.once('messageSent', (data) {
      print("Received messageSent event with data: $data");
      try {
        if (data is Map<String, dynamic>) {
          final chatMessage = ChatMessageStruct(
            id: data['id']?.toString() ?? '',
            senderId: data['senderId']?.toString() ?? '',
            receiverId: data['receiverId']?.toString() ?? '',
            message: data['message']?.toString() ?? '',
            createdAt: DateTime.tryParse(data['createdAt']?.toString() ?? '') ??
                DateTime.now(),
            isUser: true,
          );
          FFAppState().update(() {
            FFAppState().chatMessages = List.from(FFAppState().chatMessages)
              ..add(chatMessage);
            FFAppState().errorMessage = "";
          });
          if (!completer.isCompleted) {
            completer.complete("Message sent successfully");
          }
        } else {
          print("messageSent data is not a Map: $data");
          if (!completer.isCompleted) {
            completer.complete("Error: Invalid message confirmation data");
          }
        }
      } catch (e) {
        print("Error parsing messageSent: $e");
        if (!completer.isCompleted) {
          completer.complete("Error parsing message confirmation: $e");
        }
      }
    });

    // Listen for server errors
    socket.once('error', (data) {
      print("Received error event with data: $data");
      try {
        if (data is Map<String, dynamic>) {
          final errorMessage = data['message']?.toString() ?? 'Unknown error';
          FFAppState().update(() {
            FFAppState().errorMessage = "Server error: $errorMessage";
          });
          if (!completer.isCompleted) {
            completer.complete("Error: $errorMessage");
          }
        } else {
          print("Error data is not a Map: $data");
          if (!completer.isCompleted) {
            completer.complete("Error: Invalid error data");
          }
        }
      } catch (e) {
        print("Error parsing server error: $e");
        if (!completer.isCompleted) {
          completer.complete("Error parsing server error: $e");
        }
      }
    });

    // Listen for waitMessage (e.g., staff is busy)
    socket.once('waitMessage', (data) {
      print("Received waitMessage: ${data['message']}");
      FFAppState().update(() {
        FFAppState().errorMessage = data['message'];
      });
      if (!completer.isCompleted) {
        completer.complete("Please wait: Staff is busy");
      }
    });

    // Wait for the result with a timeout
    return await completer.future.timeout(Duration(seconds: 15), onTimeout: () {
      print("Send message timed out after 15 seconds");
      FFAppState().update(() {
        FFAppState().errorMessage = "Message send timed out";
      });
      return "Error: Timed out after 15 seconds";
    });
  } catch (e) {
    print("Error sending message: $e");
    FFAppState().update(() {
      FFAppState().errorMessage = "Error sending message: $e";
    });
    return "Error sending message: $e";
  }
}

// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
