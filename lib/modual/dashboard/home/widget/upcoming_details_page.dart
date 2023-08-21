import 'package:fantasyarenas/modual/dashboard/cricket_tabs/tab/fantsy_page.dart';
import 'package:fantasyarenas/modual/dashboard/cricket_tabs/tab/info_page.dart';
import 'package:fantasyarenas/modual/dashboard/cricket_tabs/tab/squad_page.dart';
import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/res/app_colors.dart';
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
        backgroundColor: AppColor.backGroundColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(SizeUtils.horizontalBlockSize * 18),
          child: AppBar(
            // bottomOpacity: 0.7,
            elevation: 0,
            backgroundColor: AppColor.backGroundColor,
            automaticallyImplyLeading: false,
            centerTitle: true,
            leading: GestureDetector(
              onTap: () {
                Navigation.pop();
              },
              child: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: SizeUtils.fSize_21(),
              ),
            ),
            title: AppText(
              "${homeController.team1Name} vs ${homeController.team2Name}",
              color: AppColor.white,
              fontWeight: FontWeight.w600,
              fontSize: SizeUtils.fSize_17(),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColor.backGroundColor,
              ),
              child: TabBar(
                indicatorPadding: EdgeInsets.only(bottom: SizeUtils.horizontalBlockSize * 3),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: AppColor.white,
                unselectedLabelColor: AppColor.white.withOpacity(0.5),
                labelColor: AppColor.white,
                tabs: const [
                  Tab(
                    text: "Fantasy",
                  ),
                  Tab(
                    text: "Squad",
                  ),
                  Tab(
                    text: "Match Info",
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  FantasyPage(),
                  SquadPage(),
                  InfoPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
