
import 'package:flutter_fl/Features/Pages/orderpage/binding.dart';
import 'package:flutter_fl/Features/Pages/orderpage/view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../Pages/Fooddetail/binding.dart';
import '../Pages/Fooddetail/view.dart';
import '../Pages/splash/binding.dart';
import '../Pages/splash/view.dart';

class Routes{
static String splashpage ='/splashPage';
static String orderpage ='/orderPage';
static String fooddetailpage ='/fooddetailPage';




}
final getPages = [

  GetPage(
      name: Routes.splashpage,
      page: () => SplashPage(),
      binding: SplashBinding()),
  GetPage(
      name: Routes.orderpage,
      page: () => OrderPage(),
      binding: OrderBinding()),
  GetPage(
      name: Routes.fooddetailpage,
      page: () => FoodDetailPage(),
      binding: ConfirmBinding()),
];
