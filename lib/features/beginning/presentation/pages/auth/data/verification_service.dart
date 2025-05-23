import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class VerificationService {
  static const apiUrl = String.fromEnvironment('API_BASE_URL');

  Future<String?> sendVerificationCode(
    String phoneNumber, {
    String? gatewayId,
    String? channelType,
    String? destination,
    Map<String, String>? substitutions,
  }) async {
    const token = String.fromEnvironment('API_TOKEN');

    final headers = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};

    final body = jsonEncode({
      if (gatewayId != null) 'gatewayId': gatewayId,
      if (channelType != null) 'channelType': channelType,
      if (destination != null) 'destination': destination,
      if (substitutions != null) 'substitutions': substitutions,
    });

    try {
      final response = await http.post(Uri.parse('$apiUrl/api/v1/message'), headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final uuid = responseBody['uuid'];
        debugPrint('Verification code sent successfully. UUID: $uuid');
        return uuid;
      } else {
        debugPrint('Failed to send code. Status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('Error during verification code sending: $e');
      return null;
    }
  }

  Future<String?> checkVerificationCode(String uuid, String code) async {
    const token = String.fromEnvironment('API_TOKEN');

    final headers = {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'};

    final body = jsonEncode({'uuid': uuid, 'code': code});

    try {
      final response = await http.post(Uri.parse('$apiUrl/v1/flashcall-conversion'), headers: headers, body: body);

      if (response.statusCode == 200) {
        final responseBody = jsonDecode(response.body);
        final status = responseBody['status'];
        debugPrint('Verification status: $status');
        return status;
      } else {
        debugPrint('Failed to verify code. Status code: ${response.statusCode}');
        debugPrint('Response body: ${response.body}');
        return null;
      }
    } catch (e) {
      debugPrint('Error during verification code checking: $e');
      return null;
    }
  }
}
