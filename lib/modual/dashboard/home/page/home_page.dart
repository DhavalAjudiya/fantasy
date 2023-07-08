import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/modual/dashboard/home/widget/tabs/cricket.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/assets_path.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColor.backgroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(SizeUtils.horizontalBlockSize * 29),
          child: AppBar(
            bottomOpacity: 0.7,
            backgroundColor: AppColor.appBarColor,
            automaticallyImplyLeading: false,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                    AssetsPath.fantasy,
                  ),
                ),
                const AppText(
                  "FantasyArena",
                  color: AppColor.white,
                  fontWeight: FontWeight.bold,
                ),
                SizedBox(width: SizeUtils.horizontalBlockSize * 5),
                // const Icon(Icons.ac_unit)
              ],
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
                  text: "Cricket",
                ),
                Tab(
                  text: "Football",
                ),
                Tab(
                  text: "Kabaddi",
                )
              ],
            ),
          ),
        ),
        body: TabBarView(
          children: [
            CricketPage(),
            Center(
              child: Text("Calls"),
            ),
            Center(
              child: Text("Settings"),
            ),
          ],
        ),
      ),
    );
  }
}
