import 'package:fantasyarenas/modual/dashboard/fantsy/page/fantsy_page.dart';
import 'package:fantasyarenas/modual/dashboard/home/page/Old_home_page.dart';
import 'package:fantasyarenas/modual/dashboard/home/page/home_page.dart';
import 'package:fantasyarenas/modual/dashboard/news/page/news_page.dart';
import 'package:fantasyarenas/modual/dashboard/setting/page/setting_page.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/appconfig.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
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
    const HomePage(),
    const FantasyPage(),
    const NewsPage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            backgroundColor: const Color(0xff7d98a1),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: AppColor.appBarColor,
            unselectedItemColor: AppColor.white.withOpacity(0.4),
            selectedLabelStyle: TextStyle(
              fontSize: SizeUtils.fSize_15(),
              fontWeight: FontWeight.w600,
            ),
            currentIndex: bValue,
            showUnselectedLabels: true,
            onTap: (value) async {
              AppConfig.bottomBarValue.value = value;
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(SFSymbols.house_fill),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(SFSymbols.shield),
                label: "Fantsy",
              ),
              BottomNavigationBarItem(
                icon: Icon(SFSymbols.doc_text),
                label: "News",
              ),
              BottomNavigationBarItem(
                icon: Icon(SFSymbols.gear_alt),
                label: "Setting",
              ),
            ],
          );
        },
      ),
    );
  }
}
