import 'package:fantasyarenas/modual/dashboard/bottom_bar/bottom_page.dart';
import 'package:fantasyarenas/modual/dashboard/home/page/home_page.dart';
import 'package:fantasyarenas/modual/dashboard/home/widget/upcoming_details_page.dart';
import 'package:fantasyarenas/modual/dashboard/news/widget/onenews_page.dart';
import 'package:fantasyarenas/modual/dashboard/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin Routes {
  static const defaultTransition = Transition.fadeIn;
  static String splashPage = "/splashPage";
  static String pages = "/pages";
  static String homePage = "/homePage";
  static String singInPage = "/singInPage";
  static String oneNewsPage = "/oneNewsPage";
  static String upComingDetailsPage = "/upComingDetailsPage";

  static List<GetPage<dynamic>> routes = [
    GetPage<dynamic>(
      name: splashPage,
      page: () => const SplashPage(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: pages,
      page: () => const BottomPage(),
      transition: Transition.downToUp,
      curve: Curves.fastLinearToSlowEaseIn,
      transitionDuration: const Duration(milliseconds: 1100),
    ),
    GetPage<dynamic>(
      name: homePage,
      page: () => HomePage(),
      transition: Transition.downToUp,
      curve: Curves.fastLinearToSlowEaseIn,
      transitionDuration: const Duration(milliseconds: 1100),
    ),
    GetPage<dynamic>(
      name: oneNewsPage,
      page: () => OneNewsPage(),
      transition: Transition.downToUp,
      curve: Curves.fastLinearToSlowEaseIn,
      transitionDuration: const Duration(milliseconds: 1100),
    ),
    GetPage<dynamic>(
      name: upComingDetailsPage,
      page: () => UpComingDetailsPage(),
      transition: defaultTransition,
      // curve: Curves.fastLinearToSlowEaseIn,
      // transitionDuration: const Duration(milliseconds: 1100),
    ),
  ];
}
