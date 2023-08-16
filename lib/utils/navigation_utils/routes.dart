import 'package:fantasyarenas/modual/dashboard/bottom_bar/bottom_page.dart';
import 'package:fantasyarenas/modual/dashboard/cricket_tabs/tab/fantasypoint_page.dart';
import 'package:fantasyarenas/modual/dashboard/cricket_tabs/tab/matchinfo_page.dart';
import 'package:fantasyarenas/modual/dashboard/cricket_tabs/tab/temaImage_page.dart';
import 'package:fantasyarenas/modual/dashboard/home/page/home_page.dart';
import 'package:fantasyarenas/modual/dashboard/home/widget/completed_match_details.dart';
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
  static String teamImagePage = "/teamImagePage";
  static String completedMatchPage = "/completedMatchPage";
  static String fantasyPointPage = "/fantasyPointPage";
  static String completedMatchDetailsPage = "/completedMatchDetailsPage";

  static List<GetPage<dynamic>> routes = [
    GetPage<dynamic>(
      name: splashPage,
      page: () => const SplashPage(),
      transition: defaultTransition,
    ),
    GetPage<dynamic>(
      name: pages,
      page: () => const BottomPage(),
      transition: Transition.cupertino,
      curve: Curves.fastLinearToSlowEaseIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage<dynamic>(
      name: homePage,
      page: () => HomePage(),
      transition: Transition.downToUp,
      curve: Curves.fastLinearToSlowEaseIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage<dynamic>(
      name: oneNewsPage,
      page: () => OneNewsPage(),
      transition: Transition.downToUp,
      curve: Curves.fastLinearToSlowEaseIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage<dynamic>(
      name: upComingDetailsPage,
      page: () => const UpComingDetailsPage(),
      transition: defaultTransition,
      curve: Curves.fastLinearToSlowEaseIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage<dynamic>(
      name: completedMatchDetailsPage,
      page: () => const CompletedMatchDetailsPage(),
      transition: defaultTransition,
      curve: Curves.fastLinearToSlowEaseIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage<dynamic>(
      name: teamImagePage,
      page: () => TeamImagePage(),
      transition: Transition.downToUp,
      curve: Curves.fastLinearToSlowEaseIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage<dynamic>(
      name: completedMatchPage,
      page: () => MatchInfoPage(),
      transition: Transition.downToUp,
      curve: Curves.fastLinearToSlowEaseIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
    GetPage<dynamic>(
      name: fantasyPointPage,
      page: () => FantasyPointPage(),
      transition: Transition.downToUp,
      curve: Curves.fastLinearToSlowEaseIn,
      transitionDuration: const Duration(milliseconds: 700),
    ),
  ];
}
