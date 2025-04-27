class SendCodeRequest {
  final String mobile;

  SendCodeRequest({required this.mobile});

  Map<String, dynamic> toJson() => {
        'mobile': mobile,
      };
}

class SendCodeResponse {
  final bool success;
  final String message;

  SendCodeResponse({required this.success, required this.message});

  factory SendCodeResponse.fromJson(Map<String, dynamic> json) {
    return SendCodeResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
    );
  }
}

class VerifyMobileRequest {
  final String mobile;
  final String code;

  VerifyMobileRequest({required this.mobile, required this.code});

  Map<String, dynamic> toJson() => {
        'mobile': mobile,
        'code': code,
      };
}

class VerifyMobileResponse {
  final bool success;
  final String token;
  final String message;

  VerifyMobileResponse({
    required this.success,
    required this.token,
    required this.message,
  });

  factory VerifyMobileResponse.fromJson(Map<String, dynamic> json) {
    return VerifyMobileResponse(
      success: json['success'] ?? false,
      token: json['token'] ?? '',
      message: json['message'] ?? '',
    );
  }
}
