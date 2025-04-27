class SendCodeRequest {
  final String mobile;

  SendCodeRequest({required this.mobile});

  Map<String, dynamic> toJson() => {'mobile': mobile};
}

class SendCodeResponse {
  final bool status;

  SendCodeResponse({required this.status});

  factory SendCodeResponse.fromJson(Map<String, dynamic> json) {
    return SendCodeResponse(status: json['status'] ?? false);
  }
}

class VerifyMobileRequest {
  final String mobile;
  final String code;

  VerifyMobileRequest({required this.mobile, required this.code});

  Map<String, dynamic> toJson() => {'mobile': mobile, 'code': code};
}

class VerifyMobileResponse {
  final String token;

  VerifyMobileResponse({required this.token});

  factory VerifyMobileResponse.fromJson(Map<String, dynamic> json) {
    return VerifyMobileResponse(token: json['token'] ?? '');
  }
}
