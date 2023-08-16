import 'dart:io';

import 'package:fantasyarenas/modual/dashboard/home/page/home_page.dart';
import 'package:fantasyarenas/modual/dashboard/news/page/news_page.dart';
import 'package:fantasyarenas/modual/dashboard/setting/page/setting_page.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/appconfig.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({Key? key}) : super(key: key);

  @override
  State<BottomPage> createState() => _BottomPageState();
}

class _BottomPageState extends State<BottomPage> {
  int pageIndex = 0;

  final pages = [
    HomePage(),
    const NewsPage(),
    const SettingPage(),
  ];

  void getInitialMessage() async {
    RemoteMessage? message = await FirebaseMessaging.instance.getInitialMessage();

    if (message != null) {
      if (message.data["page"] == "home") {
        // Navigation.pushNamed(Routes.homePage);
      }
    }
  }

  @override
  void initState() {
    getInitialMessage();
    FirebaseMessaging.onMessage.listen((message) {});
    FirebaseMessaging.onMessageOpenedApp.listen((message) {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        exit(0);
      },
      child: Scaffold(
        body: ValueListenableBuilder(
          valueListenable: AppConfig.bottomBarValue,
          builder: (BuildContext context, int value, Widget? child) {
            return pages[value];
          },
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: AppConfig.bottomBarValue,
          builder: (BuildContext context, int bValue, _) {
            return BottomNavigationBar(
              elevation: 0,
              backgroundColor: Color(0xff060a13),
              type: BottomNavigationBarType.fixed,
              selectedItemColor: AppColor.white,
              unselectedItemColor: AppColor.white.withOpacity(0.4),
              selectedLabelStyle: TextStyle(
                fontSize: SizeUtils.fSize_14(),
                fontWeight: FontWeight.w500,
              ),
              currentIndex: bValue,
              showUnselectedLabels: true,
              onTap: (value) async {
                AppConfig.bottomBarValue.value = value;
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    SFSymbols.house_fill,
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    SFSymbols.doc_text,
                  ),
                  label: "News",
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    SFSymbols.gear_alt,
                  ),
                  label: "Setting",
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
