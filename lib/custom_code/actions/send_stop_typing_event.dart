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

Future<void> sendStopTypingEvent(String userId, String receiverId) async {
  try {
    // Retrieve the socket from FFAppState
    final socket = FFAppState().mainSocket as IO.Socket?;

    // Check if the socket is initialized and connected
    if (socket == null || !FFAppState().isConnected || !socket.connected) {
      print("Error: Socket not initialized or not connected");
      return;
    }

    // Emit the stop typing event to the server
    socket.emit('typing', {
      'senderId': userId,
      'receiverId': receiverId,
      'isTyping': false,
    });

    print(
        "Stop typing event emitted for user: $userId to receiver: $receiverId");
  } catch (e) {
    print("Error emitting stop typing event: $e");
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
