import 'package:flutter_fl/Features/Routes/routes.dart';
import 'package:get/get.dart';

class SplashLogic extends GetxController {
  @override
  void onInit() {
    GoToIntroPage();
    super.onInit();
  }

  Future GoToIntroPage() async {
    await Future.delayed(const Duration(seconds: 3)).whenComplete(() {
      Get.offAllNamed(Routes.loginscreen);
    });
  }
}
