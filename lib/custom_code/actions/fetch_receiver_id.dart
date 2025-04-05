// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../flutter_flow/flutter_flow_util.dart'; // For FFAppState

Future<String> fetchReceiverId(String userId, String authToken) async {
  try {
    // Step 1: Validate inputs
    if (userId.isEmpty) {
      FFAppState().update(() {
        FFAppState().errorMessage = "Error: userId is empty";
      });
      return "Error: userId is empty";
    }
    if (authToken.isEmpty) {
      FFAppState().update(() {
        FFAppState().errorMessage = "Error: authToken is empty";
      });
      return "Error: authToken is empty";
    }

    // Step 2: Log the request details for debugging
    print(
        "Fetching receiver ID for userId: $userId with authToken: $authToken");

    // Step 3: Verify the authToken using the /public-key endpoint
    final tokenCheckResponse = await http.get(
      Uri.parse('https://chat-api.clothes2wear.com/public-key'),
      headers: {
        'Cookie': 'auth_token=$authToken',
      },
    );
    print(
        "Token check response: ${tokenCheckResponse.statusCode}, ${tokenCheckResponse.body}");
    if (tokenCheckResponse.statusCode != 200) {
      FFAppState().update(() {
        FFAppState().errorMessage =
            "Error validating authToken: Status ${tokenCheckResponse.statusCode}";
      });
      return "Error validating authToken: Status ${tokenCheckResponse.statusCode}";
    }

    // Step 4: Attempt to fetch receiverId using POST request
    print("Attempting POST request to /api/chat/get-receiver");
    final postResponse = await http.post(
      Uri.parse('https://chat-api.clothes2wear.com/api/chat/get-receiver'),
      headers: {
        'Cookie': 'auth_token=$authToken',
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'senderId': userId,
      }),
    );

    if (postResponse.statusCode == 200) {
      final data = jsonDecode(postResponse.body);
      final receiverId = data['receiverId']?.toString() ?? '';
      if (receiverId.isEmpty) {
        FFAppState().update(() {
          FFAppState().errorMessage = "Error: No receiverId in response";
        });
        return "Error: No receiverId in response";
      }
      FFAppState().update(() {
        FFAppState().receiverId = receiverId;
        FFAppState().errorMessage = "";
      });
      return "Receiver ID fetched successfully: $receiverId";
    } else {
      print(
          "POST request failed: ${postResponse.statusCode}, ${postResponse.body}");
    }

    // Step 5: Fallback to GET request if POST fails
    print("Attempting GET request to /api/chat/get-receiver?senderId=$userId");
    final getResponse = await http.get(
      Uri.parse(
          'https://chat-api.clothes2wear.com/api/chat/get-receiver?senderId=$userId'),
      headers: {
        'Cookie': 'auth_token=$authToken',
      },
    );

    if (getResponse.statusCode == 200) {
      final data = jsonDecode(getResponse.body);
      final receiverId = data['receiverId']?.toString() ?? '';
      if (receiverId.isEmpty) {
        FFAppState().update(() {
          FFAppState().errorMessage = "Error: No receiverId in response";
        });
        return "Error: No receiverId in response";
      }
      FFAppState().update(() {
        FFAppState().receiverId = receiverId;
        FFAppState().errorMessage = "";
      });
      return "Receiver ID fetched successfully: $receiverId";
    } else {
      print(
          "GET request failed: ${getResponse.statusCode}, ${getResponse.body}");
      FFAppState().update(() {
        FFAppState().errorMessage =
            "Error fetching receiver ID: Status ${getResponse.statusCode}";
      });
      return "Error fetching receiver ID: Status ${getResponse.statusCode}";
    }
  } catch (e) {
    // Step 6: Handle any unexpected errors
    print("Error fetching receiver ID: $e");
    FFAppState().update(() {
      FFAppState().errorMessage = "Error fetching receiver ID: ${e.toString()}";
    });
    return "Error fetching receiver ID: ${e.toString()}";
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
