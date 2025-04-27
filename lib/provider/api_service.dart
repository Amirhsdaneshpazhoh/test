import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiService {
  static const String baseUrl = 'https://papachi.niasa.io/api';


  Future<SendCodeResponse> sendCode(String mobile) async {
    try {
      print('Sending code to mobile: $mobile');
      final response = await http.post(
        Uri.parse('$baseUrl/auth/send/code'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(SendCodeRequest(mobile: mobile).toJson()),
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return SendCodeResponse(
          status: jsonResponse['status'] ?? false,
          message: jsonResponse['message'] ?? '',
          data: jsonResponse['data'] != null
              ? SendCodeData.fromJson(jsonResponse['data'])
              : null,
        );
      } else {
        throw Exception(
            'Failed to send code: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error in sendCode: $e');
      throw Exception('Error sending code: $e');
    }
  }


  Future<VerifyMobileResponse> verifyMobile(String mobile, String code) async {
    try {
      print('Verifying mobile: $mobile with code: $code');
      final response = await http.post(
        Uri.parse('$baseUrl/auth/verify'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode(
            VerifyMobileRequest(mobile: mobile, code: code).toJson()),
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        return VerifyMobileResponse(
          status: jsonResponse['status'] ?? false,
          message: jsonResponse['message'] ?? '',
          data: jsonResponse['data'] != null
              ? VerifyMobileData.fromJson(jsonResponse['data'])
              : null,
        );
      } else {
        throw Exception(
            'Failed to verify code: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error in verifyMobile: $e');
      throw Exception('Error verifying code: $e');
    }
  }
}


class SendCodeRequest {
  final String mobile;

  SendCodeRequest({required this.mobile});

  Map<String, dynamic> toJson() => {'mobile': mobile};
}


class SendCodeResponse {
  final bool status;
  final String message;
  final SendCodeData? data;

  SendCodeResponse({
    required this.status,
    required this.message,
    this.data,
  });
}

class SendCodeData {
  final bool isNewUser;
  final bool profileStatus;
  final String token;

  SendCodeData({
    required this.isNewUser,
    required this.profileStatus,
    required this.token,
  });

  factory SendCodeData.fromJson(Map<String, dynamic> json) {
    return SendCodeData(
      isNewUser: json['isNewUser'] ?? false,
      profileStatus: json['profileStatus'] ?? false,
      token: (json['token'] ?? '').toString(),
    );
  }
}


class VerifyMobileRequest {
  final String mobile;
  final String code;

  VerifyMobileRequest({required this.mobile, required this.code});

  Map<String, dynamic> toJson() => {'mobile': mobile, 'code': code};
}

class VerifyMobileResponse {
  final bool status;
  final String message;
  final VerifyMobileData? data;

  VerifyMobileResponse({
    required this.status,
    required this.message,
    this.data,
  });
}

class VerifyMobileData {
  final String token;

  VerifyMobileData({required this.token});

  factory VerifyMobileData.fromJson(Map<String, dynamic> json) {
    return VerifyMobileData(token: json['token'] ?? '');
  }
}
