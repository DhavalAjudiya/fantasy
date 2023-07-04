import 'package:fantasyarenas/modual/dashboard/fantsy/page/fantsy_page.dart';
import 'package:fantasyarenas/modual/dashboard/highlight/page/home_page.dart';
import 'package:fantasyarenas/modual/dashboard/news/page/news_page.dart';
import 'package:fantasyarenas/modual/dashboard/setting/page/setting_page.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/appconfig.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
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
    const FantasyPage(),
    const NewsPage(),
    const SettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: const Padding(
          padding: EdgeInsets.all(6.0),
          child: CircleAvatar(
            minRadius: 4,
            backgroundColor: Colors.grey,
          ),
        ),
        centerTitle: true,
        title: AppText(
          'Fantasy Arenas',
          color: Colors.deepOrange,
          fontWeight: FontWeight.w700,
          fontSize: SizeUtils.fSize_20(),
        ),
        actions: const [
          Icon(
            Icons.search_outlined,
            color: Colors.grey,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
*/

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
            backgroundColor: Colors.grey.withOpacity(0.1),
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.deepOrange,
            unselectedItemColor: AppColor.white,
            selectedLabelStyle: TextStyle(
                color: AppColor.textColor,
                fontSize: SizeUtils.fSize_15(),
                fontWeight: FontWeight.w500),
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
