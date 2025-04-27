import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  static const storage = FlutterSecureStorage();


  Future<void> saveToken(String token) async {
    await storage.write(key: 'auth_token', value: token);
  }


  Future<String?> getToken() async {
    return await storage.read(key: 'auth_token');
  }


  Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null && token.isNotEmpty;
  }


}
