import 'package:get/get.dart';
import '../../Routes/routes.dart';
import '../orderpage/view.dart';

class SplashLogic extends GetxController {
  @override
  void onInit() {
    GoToIntroPage();
    super.onInit();
  }

  Future GoToIntroPage() async {
    await Future.delayed(const Duration(seconds: 3)).whenComplete(() {
      Get.offAllNamed(Routes.orderpage);
    });
  }
}
