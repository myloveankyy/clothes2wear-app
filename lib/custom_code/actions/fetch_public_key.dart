// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:http/http.dart' as http;
import '../../flutter_flow/flutter_flow_util.dart'; // For FFAppState
import 'dart:convert';

Future<String> fetchPublicKey(String authToken) async {
  try {
    // Validate input
    if (authToken.isEmpty) {
      FFAppState().update(() {
        FFAppState().errorMessage =
            "Error fetching public key: authToken is empty";
      });
      return "Error fetching public key: authToken is empty";
    }

    // Send GET request to fetch public key
    final response = await http.get(
      Uri.parse('https://chat-api.clothes2wear.com/public-key'),
      headers: {
        'Cookie': 'auth_token=$authToken',
      },
    );

    if (response.statusCode == 200) {
      String publicKey = response.body; // The PEM string
      // Store the public key in AppState
      FFAppState().update(() {
        FFAppState().publicKey = publicKey;
        FFAppState().errorMessage = "";
      });
      return "Public key fetched successfully";
    } else {
      FFAppState().update(() {
        FFAppState().errorMessage =
            "Error fetching public key: Status ${response.statusCode}";
      });
      return "Error fetching public key: Status ${response.statusCode}";
    }
  } catch (e) {
    FFAppState().update(() {
      FFAppState().errorMessage = "Error fetching public key: ${e.toString()}";
    });
    return "Error fetching public key: ${e.toString()}";
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
