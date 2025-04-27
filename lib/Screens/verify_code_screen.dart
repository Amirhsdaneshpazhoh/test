import 'package:flutter/material.dart';
import '../provider/api_service.dart';
import '../provider/auth_service.dart';
import 'home_screen.dart';

class VerifyCodeScreen extends StatefulWidget {
  final String mobile;

  const VerifyCodeScreen({required this.mobile});

  @override
  _VerifyCodeScreenState createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  final _codeController = TextEditingController();
  final _apiService = ApiService();
  final _authService = AuthService();
  bool _isLoading = false;

  Future<void> _verifyCode() async {
    setState(() => _isLoading = true);
    try {
      final response = await _apiService.verifyMobile(
        widget.mobile,
        _codeController.text,
      );
      if (response.status && response.data != null) {
        await _authService.saveToken(response.data!.token);
        if (!mounted) return;
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطا: $e')),
      );
    } finally {
      if (mounted) {
        setState(() => _isLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('تأیید کد')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _codeController,
              decoration: InputDecoration(
                labelText: 'کد تأیید',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _verifyCode,
                    child: Text('تأیید'),
                  ),
          ],
        ),
      ),
    );
  }
}
