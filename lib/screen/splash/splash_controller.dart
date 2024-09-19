import 'package:get/get.dart';

import '../../route/app_route.dart';

class SplashController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();

    Future.delayed(
      const Duration(seconds: 2),
      () async {
        Get.offNamed(AppRouteGenerate.home);
      },
    );
  }
}
