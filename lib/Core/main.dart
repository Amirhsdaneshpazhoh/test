import 'package:flutter/material.dart';
import 'package:flutter_fl/Screens/splash/view.dart';
import 'package:get/get.dart';

import '../Features/Routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: getPages,
      initialRoute: Routes.splashpage,
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      theme: ThemeData(fontFamily: 'Vazir'),
    );
  }
}
