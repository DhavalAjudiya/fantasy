import 'package:fantasyarenas/modual/dashboard/cricket_tabs/cricket.dart';
import 'package:fantasyarenas/modual/dashboard/cricket_tabs/football_page.dart';
import 'package:fantasyarenas/modual/dashboard/cricket_tabs/tab/fantasypoint_page.dart';
import 'package:fantasyarenas/modual/dashboard/cricket_tabs/tab/matchinfo_page.dart';
import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/assets_path.dart';
import 'package:fantasyarenas/utils/navigation_utils/navigation.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedMatchPage extends StatelessWidget {
  CompletedMatchPage({super.key});
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(SizeUtils.horizontalBlockSize * 25),
          child: AppBar(
            bottomOpacity: 0.7,
            backgroundColor: AppColor.appBarColor,
            automaticallyImplyLeading: false,
            centerTitle: true,
            leading: Padding(
              padding: EdgeInsets.only(top: SizeUtils.horizontalBlockSize * 5),
              child: GestureDetector(
                onTap: () {
                  Navigation.pop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: SizeUtils.fSize_21(),
                ),
              ),
            ),
            title: AppText(
              "${homeController.team1Name} vs ${homeController.team2Name}",
              color: AppColor.textColor,
              fontWeight: FontWeight.bold,
              fontSize: SizeUtils.fSize_15(),
            ),
            bottom: TabBar(
              padding: EdgeInsets.zero,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorWeight: 3,
              indicatorColor: AppColor.white,
              labelStyle: TextStyle(
                fontSize: SizeUtils.fSize_17(),
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(fontSize: SizeUtils.fSize_15()),
              automaticIndicatorColorAdjustment: true,
              tabs: const [
                Tab(
                  text: "Match Info",
                ),
                Tab(
                  text: "Fantasy Point",
                ),
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            MatchInfoPage(),
            FantasyPointPage(),
          ],
        ),
      ),
    );
  }
}
