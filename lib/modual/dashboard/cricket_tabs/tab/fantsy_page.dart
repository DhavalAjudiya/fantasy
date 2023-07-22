import 'package:badges/badges.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasyarenas/modual/dashboard/cricket_tabs/modal/fantasy_modal.dart';
import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/appconfig.dart';
import 'package:fantasyarenas/res/assets_path.dart';
import 'package:fantasyarenas/utils/navigation_utils/navigation.dart';
import 'package:fantasyarenas/utils/navigation_utils/routes.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:fantasyarenas/widget/image_lodar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

class FantasyPage extends StatelessWidget {
  HomeController homeController = Get.find();

  List<FantasyModal> fantasyList = [];

  FantasyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundLightColor,
      body: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.only(
            bottom: SizeUtils.horizontalBlockSize * 5,
            left: SizeUtils.horizontalBlockSize * 2,
            right: SizeUtils.horizontalBlockSize * 2,
          ),
          child: Column(
            children: [
              homeController.isFantasy.value
                  ? StreamBuilder(
                      stream: AppConfig.databaseReference
                          .collection(AppConfig.cfantasy)
                          .where("id", isEqualTo: homeController.upComingMatchDocId.value)
                          .snapshots(),
                      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        fantasyList.clear();

                        for (var element in snapshot.data?.docs ?? []) {
                          FantasyModal completedMatchModal =
                              FantasyModal.fromMap(element.data() as Map<String, dynamic>);
                          fantasyList.add(completedMatchModal);
                        }
                        homeController.smallTeamList.clear();
                        homeController.headTeamList.clear();
                        homeController.playerState.clear();
                        homeController.playerState.value = fantasyList.first.playerstate ?? [];
                        homeController.smallTeam.value = 0;
                        homeController.headTeam.value = 0;
                        fantasyList.first.fantasy?.forEach((element) {
                          if (element.type == "small") {
                            homeController.smallTeam.value++;
                            homeController.smallTeamList.add(element);
                          } else {
                            homeController.headTeam.value++;
                            homeController.headTeamList.add(element);
                          }
                        });
                        homeController.expertName.value = 0;
                        for (var data in homeController.smallTeamList) {
                          for (var data2 in homeController.headTeamList) {
                            if (data2.name == data.name) {
                            } else {
                              homeController.expertName.value++;
                            }
                          }
                        }
                        if (snapshot.connectionState == ConnectionState.active) {
                          if (snapshot.hasData) {
                            return fantasyList[0].fantasy?.isEmpty ?? false
                                ? Padding(
                                    padding: EdgeInsets.only(
                                      top: SizeUtils.verticalBlockSize * 35,
                                    ),
                                    child: Center(
                                      child: AppText(
                                        "Fantasy Not Found",
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.appBarColor,
                                        fontSize: SizeUtils.fSize_20(),
                                      ),
                                    ),
                                  )
                                : Padding(
                                    padding: EdgeInsets.only(
                                      top: SizeUtils.horizontalBlockSize * 4,
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xffFFF1DC),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: playerState(),
                                        ),
                                        SizedBox(
                                          height: SizeUtils.horizontalBlockSize * 4,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: const Color(0xffFFF1DC),
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.only(
                                              left: SizeUtils.horizontalBlockSize * 4,
                                              right: SizeUtils.horizontalBlockSize * 4,
                                              bottom: SizeUtils.horizontalBlockSize * 3,
                                            ),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: SizeUtils.horizontalBlockSize * 2,
                                                    bottom: SizeUtils.horizontalBlockSize * 1,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment.start,
                                                        children: [
                                                          AppText(
                                                            "Expert Analysis",
                                                            color: AppColor.appBarColor,
                                                            fontWeight: FontWeight.bold,
                                                            fontSize: SizeUtils.fSize_16(),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                SizeUtils.horizontalBlockSize * 0.5,
                                                          ),
                                                          AppText(
                                                            "Based on ${homeController.expertName.value} Expert",
                                                            color: AppColor.appBarColor.withOpacity(
                                                              0.5,
                                                            ),
                                                            fontSize: SizeUtils.fSize_12(),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Divider(
                                                  color: AppColor.appBarColor.withOpacity(0.5),
                                                ),
                                                homeController.smallTeamList.isNotEmpty
                                                    ? AppText(
                                                        "Small League Team",
                                                        color: AppColor.appBarColor,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: SizeUtils.fSize_16(),
                                                      )
                                                    : const SizedBox(),
                                                homeController.smallTeamList.isNotEmpty
                                                    ? AppText(
                                                        "${homeController.smallTeam.value} Team",
                                                        color:
                                                            AppColor.appBarColor.withOpacity(0.5),
                                                        fontSize: SizeUtils.fSize_12(),
                                                      )
                                                    : const SizedBox(),
                                                ListView.separated(
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: SizeUtils.horizontalBlockSize * 1,
                                                  ),
                                                  shrinkWrap: true,
                                                  itemCount: homeController.smallTeamList.length,
                                                  itemBuilder: (context, index) {
                                                    var data = homeController.smallTeamList[index];
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color: AppColor.white,
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                imageLoader(
                                                                  h: SizeUtils.horizontalBlockSize *
                                                                      11,
                                                                  w: SizeUtils.horizontalBlockSize *
                                                                      11,
                                                                  url: data.image ?? "",
                                                                ),
                                                                /*
                                                                CircleAvatar(
                                                                  backgroundImage: NetworkImage(
                                                                    data.image ?? "",
                                                                  ),
                                                                ),*/
                                                                SizedBox(
                                                                  width: SizeUtils
                                                                          .horizontalBlockSize *
                                                                      5,
                                                                ),
                                                                AppText(
                                                                  data.name ?? "",
                                                                  color: AppColor.appBarColor,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontSize: SizeUtils.fSize_17(),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.symmetric(
                                                                vertical:
                                                                    SizeUtils.horizontalBlockSize *
                                                                        2,
                                                                horizontal:
                                                                    SizeUtils.horizontalBlockSize *
                                                                        2,
                                                              ),
                                                              child: GestureDetector(
                                                                onTap: () {
                                                                  homeController.teamImage.value =
                                                                      data.teamimage ?? "";
                                                                  Navigation.pushNamed(
                                                                      Routes.teamImagePage);
                                                                },
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                    color: Colors.green.withOpacity(
                                                                      0.5,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(4),
                                                                  ),
                                                                  child: team(data, index),
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                homeController.teamImage.value =
                                                                    data.teamimage ?? "";
                                                                Navigation.pushNamed(
                                                                  Routes.teamImagePage,
                                                                );
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  AppText(
                                                                    "See this team",
                                                                    color: AppColor.appBarColor
                                                                        .withOpacity(
                                                                      0.5,
                                                                    ),
                                                                    fontSize: SizeUtils.fSize_14(),
                                                                  ),
                                                                  const Spacer(),
                                                                  Icon(
                                                                    Icons.arrow_forward_ios,
                                                                    color: AppColor.appBarColor,
                                                                    size: SizeUtils
                                                                            .horizontalBlockSize *
                                                                        3,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (BuildContext context, int index) {
                                                    return SizedBox(
                                                      height: SizeUtils.horizontalBlockSize * 3,
                                                    );
                                                  },
                                                ),
                                                homeController.headTeamList.isNotEmpty
                                                    ? AppText(
                                                        "Head to Head Team",
                                                        color: AppColor.appBarColor,
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: SizeUtils.fSize_16(),
                                                      )
                                                    : const SizedBox(),
                                                homeController.headTeamList.isNotEmpty
                                                    ? Padding(
                                                        padding: EdgeInsets.only(
                                                          left: SizeUtils.horizontalBlockSize * 4,
                                                          right: SizeUtils.horizontalBlockSize * 4,
                                                        ),
                                                        child: AppText(
                                                          "${homeController.headTeam.value} Team",
                                                          color: AppColor.appBarColor,
                                                          fontSize: SizeUtils.fSize_12(),
                                                        ),
                                                      )
                                                    : const SizedBox(),
                                                ListView.separated(
                                                  physics: const NeverScrollableScrollPhysics(),
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: SizeUtils.horizontalBlockSize * 1,
                                                  ),
                                                  shrinkWrap: true,
                                                  itemCount: homeController.headTeamList.length,
                                                  itemBuilder: (context, index) {
                                                    var data = homeController.headTeamList[index];
                                                    return Container(
                                                      decoration: BoxDecoration(
                                                        color: AppColor.white,
                                                        borderRadius: BorderRadius.circular(8),
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              children: [
                                                                imageLoader(
                                                                  h: SizeUtils.horizontalBlockSize *
                                                                      11,
                                                                  w: SizeUtils.horizontalBlockSize *
                                                                      11,
                                                                  url: data.image ?? "",
                                                                ),
                                                                /*CircleAvatar(
                                                                  backgroundImage: NetworkImage(
                                                                    data.image ?? "",
                                                                  ),
                                                                ),*/
                                                                SizedBox(
                                                                  width: SizeUtils
                                                                          .horizontalBlockSize *
                                                                      5,
                                                                ),
                                                                AppText(
                                                                  data.name ?? "",
                                                                  color: AppColor.appBarColor,
                                                                  fontWeight: FontWeight.w600,
                                                                  fontSize: SizeUtils.fSize_17(),
                                                                ),
                                                              ],
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets.symmetric(
                                                                vertical:
                                                                    SizeUtils.horizontalBlockSize *
                                                                        2,
                                                                horizontal:
                                                                    SizeUtils.horizontalBlockSize *
                                                                        2,
                                                              ),
                                                              child: GestureDetector(
                                                                onTap: () {
                                                                  homeController.teamImage.value =
                                                                      data.teamimage ?? "";
                                                                  Navigation.pushNamed(
                                                                    Routes.teamImagePage,
                                                                  );
                                                                },
                                                                child: Container(
                                                                  decoration: BoxDecoration(
                                                                    color: Colors.green.withOpacity(
                                                                      0.5,
                                                                    ),
                                                                    borderRadius:
                                                                        BorderRadius.circular(4),
                                                                  ),
                                                                  child: team(data, index),
                                                                ),
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                homeController.teamImage.value =
                                                                    data.teamimage ?? "";
                                                                Navigation.pushNamed(
                                                                  Routes.teamImagePage,
                                                                );
                                                              },
                                                              child: Row(
                                                                children: [
                                                                  AppText(
                                                                    "See this team",
                                                                    color: AppColor.appBarColor
                                                                        .withOpacity(
                                                                      0.5,
                                                                    ),
                                                                    fontSize: SizeUtils.fSize_14(),
                                                                  ),
                                                                  const Spacer(),
                                                                  Icon(
                                                                    Icons.arrow_forward_ios,
                                                                    color: AppColor.appBarColor,
                                                                    size: SizeUtils
                                                                            .horizontalBlockSize *
                                                                        3,
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  separatorBuilder:
                                                      (BuildContext context, int index) {
                                                    return SizedBox(
                                                      height: SizeUtils.horizontalBlockSize * 3,
                                                    );
                                                  },
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                          } else if (snapshot.hasError) {
                            return const Text("Snapshot has error");
                          } else {
                            return const Center(
                                child: CircularProgressIndicator(
                              color: AppColor.locationBtn,
                            ));
                          }
                        } else {
                          return const SizedBox();
                        }
                      },
                    )
                  : Padding(
                      padding: EdgeInsets.only(top: SizeUtils.horizontalBlockSize * 5),
                      child: Container(
                        margin: EdgeInsets.only(
                          right: SizeUtils.horizontalBlockSize * 2,
                          left: SizeUtils.horizontalBlockSize * 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffFFF1DC),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: SizeUtils.horizontalBlockSize * 3,
                            bottom: SizeUtils.horizontalBlockSize * 10,
                            left: SizeUtils.horizontalBlockSize * 3,
                            right: SizeUtils.horizontalBlockSize * 3,
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Image.asset(
                                    AssetsPath.analysis,
                                    width: 50,
                                    height: 45,
                                  ),
                                  SizedBox(
                                    width: SizeUtils.screenWidth * 0.03,
                                  ),
                                  AppText(
                                    "Expert Analysis",
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.black,
                                    fontSize: SizeUtils.fSize_17(),
                                  ),
                                ],
                              ),
                              const Divider(
                                color: AppColor.white,
                                thickness: 2,
                              ),
                              SizedBox(
                                height: SizeUtils.screenHeight * 0.03,
                              ),
                              AppText(
                                'Fantasy Articles coming soon!',
                                color: Colors.grey,
                                fontSize: SizeUtils.fSize_15(),
                                fontWeight: FontWeight.w700,
                              ),
                              SizedBox(
                                height: SizeUtils.screenHeight * 0.007,
                              ),
                              AppText(
                                'Watch this space',
                                color: Colors.grey.withOpacity(0.7),
                                fontSize: SizeUtils.fSize_15(),
                                fontWeight: FontWeight.w600,
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  team(Fantasy smallTeam, int index) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: SizeUtils.horizontalBlockSize * 1.5,
          horizontal: SizeUtils.horizontalBlockSize * 2),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: AppColor.smsBtn,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeUtils.horizontalBlockSize * 1,
                          vertical: SizeUtils.horizontalBlockSize * 0.5),
                      child: AppText(
                        "TEAM  ${index + 1}",
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeUtils.fSize_12(),
                      ),
                    ),
                  ),
                  SizedBox(height: SizeUtils.horizontalBlockSize * 4),
                  RichText(
                    text: TextSpan(
                      text: "Cr: ${smallTeam.cr?.split("/").first}",
                      style: TextStyle(
                        color: AppColor.white,
                        fontWeight: FontWeight.w500,
                        fontSize: SizeUtils.fSize_13(),
                      ),
                      children: [
                        TextSpan(
                            text: "/100",
                            style: TextStyle(
                              color: AppColor.white,
                              fontWeight: FontWeight.w300,
                              fontSize: SizeUtils.fSize_13(),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Column(
                children: [
                  badges.Badge(
                    alignment: Alignment.center,
                    badgeColor: Colors.green.shade900,
                    badgeContent: AppText(
                      "C",
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeUtils.fSize_12(),
                    ),
                    position: BadgePosition.topEnd(top: 2, end: 32),
                    child: imageLoader(
                      h: SizeUtils.horizontalBlockSize * 11,
                      w: SizeUtils.horizontalBlockSize * 11,
                      url: smallTeam.captionimage ?? "",
                    ),
                    /* child: CircleAvatar(
                      backgroundColor: AppColor.appBarColor,
                      backgroundImage: NetworkImage(smallTeam.captionimage ?? ""),
                    ),*/
                  ),
                  SizedBox(height: SizeUtils.horizontalBlockSize * 1),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: AppColor.cardBtn,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeUtils.horizontalBlockSize * 1,
                          vertical: SizeUtils.horizontalBlockSize * 0.5),
                      child: AppText(
                        smallTeam.caption ?? "",
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeUtils.fSize_12(),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: SizeUtils.horizontalBlockSize * 5),
              Column(
                children: [
                  badges.Badge(
                    padding: const EdgeInsets.only(top: 5, left: 5, bottom: 3, right: 3),
                    alignment: Alignment.center,
                    badgeColor: Colors.green.shade900,
                    badgeContent: AppText(
                      "VC",
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeUtils.fSize_10(),
                    ),
                    position: BadgePosition.topEnd(top: 2, end: 32),
                    child: imageLoader(
                      h: SizeUtils.horizontalBlockSize * 11,
                      w: SizeUtils.horizontalBlockSize * 11,
                      url: smallTeam.vcaptionimage ?? "",
                    ),
                    /*   child: CircleAvatar(
                      backgroundColor: AppColor.appBarColor,
                      backgroundImage: NetworkImage(smallTeam.vcaptionimage ??
                          "https://wallpaperaccess.com/full/6773197.jpg"),
                    ),*/
                  ),
                  SizedBox(height: SizeUtils.horizontalBlockSize * 1),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: AppColor.locationBtn,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeUtils.horizontalBlockSize * 1,
                          vertical: SizeUtils.horizontalBlockSize * 0.5),
                      child: AppText(
                        smallTeam.vcaption ?? "",
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeUtils.fSize_12(),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: SizeUtils.horizontalBlockSize * 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              subHeader(test: "WK ", subTest: smallTeam.player?.substring(0, 1)),
              subHeader(test: "BAT ", subTest: smallTeam.player?.substring(1, 2)),
              subHeader(test: "ALL ", subTest: smallTeam.player?.substring(2, 3)),
              subHeader(test: "BOWL ", subTest: smallTeam.player?.substring(3, 4)),
            ],
          )
        ],
      ),
    );
  }

  subHeader({
    String? test,
    String? subTest,
  }) {
    return RichText(
      text: TextSpan(
        text: test ?? "",
        style: TextStyle(
          color: AppColor.white,
          fontWeight: FontWeight.w300,
          fontSize: SizeUtils.fSize_12(),
        ),
        children: [
          TextSpan(
              text: subTest ?? "",
              style: TextStyle(
                color: AppColor.white,
                fontWeight: FontWeight.w600,
                fontSize: SizeUtils.fSize_13(),
              )),
        ],
      ),
    );
  }

  playerState() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: SizeUtils.horizontalBlockSize * 2,
            bottom: SizeUtils.horizontalBlockSize * 1,
            left: SizeUtils.horizontalBlockSize * 4,
            right: SizeUtils.horizontalBlockSize * 4,
          ),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      AppText(
                        "Player State",
                        color: AppColor.appBarColor,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeUtils.fSize_16(),
                      ),
                      SizedBox(width: SizeUtils.horizontalBlockSize * 2),
                      fantasyList.first.lineup == true
                          ? Container(
                              decoration: BoxDecoration(
                                color: AppColor.white.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: SizeUtils.horizontalBlockSize * 0.5,
                                  horizontal: SizeUtils.horizontalBlockSize * 1,
                                ),
                                child: Row(
                                  children: [
                                    const CircleAvatar(
                                      radius: 3,
                                      backgroundColor: AppColor.smsBtn,
                                    ),
                                    SizedBox(width: SizeUtils.horizontalBlockSize * 1.7),
                                    AppText(
                                      "Lineup Out",
                                      color: AppColor.smsBtn,
                                      fontWeight: FontWeight.w700,
                                      fontSize: SizeUtils.fSize_12(),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          : const SizedBox(),
                    ],
                  ),
                  SizedBox(height: SizeUtils.horizontalBlockSize * 0.5),
                  AppText(
                    "Stats from this tour",
                    color: AppColor.appBarColor.withOpacity(0.5),
                    fontSize: SizeUtils.fSize_13(),
                  ),
                ],
              ),
            ],
          ),
        ),
        const Divider(
          color: AppColor.appBarColor,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeUtils.horizontalBlockSize * 3,
            vertical: SizeUtils.horizontalBlockSize * 1,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.appBarColor,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeUtils.horizontalBlockSize * 3,
                  vertical: SizeUtils.horizontalBlockSize * 1.5),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: AppText(
                      "Player",
                      color: AppColor.white,
                      fontSize: SizeUtils.fSize_13(),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  AppText(
                    "Matches\nPlayed",
                    color: AppColor.white,
                    fontSize: SizeUtils.fSize_13(),
                    fontWeight: FontWeight.w700,
                  ),
                  SizedBox(width: SizeUtils.horizontalBlockSize * 2.5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        "Points per",
                        color: AppColor.white,
                        fontSize: SizeUtils.fSize_12(),
                        fontWeight: FontWeight.w700,
                      ),
                      Row(
                        children: [
                          AppText(
                            "Match",
                            color: AppColor.white,
                            fontSize: SizeUtils.fSize_12(),
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(width: SizeUtils.horizontalBlockSize * 0.5),
                          const Icon(Icons.arrow_downward_sharp, size: 13),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: SizeUtils.horizontalBlockSize * 2.5),
                  AppText(
                    "DT%",
                    color: AppColor.white,
                    fontSize: SizeUtils.fSize_12(),
                    fontWeight: FontWeight.w700,
                  ),
                ],
              ),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: homeController.playerState.length,
          itemBuilder: (context, index) {
            var data = homeController.playerState[index];
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeUtils.horizontalBlockSize * 6,
                  vertical: SizeUtils.horizontalBlockSize * 0.5),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            AppText(
                              data.name ?? "",
                              color: AppColor.appBarColor,
                              fontSize: SizeUtils.fSize_13(),
                              fontWeight: FontWeight.w600,
                            ),
                            SizedBox(width: SizeUtils.horizontalBlockSize * 1),
                            data.announce == true
                                ? const CircleAvatar(
                                    radius: 4,
                                    backgroundColor: AppColor.smsBtn,
                                  )
                                : const SizedBox(),
                          ],
                        ),
                        AppText(
                          data.type ?? "",
                          color: AppColor.appBarColor.withOpacity(0.7),
                          fontSize: SizeUtils.fSize_13(),
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: AppText(
                      data.mplayed ?? "",
                      color: AppColor.appBarColor,
                      fontSize: SizeUtils.fSize_13(),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: AppText(
                      data.pmatch ?? "",
                      color: AppColor.appBarColor,
                      fontSize: SizeUtils.fSize_13(),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  AppText(
                    "100",
                    color: AppColor.appBarColor,
                    fontSize: SizeUtils.fSize_13(),
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            );
          },
        ),
        SizedBox(
          height: SizeUtils.screenHeight * 0.02,
        ),
      ],
    );
  }
}
