import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/modual/dashboard/home/modal/completedMatch.dart';
import 'package:fantasyarenas/modual/dashboard/cricket_tabs/modal/fantasy_modal.dart';
import 'package:fantasyarenas/modual/dashboard/cricket_tabs/modal/upcomingMatch.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/appconfig.dart';
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeUtils.horizontalBlockSize * 3,
              horizontal: SizeUtils.horizontalBlockSize * 4,
            ),
            child: AppText(
              "Completed Match",
              color: AppColor.textColor,
              fontSize: SizeUtils.fSize_15(),
              fontWeight: FontWeight.w600,
            ),

/*
            child: Row(
              children: [
                AppText(
                  "Completed Match",
                  color: AppColor.textColor,
                  fontSize: SizeUtils.fSize_15(),
                  fontWeight: FontWeight.w600,
                ),
                const Spacer(flex: 20),
                AppText(
                  "View All",
                  color: AppColor.textColor,
                  fontSize: SizeUtils.fSize_14(),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.textColor,
                  size: SizeUtils.horizontalBlockSize * 4,
                )
              ],
            ),
*/
          ),
          LimitedBox(
            maxHeight: SizeUtils.horizontalBlockSize * 34,
            child: completedMatchItem(),
          ),
          SizedBox(height: SizeUtils.horizontalBlockSize * 2),
          Center(
            child: SmoothPageIndicator(
              controller: pageController,
              count: 7,
              effect: WormEffect(
                activeDotColor: Colors.white,
                dotWidth: 6,
                dotHeight: 6,
                dotColor: Colors.white.withOpacity(0.5),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: SizeUtils.horizontalBlockSize * 3,
              horizontal: SizeUtils.horizontalBlockSize * 4,
            ),
            child: AppText(
              "Upcoming Match",
              color: AppColor.textColor,
              fontSize: SizeUtils.fSize_15(),
              fontWeight: FontWeight.w600,
            ),

/*
            child: Row(
              children: [
                AppText(
                  "Completed Match",
                  color: AppColor.textColor,
                  fontSize: SizeUtils.fSize_15(),
                  fontWeight: FontWeight.w600,
                ),
                const Spacer(flex: 20),
                AppText(
                  "View All",
                  color: AppColor.textColor,
                  fontSize: SizeUtils.fSize_14(),
                ),
                const Spacer(),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColor.textColor,
                  size: SizeUtils.horizontalBlockSize * 4,
                )
              ],
            ),
*/
          ),
          Expanded(child: upComingMatch()),
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
                  margin: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 3),
                  decoration: BoxDecoration(
                    border: Border.all(color: AppColor.boarderColor, width: 1),
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
      stream: AppConfig.databaseReference.collection(AppConfig.upcomingMatch).snapshots(),
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
                    topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                child: upcomingMatchList.isEmpty
                    ? Center(
                        child: AppText(
                        "Upcoming Match Coming Soon",
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeUtils.fSize_18(),
                      ))
                    : ListView.separated(
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
                              timeHeader == false
                                  ? const SizedBox(
                                      height: 0,
                                    )
                                  : Text(
                                      matchDate,
                                      style: TextStyle(
                                        color: Colors.white60,
                                        fontSize: SizeUtils.fSize_15(),
                                        fontWeight: FontWeight.w500,
                                      ),
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
                                    border: Border.all(color: AppColor.boarderColor, width: 1),
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
                                    status: "Match will start in",
                                    time: TimeManager().getRemainTimeFromMilliSecond(
                                        int.parse(data.time.toString())),
                                    isSubHeader: false,
                                    isStatus: true,
                                    subHeader: data.subheader,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: SizeUtils.horizontalBlockSize * 3,
                          );
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
