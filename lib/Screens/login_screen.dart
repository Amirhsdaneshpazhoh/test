import 'package:flutter/material.dart';
import '../provider/api_service.dart';
import '../provider/auth_service.dart';
import 'verify_code_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _mobileController = TextEditingController();
  final _apiService = ApiService();
  bool _isLoading = false;

  Future<void> _sendCode() async {
    if (_mobileController.text.isEmpty) return;

    setState(() => _isLoading = true);
    try {
      final response = await _apiService.sendCode(_mobileController.text);
      if (response.status) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                Text('${response.message}\nکد تأیید: ${response.data?.token}'),
            duration: Duration(seconds: 5),
          ),
        );
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                VerifyCodeScreen(mobile: _mobileController.text),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('خطا در ارسال کد')),
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
      appBar: AppBar(title: Text('ورود')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _mobileController,
              decoration: InputDecoration(
                labelText: 'شماره موبایل',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 16),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: _sendCode,
                    child: Text('ارسال کد'),
                  ),
          ],
        ),
      ),
    );
  }
}
