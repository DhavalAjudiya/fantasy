import 'package:fantasyarenas/modual/dashboard/cricket_tabs/cricket.dart';
import 'package:fantasyarenas/modual/dashboard/cricket_tabs/football_page.dart';
import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/modual/dashboard/kabaddi/page/kabaddi_home_page.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/assets_path.dart';
import 'package:fantasyarenas/utils/analytics.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    FirebaseAnalyticsUtils.sendCurrentScreen(FirebaseAnalyticsUtils.home);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(SizeUtils.horizontalBlockSize * 26),
        child: AppBar(
          bottomOpacity: 0.7,
          backgroundColor: AppColor.appBarColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: const Padding(
              padding: EdgeInsets.all(5.0),
              child: CircleAvatar(backgroundImage: AssetImage("assets/image/Arenas.png"))),
          title: const AppText(
            "Fantasy Arena",
            color: AppColor.white,
            fontWeight: FontWeight.bold,
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(SizeUtils.horizontalBlockSize * 5),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeUtils.horizontalBlockSize * 3,
                  vertical: SizeUtils.horizontalBlockSize * 0.5),
              child: AppText(
                textAlign: TextAlign.center,
                "Teams and Prediction For Fantasy Sports on Dream11 App and other multiple Platform",
                color: AppColor.textColor,
                fontSize: SizeUtils.fSize_12(),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          /*     title: Row(
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage("assets/image/Arenas.png"),
              ),
              SizedBox(width: SizeUtils.horizontalBlockSize * 5),

              const AppText(
                "Fantasy Arena",
                color: AppColor.white,
                fontWeight: FontWeight.bold,
              ),
              // const Icon(Icons.ac_unit)
            ],
          ),*/
          /*        bottom: TabBar(
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
          ),*/
        ),
      ),
      body: CricketPage(),
      // body: TabBarView(
      //   children: [
      //     CricketPage(),
      //     KabaddiHomePage(),
      //   ],
      // ),
    );
  }
}
