import 'package:flutter_fl/Screens/login_screen.dart';
import 'package:flutter_fl/Screens/splash/view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class Routes {
  static String splashpage = '/splashPage';
  static String orderpage = '/orderPage';
  static String fooddetailpage = '/fooddetailPage';
  static String loginscreen = '/LoginScreen';
}

final getPages = [
  GetPage(
    name: Routes.splashpage,
    page: () => SplashPage(),
  ),
  GetPage(
    name: Routes.loginscreen,
    page: () => LoginScreen(),
  )
];
