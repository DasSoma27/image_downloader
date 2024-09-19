import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widget/image_view.dart';
import 'splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            height: Get.height,
            width: Get.width,
            child: ImageView("assets/image/map.png", ImageType.asset),
          ),
        );
      },
    );
  }
}
