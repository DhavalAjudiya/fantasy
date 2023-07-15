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
          preferredSize: Size.fromHeight(SizeUtils.horizontalBlockSize * 18),
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
            title: Column(
              children: [
                SizedBox(
                  height: SizeUtils.horizontalBlockSize * 4,
                ),
                AppText(
                  "${homeController.team1Name} vs ${homeController.team2Name}",
                  color: AppColor.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeUtils.fSize_15(),
                ),
                AppText(
                  "${homeController.matchHeader}",
                  color: AppColor.textColor,
                  fontWeight: FontWeight.bold,
                  fontSize: SizeUtils.fSize_15(),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              height: SizeUtils.screenHeight * 0.07,
              decoration: const BoxDecoration(
                color: Color(0xffFFF1DC),
              ),
              child: TabBar(
                padding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.label,
                indicatorWeight: 3,
                indicatorColor: AppColor.appBarColor,
                unselectedLabelColor: AppColor.appBarColor.withOpacity(0.7),
                labelColor: AppColor.appBarColor,
                labelStyle: TextStyle(
                  fontSize: SizeUtils.fSize_18(),
                  fontWeight: FontWeight.bold,
                ),
                unselectedLabelStyle: TextStyle(
                  fontSize: SizeUtils.fSize_17(),
                  fontWeight: FontWeight.bold,
                ),
                automaticIndicatorColorAdjustment: true,
                tabs: const [
                  Tab(
                    text: "Fantasy",
                  ),
                  Tab(
                    text: "Squad",
                  ),
                  Tab(
                    text: "History",
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FantasyPage(),
                  SquadPage(),
                  const Center(
                    child: Text("Settings"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
