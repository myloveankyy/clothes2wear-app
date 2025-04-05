// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/api.dart';
import 'package:asn1lib/asn1lib.dart';
import 'dart:convert'; // For base64Decode
import '../../flutter_flow/flutter_flow_util.dart'; // For FFAppState

Future<String> encryptMessage(String message, String publicKey) async {
  try {
    // Check if the message or public key is empty
    if (message.isEmpty || publicKey.isEmpty) {
      FFAppState().update(() {
        FFAppState().errorMessage =
            "Error encrypting message: Message or public key is empty";
      });
      return "Error encrypting message: Message or public key is empty";
    }

    // Parse the public key (remove PEM headers and newlines)
    final publicKeyPem = publicKey
        .replaceAll('-----BEGIN PUBLIC KEY-----', '')
        .replaceAll('-----END PUBLIC KEY-----', '')
        .replaceAll('\n', '');
    final publicKeyDer = base64Decode(publicKeyPem);

    // Parse the DER-encoded public key (SubjectPublicKeyInfo structure)
    final parser = ASN1Parser(publicKeyDer);
    final topSeq = parser.nextObject() as ASN1Sequence;

    // The second element should be an ASN1BitString containing the RSA key
    if (topSeq.elements.length < 2) {
      FFAppState().update(() {
        FFAppState().errorMessage =
            "Error encrypting message: Invalid public key structure";
      });
      return "Error encrypting message: Invalid public key structure";
    }
    final bitString = topSeq.elements[1] as ASN1BitString;

    // Parse the bit string content (which is another ASN1Sequence)
    final bitStringParser = ASN1Parser(bitString.contentBytes());
    final rsaSeq = bitStringParser.nextObject() as ASN1Sequence;

    // Extract modulus and exponent
    if (rsaSeq.elements.length < 2) {
      FFAppState().update(() {
        FFAppState().errorMessage =
            "Error encrypting message: Invalid RSA key structure";
      });
      return "Error encrypting message: Invalid RSA key structure";
    }
    final modulus = (rsaSeq.elements[0] as ASN1Integer).valueAsBigInteger!;
    final exponent = (rsaSeq.elements[1] as ASN1Integer).valueAsBigInteger!;
    final rsaPublicKey = RSAPublicKey(modulus, exponent);

    // Initialize the encrypter with RSA and OAEP padding
    final encrypter = Encrypter(RSA(
      publicKey: rsaPublicKey,
      encoding: RSAEncoding.OAEP,
    ));

    // Encrypt the message
    final encrypted = encrypter.encrypt(message);
    final encryptedBase64 = encrypted.base64;

    FFAppState().update(() {
      FFAppState().errorMessage = "Encryption successful: $encryptedBase64";
    });
    return encryptedBase64; // Return the encrypted message in base64 format
  } catch (e) {
    FFAppState().update(() {
      FFAppState().errorMessage = "Error encrypting message: ${e.toString()}";
    });
    return "Error encrypting message: ${e.toString()}";
  }
}
// Set your action name, define your arguments and return parameter,
// and then add the boilerplate code using the green button on the right!
