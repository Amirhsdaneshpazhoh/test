import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_svg/flutter_svg.dart';

import '../../../generated/assets.dart';
import 'logic.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashLogic>(
      init: SplashLogic(),
      builder: (controller) => Scaffold(
        body: Stack(
          children: [
            Center(
                child: SvgPicture.asset(
              Assets.assetsSplashlogo,
            )),
          ],
        ),
      ),
    );
  }
}
