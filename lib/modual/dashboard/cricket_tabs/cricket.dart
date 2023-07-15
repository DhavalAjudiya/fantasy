import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/modual/dashboard/home/modal/completedMatch.dart';
import 'package:fantasyarenas/modual/dashboard/cricket_tabs/modal/fantasy_modal.dart';
import 'package:fantasyarenas/modual/dashboard/cricket_tabs/modal/upcomingMatch.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/appconfig.dart';
import 'package:fantasyarenas/res/assets_path.dart';
import 'package:fantasyarenas/utils/navigation_utils/navigation.dart';
import 'package:fantasyarenas/utils/navigation_utils/routes.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/utils/time_manager.dart';
import 'package:fantasyarenas/utils/utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:fantasyarenas/widget/card_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CricketPage extends StatelessWidget {
  CricketPage({super.key});

  HomeController homeController = Get.find();

  PageController pageController = PageController(initialPage: 0);
  List<CompletedMatchModal> completedMatchList = [];
  List<UpcomingMatchModal> upcomingMatchList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundLightColor,
      body: Stack(
        children: [
          Container(
            width: SizeUtils.screenWidth,
            height: SizeUtils.screenHeight * 0.25,
            decoration: BoxDecoration(
              // color: const Color(0xff205295).withOpacity(0.2),
              gradient: LinearGradient(
                colors: [
                  const Color(0xff205295).withOpacity(0.4),
                  const Color(0xff205295).withOpacity(0.2),
                  const Color(0xff205295).withOpacity(0.1),
                  Colors.transparent,
                ],
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.only(bottom: SizeUtils.screenHeight * 0.08),
              child: Image.asset(
                AssetsPath.backImage,
                fit: BoxFit.cover,
                color: AppColor.appBarColor.withOpacity(0.3),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: SizeUtils.horizontalBlockSize * 5,
              ),
              LimitedBox(
                maxHeight: SizeUtils.horizontalBlockSize * 37,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        offset: const Offset(0, 3),
                        blurRadius: 10,
                      )
                    ],
                  ),
                  child: completedMatchItem(),
                ),
              ),
              SizedBox(height: SizeUtils.horizontalBlockSize * 3),
              Center(
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: 7,
                  effect: WormEffect(
                    activeDotColor: AppColor.appBarColor,
                    dotWidth: 7,
                    dotHeight: 7,
                    dotColor: AppColor.appBarColor.withOpacity(0.5),
                  ),
                ),
              ),
              SizedBox(height: SizeUtils.horizontalBlockSize * 3),
              Padding(
                padding: EdgeInsets.only(
                  left: SizeUtils.horizontalBlockSize * 4,
                  right: SizeUtils.horizontalBlockSize * 4,
                ),
                child: AppText(
                  "Upcoming Match",
                  color: AppColor.black,
                  fontSize: SizeUtils.fSize_15(),
                  fontWeight: FontWeight.w600,
                ),
              ),
              Expanded(
                child: upComingMatch(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  completedMatchItem() {
    return StreamBuilder(
      stream: AppConfig.databaseReference.collection(AppConfig.completedMatch).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        completedMatchList.clear();

        for (var element in snapshot.data?.docs ?? []) {
          CompletedMatchModal completedMatchModal =
              CompletedMatchModal.fromMap(element.data() as Map<String, dynamic>);
          completedMatchList.add(completedMatchModal);
        }
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return PageView.builder(
              controller: pageController,
              itemCount: completedMatchList.length,
              itemBuilder: (context, index) {
                final data = completedMatchList[index];
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: SizeUtils.horizontalBlockSize * 3,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: cricketCard(
                    header: data.header,
                    t1: data.t1,
                    t2: data.t2,
                    i1: data.i1,
                    i2: data.i2,
                    nr1: data.nr1,
                    nr2: data.nr2,
                    status: "Completed",
                    time: data.time,
                    isSubHeader: false,
                    subHeader: data.subheader,
                    headerColor: [
                      AppColor.smsBtn,
                      Colors.white,
                    ],
                  ),
                );
              },
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
    );
  }

  upComingMatch() {
    return StreamBuilder(
      stream: AppConfig.databaseReference
          .collection(AppConfig.upcomingMatch)
          // .where("time", isGreaterThanOrEqualTo: DateTime.now().millisecondsSinceEpoch.toString())
          // .orderBy("time", descending: false)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        upcomingMatchList.clear();

        for (var element in snapshot.data?.docs ?? []) {
          UpcomingMatchModal upcomingMatchModal =
              UpcomingMatchModal.fromMap(element.data() as Map<String, dynamic>);
          upcomingMatchList.add(upcomingMatchModal);
        }
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 3),
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.only(bottom: SizeUtils.horizontalBlockSize * 4),
                  itemCount: upcomingMatchList.length,
                  itemBuilder: (context, index) {
                    String matchDate = "";
                    bool timeHeader = true;
                    if (index == 0) {
                      timeHeader = true;
                      matchDate = Utils.formatTimeOfDay(
                          int.parse(upcomingMatchList[index].time.toString()));
                    } else {
                      if (Utils.formatTimeOfDay(
                              int.parse(upcomingMatchList[(index - 1)].time.toString())) ==
                          Utils.formatTimeOfDay(
                              int.parse(upcomingMatchList[index].time.toString()))) {
                        timeHeader = false;
                      } else {
                        timeHeader = true;
                        matchDate = Utils.formatTimeOfDay(
                            int.parse(upcomingMatchList[index].time.toString()));
                      }
                    }
                    final data = upcomingMatchList[index];

                    return Column(
                      children: [
                        SizedBox(
                          height: SizeUtils.horizontalBlockSize * (timeHeader == false ? 1 : 3),
                        ),
                        timeHeader == false
                            ? const SizedBox()
                            : Text(
                                matchDate,
                                style: TextStyle(
                                  color: Colors.black.withOpacity(0.5),
                                  fontSize: SizeUtils.fSize_14(),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                        SizedBox(
                          height: SizeUtils.screenHeight * 0.01,
                        ),
                        GestureDetector(
                          onTap: () {
                            homeController.fistTeamList.value = data.team1 ?? [];
                            homeController.secondTeamList.value = data.team2 ?? [];
                            homeController.upComingMatchDocId.value = data.id ?? "";
                            homeController.team1image.value = data.i1 ?? "";
                            homeController.team2image.value = data.i2 ?? "";
                            homeController.team1Name.value = data.t1 ?? "";
                            homeController.team2Name.value = data.t2 ?? "";
                            homeController.isFantasy.value = data.isFantasy ?? false;
                            homeController.matchHeader.value = data.header ?? "";
                            Navigation.pushNamed(Routes.upComingDetailsPage);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColor.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: const Offset(2, 3),
                                  blurRadius: 5,
                                )
                              ],
                            ),
                            child: cricketCard(
                              header: data.header,
                              t1: data.t1,
                              t2: data.t2,
                              i1: data.i1,
                              i2: data.i2,
                              nr1: data.nr1,
                              nr2: data.nr2,
                              status: "Match will start in",
                              time: TimeManager().getRemainTimeFromMilliSecond(
                                int.parse(
                                  data.time.toString(),
                                ),
                              ),
                              isSubHeader: false,
                              isStatus: true,
                              subHeader: data.header,
                              headerColor: [
                                AppColor.appBarColor.withOpacity(0.3),
                                Colors.white,
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const SizedBox();
                  },
                ),
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
    );
  }
}
