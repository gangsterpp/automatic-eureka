import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<bool> sendFlashCallVerification(BuildContext context, String phoneNumber) async {
  const apiUrl = String.fromEnvironment('API_BASE_URL');
  const authorizationToken = String.fromEnvironment('API_TOKEN');
  debugPrint("API Token: $authorizationToken");

  final requestBody = json.encode([
    {'channelType': 'FLASHCALL', 'senderName': 'FLASHCALL', 'destination': "79663032253", 'content': '1234'},
  ]);

  try {
    final response = await http.post(
      Uri.parse('$apiUrl/v1/verifier/send'),
      headers: {'Authorization': 'Basic $authorizationToken', 'Content-Type': 'application/json'},
      body: requestBody,
    );

    if (response.statusCode == 200) {
      debugPrint('Verification code sent successfully!');
      return true;
    } else {
      debugPrint('Failed to send verification code: ${response.body}');
      return false;
    }
  } catch (e) {
    debugPrint('An error occurred: $e');
    return false;
  }
}
