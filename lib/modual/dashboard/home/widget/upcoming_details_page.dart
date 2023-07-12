import 'package:fantasyarenas/modual/dashboard/cricket_tabs/tab/fantsy_page.dart';
import 'package:fantasyarenas/modual/dashboard/cricket_tabs/tab/squad_page.dart';
import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/assets_path.dart';
import 'package:fantasyarenas/utils/navigation_utils/navigation.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpComingDetailsPage extends StatefulWidget {
  const UpComingDetailsPage({super.key});

  @override
  State<UpComingDetailsPage> createState() => _UpComingDetailsPageState();
}

class _UpComingDetailsPageState extends State<UpComingDetailsPage> {
  @override
  void initState() {
    super.initState();
  }

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(SizeUtils.horizontalBlockSize * 25),
          child: AppBar(
            bottomOpacity: 0.7,
            backgroundColor: AppColor.appBarColor,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigation.pop();
                    },
                    child: Image.asset(AssetsPath.arrow, color: AppColor.textColor, scale: 15)),
                SizedBox(width: SizeUtils.horizontalBlockSize * 2),
                AppText(
                  "${homeController.team1Name} vs ${homeController.team2Name}, ${homeController.matchHeader}",
                  color: AppColor.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeUtils.fSize_15(),
                ),
              ],
            ),
            bottom: TabBar(
              padding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3,
              indicatorColor: AppColor.wifiBtn,
              labelStyle: TextStyle(
                fontSize: SizeUtils.fSize_17(),
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(fontSize: SizeUtils.fSize_15()),
              automaticIndicatorColorAdjustment: true,
              tabs: const [
                Tab(
                  text: "Squad",
                ),
                Tab(
                  text: "Fantasy",
                ),
                Tab(
                  text: "History",
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SquadPage(),
            FantasyPage(),
            Center(
              child: Text("Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
