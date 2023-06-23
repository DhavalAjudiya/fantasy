import 'package:get/get.dart';
import '../../dashboard/home_page/home_screen.dart';
import '../../dashboard/splash.dart';

mixin Routes {
  static const defaultTransition = Transition.fadeIn;
  static String splashPage = "/splashPage";
  static String homePage = "/homePage";

  static List<GetPage<dynamic>> routes = [
    GetPage<dynamic>(
      name: splashPage,
      page: () => const SplashPage(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: homePage,
      page: () => const HomeScreen(),
      transition: defaultTransition,
    ),
  ];
}
