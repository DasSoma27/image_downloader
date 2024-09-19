import 'package:get/get.dart';
import '../screen/home/home_screen.dart';
import '../screen/splash/splash_screen.dart';

class AppRouteGenerate {
  static String splash = "/";
  static String home = "/home";

  static List<GetPage> screen = [
    GetPage(name: splash, page: () => const SplashScreen()),
    GetPage(name: home, page: () => HomeScreen()),
  ];
}
