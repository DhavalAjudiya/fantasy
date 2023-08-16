import 'package:fantasyarenas/modual/dashboard/cricket_tabs/tab/fantasyCenter.dart';
import 'package:fantasyarenas/modual/dashboard/cricket_tabs/tab/matchinfo_page.dart';
import 'package:fantasyarenas/modual/dashboard/cricket_tabs/tab/score_page.dart';
import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/utils/navigation_utils/navigation.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:fantasyarenas/widget/image_lodar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompletedMatchDetailsPage extends StatefulWidget {
  const CompletedMatchDetailsPage({super.key});

  @override
  State<CompletedMatchDetailsPage> createState() => _CompletedMatchDetailsPageState();
}

class _CompletedMatchDetailsPageState extends State<CompletedMatchDetailsPage> {
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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.backGroundColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              homeController.showTeam1ScoreBoard.value = false;
              homeController.showTeam2ScoreBoard.value = false;
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
            fontWeight: FontWeight.bold,
            fontSize: SizeUtils.fSize_17(),
          ),
        ),
        body: Column(
          children: [
            headerContainer(),
            Container(
              decoration: const BoxDecoration(
                color: AppColor.backGroundColor,
              ),
              child: TabBar(
                indicatorPadding: EdgeInsets.only(bottom: SizeUtils.horizontalBlockSize * 3),
                indicatorSize: TabBarIndicatorSize.label,
                indicatorColor: AppColor.white,
                isScrollable: true,
                unselectedLabelColor: AppColor.white.withOpacity(0.5),
                labelColor: AppColor.white,
                tabs: const [
                  Tab(
                    text: "Match Info",
                  ),
                  Tab(
                    text: "Scorecard",
                  ),
                  Tab(
                    text: "Fantasy Center",
                  )
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  MatchInfoPage(),
                  ScorePage(),
                  FantasyCenter(),
                  // InfoPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  headerContainer() {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeUtils.horizontalBlockSize * 2,
        left: SizeUtils.horizontalBlockSize * 4,
        right: SizeUtils.horizontalBlockSize * 4,
      ),
      child: Container(
        decoration: BoxDecoration(color: AppColor.itemColor, borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: SizeUtils.horizontalBlockSize * 3,
              horizontal: SizeUtils.horizontalBlockSize * 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  imageLoader(
                      h: SizeUtils.horizontalBlockSize * 10,
                      w: SizeUtils.horizontalBlockSize * 10,
                      url: homeController.team1image.value),
                  SizedBox(width: SizeUtils.horizontalBlockSize * 3),
                  AppText(homeController.team1Name.value,
                      color: AppColor.white,
                      fontSize: SizeUtils.fSize_15(),
                      fontWeight: FontWeight.w500),
                  const Spacer(),
                  AppText(homeController.nr1.value,
                      color: homeController.changeWinTeamColor.value == 1
                          ? const Color(0xff38d924)
                          : AppColor.white,
                      fontSize: SizeUtils.fSize_15(),
                      fontWeight: FontWeight.w500),
                ],
              ),
              SizedBox(height: SizeUtils.horizontalBlockSize * 2),
              Row(
                children: [
                  imageLoader(
                      h: SizeUtils.horizontalBlockSize * 10,
                      w: SizeUtils.horizontalBlockSize * 10,
                      url: homeController.team2image.value),
                  SizedBox(width: SizeUtils.horizontalBlockSize * 3),
                  AppText(homeController.team2Name.value,
                      color: AppColor.white,
                      fontSize: SizeUtils.fSize_15(),
                      fontWeight: FontWeight.w500),
                  const Spacer(),
                  AppText(homeController.nr2.value,
                      color: homeController.changeWinTeamColor.value == 2
                          ? const Color(0xff38d924)
                          : AppColor.white,
                      fontSize: SizeUtils.fSize_15(),
                      fontWeight: FontWeight.w500),
                ],
              ),
              SizedBox(height: SizeUtils.horizontalBlockSize * 2),
              AppText(homeController.subHeader?.value ?? "",
                  color: const Color(0xff38d924),
                  fontSize: SizeUtils.fSize_13(),
                  fontWeight: FontWeight.w500),
              SizedBox(height: SizeUtils.horizontalBlockSize * 2),
              Row(
                children: [
                  imageLoader(
                      h: SizeUtils.horizontalBlockSize * 11,
                      w: SizeUtils.horizontalBlockSize * 11,
                      url: homeController.playerImage.value),
                  SizedBox(width: SizeUtils.horizontalBlockSize * 3),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(homeController.playerName.value,
                          color: AppColor.white,
                          fontSize: SizeUtils.fSize_12(),
                          fontWeight: FontWeight.w500),
                      AppText("Player Of the match",
                          color: AppColor.white.withOpacity(0.5),
                          fontSize: SizeUtils.fSize_11(),
                          fontWeight: FontWeight.w500),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
