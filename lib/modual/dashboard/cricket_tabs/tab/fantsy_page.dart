import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasyarenas/modual/dashboard/cricket_tabs/modal/fantasy_modal.dart';
import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/appconfig.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FantasyPage extends StatefulWidget {
  FantasyPage({Key? key}) : super(key: key);

  @override
  State<FantasyPage> createState() => _FantasyPageState();
}

class _FantasyPageState extends State<FantasyPage> {
  HomeController homeController = Get.find();

  List<FantasyModal> fantasyList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundLightColor,
      body: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: SizeUtils.horizontalBlockSize * 5,
            left: SizeUtils.horizontalBlockSize * 3,
            right: SizeUtils.horizontalBlockSize * 3,
          ),
          child: Column(
            children: [
              homeController.isFantasy.value
                  ? StreamBuilder(
                      stream: AppConfig.databaseReference
                          .collection(AppConfig.cfantasy)
                          .where("id",
                              isEqualTo:
                                  homeController.upComingMatchDocId.value)
                          .snapshots(),
                      builder:
                          (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                        fantasyList.clear();

                        for (var element in snapshot.data?.docs ?? []) {
                          FantasyModal completedMatchModal =
                              FantasyModal.fromMap(
                                  element.data() as Map<String, dynamic>);
                          fantasyList.add(completedMatchModal);
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.active) {
                          if (snapshot.hasData) {
                            return fantasyList[0].fantasy?.isEmpty ?? false
                                ? Padding(
                                    padding: EdgeInsets.only(
                                        top: SizeUtils.verticalBlockSize * 35),
                                    child: Center(
                                      child: AppText(
                                        "Fantasy Not Found",
                                        fontWeight: FontWeight.bold,
                                        color: Colors.red,
                                        fontSize: SizeUtils.fSize_20(),
                                      ),
                                    ),
                                  )
                                : ListView.separated(
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    padding: EdgeInsets.only(
                                        top: SizeUtils.horizontalBlockSize * 3),
                                    itemCount:
                                        fantasyList[0].fantasy?.length ?? 0,
                                    itemBuilder: (context, index) {
                                      final data =
                                          fantasyList[0].fantasy?[index];

                                      return Container(
                                        decoration: BoxDecoration(
                                          color:
                                              AppColor.black.withOpacity(0.3),
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                        child: Obx(
                                          () => ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: ExpansionTile(
                                              expandedCrossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              onExpansionChanged: (value) {
                                                homeController.expansionTileShow
                                                    .value = value;
                                              },
                                              trailing: Icon(homeController
                                                      .expansionTileShow.value
                                                  ? Icons.arrow_drop_up_sharp
                                                  : Icons
                                                      .arrow_drop_down_sharp),
                                              leading: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                      data?.image ?? "")),
                                              title: AppText(
                                                data?.name ?? "",
                                                color: AppColor.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: SizeUtils.fSize_17(),
                                              ),
                                              childrenPadding: EdgeInsets.symmetric(
                                                  horizontal: SizeUtils
                                                          .horizontalBlockSize *
                                                      4,
                                                  vertical: SizeUtils
                                                          .horizontalBlockSize *
                                                      2),
                                              children: [
                                                AppText(
                                                  "WicketKeeper",
                                                  color: AppColor.phoneBtn,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize:
                                                      SizeUtils.fSize_14(),
                                                ),
                                                ListView.builder(
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    padding: EdgeInsets.only(
                                                        bottom: SizeUtils
                                                                .horizontalBlockSize *
                                                            2),
                                                    shrinkWrap: true,
                                                    itemCount: data
                                                        ?.wicketkeeper?.length,
                                                    itemBuilder:
                                                        (context, wicketIndex) {
                                                      final wicketkeeper =
                                                          data?.wicketkeeper?[
                                                              wicketIndex];
                                                      return Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: SizeUtils
                                                                    .horizontalBlockSize *
                                                                1),
                                                        child: Row(
                                                          children: [
                                                            CircleAvatar(
                                                              radius: 10,
                                                              backgroundColor:
                                                                  AppColor.black
                                                                      .withOpacity(
                                                                          0.2),
                                                              child: AppText(
                                                                "${wicketIndex + 1}",
                                                                color: AppColor
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: SizeUtils
                                                                    .fSize_13(),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width: SizeUtils
                                                                        .horizontalBlockSize *
                                                                    2),
                                                            AppText(
                                                              wicketkeeper ??
                                                                  "",
                                                              color: AppColor
                                                                  .white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: SizeUtils
                                                                  .fSize_14(),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                                AppText(
                                                  "Batsman",
                                                  color: AppColor.wifiBtn,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize:
                                                      SizeUtils.fSize_14(),
                                                ),
                                                ListView.builder(
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    padding: EdgeInsets.only(
                                                        bottom: SizeUtils
                                                                .horizontalBlockSize *
                                                            2),
                                                    itemCount:
                                                        data?.batsman?.length,
                                                    itemBuilder: (context,
                                                        batsmanIndex) {
                                                      final batsman =
                                                          data?.batsman?[
                                                              batsmanIndex];
                                                      return Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: SizeUtils
                                                                    .horizontalBlockSize *
                                                                1),
                                                        child: Row(
                                                          children: [
                                                            CircleAvatar(
                                                              radius: 10,
                                                              backgroundColor:
                                                                  AppColor.black
                                                                      .withOpacity(
                                                                          0.2),
                                                              child: AppText(
                                                                "${batsmanIndex + 1}",
                                                                color: AppColor
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: SizeUtils
                                                                    .fSize_13(),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width: SizeUtils
                                                                        .horizontalBlockSize *
                                                                    2),
                                                            AppText(
                                                              batsman ?? "",
                                                              color: AppColor
                                                                  .white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: SizeUtils
                                                                  .fSize_14(),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                                AppText(
                                                  "All Rounder",
                                                  color: AppColor.locationBtn,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize:
                                                      SizeUtils.fSize_14(),
                                                ),
                                                ListView.builder(
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    padding: EdgeInsets.only(
                                                        bottom: SizeUtils
                                                                .horizontalBlockSize *
                                                            2),
                                                    itemCount: data
                                                        ?.allrounder?.length,
                                                    itemBuilder: (context,
                                                        allRounderIndex) {
                                                      final allRounder =
                                                          data?.allrounder?[
                                                              allRounderIndex];
                                                      return Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: SizeUtils
                                                                    .horizontalBlockSize *
                                                                1),
                                                        child: Row(
                                                          children: [
                                                            CircleAvatar(
                                                              radius: 10,
                                                              backgroundColor:
                                                                  AppColor.black
                                                                      .withOpacity(
                                                                          0.2),
                                                              child: AppText(
                                                                "${allRounderIndex + 1}",
                                                                color: AppColor
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: SizeUtils
                                                                    .fSize_13(),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width: SizeUtils
                                                                        .horizontalBlockSize *
                                                                    2),
                                                            AppText(
                                                              allRounder ?? "",
                                                              color: AppColor
                                                                  .white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: SizeUtils
                                                                  .fSize_14(),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                                AppText(
                                                  "Bolwer",
                                                  color: AppColor.cardBtn,
                                                  fontWeight: FontWeight.w600,
                                                  fontSize:
                                                      SizeUtils.fSize_14(),
                                                ),
                                                ListView.builder(
                                                    physics:
                                                        const NeverScrollableScrollPhysics(),
                                                    shrinkWrap: true,
                                                    itemCount:
                                                        data?.bolwer?.length,
                                                    itemBuilder:
                                                        (context, bolwerIndex) {
                                                      final bolwer =
                                                          data?.bolwer?[
                                                              bolwerIndex];
                                                      return Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal: SizeUtils
                                                                    .horizontalBlockSize *
                                                                1),
                                                        child: Row(
                                                          children: [
                                                            CircleAvatar(
                                                              radius: 10,
                                                              backgroundColor:
                                                                  AppColor.black
                                                                      .withOpacity(
                                                                          0.2),
                                                              child: AppText(
                                                                "${bolwerIndex + 1}",
                                                                color: AppColor
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: SizeUtils
                                                                    .fSize_13(),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                                width: SizeUtils
                                                                        .horizontalBlockSize *
                                                                    2),
                                                            AppText(
                                                              bolwer ?? "",
                                                              color: AppColor
                                                                  .white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontSize: SizeUtils
                                                                  .fSize_14(),
                                                            ),
                                                          ],
                                                        ),
                                                      );
                                                    }),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    separatorBuilder:
                                        (BuildContext context, int index) {
                                      return SizedBox(
                                        height:
                                            SizeUtils.horizontalBlockSize * 3,
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
                    )
                  : Padding(
                      padding: EdgeInsets.only(
                          top: SizeUtils.verticalBlockSize * 35),
                      child: Center(
                        child: AppText("Fantasy Coming Soon",
                            fontWeight: FontWeight.bold,
                            color: AppColor.white,
                            fontSize: SizeUtils.fSize_20()),
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    homeController.expansionTileShow.value = false;
  }
}
