import 'package:fantasyarenas/dashboard/home_page/widget/highlights_page..dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../dashboard/home_page/page/home_screen.dart';
import '../../dashboard/splash.dart';

mixin Routes {
  static const defaultTransition = Transition.fadeIn;
  static String splashPage = "/splashPage";
  static String homePage = "/homePage";
  static String highLightsPage = "/highLightsPage";

  static List<GetPage<dynamic>> routes = [
    GetPage<dynamic>(
      name: splashPage,
      page: () => const SplashPage(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: homePage,
      page: () => const HomeScreen(),
      transition: Transition.downToUp,
      curve: Curves.fastEaseInToSlowEaseOut,
      transitionDuration: const Duration(milliseconds: 1100),
    ),
    GetPage<dynamic>(
      name: highLightsPage,
      page: () => const HighLightsPage(),
      transition: Transition.downToUp,
      curve: Curves.fastEaseInToSlowEaseOut,
      transitionDuration: const Duration(milliseconds: 1100),
    ),
  ];
}
