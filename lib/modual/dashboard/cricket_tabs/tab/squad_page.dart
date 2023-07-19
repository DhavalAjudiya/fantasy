import 'dart:developer';

import 'package:dotted_border/dotted_border.dart';
import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:fdottedline_nullsafety/fdottedline__nullsafety.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_fade/image_fade.dart';

class SquadPage extends StatefulWidget {
  SquadPage({super.key});

  @override
  State<SquadPage> createState() => _SquadPageState();
}

class _SquadPageState extends State<SquadPage> {
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundLightColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.horizontalBlockSize * 3,
          vertical: SizeUtils.horizontalBlockSize * 3,
        ),
        child: homeController.fistTeamList.isEmpty &&
                homeController.secondTeamList.isEmpty
            ? Center(
                child: AppText(
                  "Both Squad Are Coming Soon",
                  fontWeight: FontWeight.bold,
                  color: AppColor.white,
                  fontSize: SizeUtils.fSize_20(),
                ),
              )
            : Column(
              children: [
                Obx(
                  () => Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        homeController.team1image.toString(),
                                      ),
                                      maxRadius: SizeUtils.screenWidth * 0.055,
                                    ),
                                    SizedBox(
                                      width: SizeUtils.horizontalBlockSize * 3,
                                    ),
                                    AppText(
                                      homeController.team1Name.toString(),
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: SizeUtils.fSize_20(),
                                    ),
                                  ],
                                ),
                                ListView.builder(
                                  padding: EdgeInsets.only(
                                    bottom: SizeUtils.horizontalBlockSize * 1,
                                  ),
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: homeController.fistTeamList.length,
                                  itemBuilder: (context, index) {
                                    var data =
                                    homeController.fistTeamList[index];
                                    return teamSquad(
                                      name: data.name,
                                      type: data.name,
                                      image: data.image,
                                      played: data.play,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Padding(
                              padding: EdgeInsets.only(
                                top: SizeUtils.horizontalBlockSize * 2,
                              ),
                              child: FDottedLine(
                                color: AppColor.appBarColor.withOpacity(0.2),
                                height: SizeUtils.screenHeight,
                                strokeWidth: 2.0,
                                dottedLength: 12.0,
                                space: 4.0,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    AppText(
                                      homeController.team2Name.toString(),
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                      fontSize: SizeUtils.fSize_20(),
                                    ),
                                    SizedBox(
                                      width: SizeUtils.horizontalBlockSize * 3,
                                    ),
                                    CircleAvatar(
                                      backgroundImage: NetworkImage(
                                        homeController.team2image.toString(),
                                      ),
                                      maxRadius: SizeUtils.screenWidth * 0.055,
                                    ),
                                  ],
                                ),
                                ListView.builder(
                                  padding: EdgeInsets.only(
                                    bottom: SizeUtils.horizontalBlockSize * 1,
                                  ),
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                  homeController.secondTeamList.length,
                                  itemBuilder: (context, index) {
                                    var data =
                                    homeController.secondTeamList[index];
                                    return teamSquad2(
                                      name: data.name,
                                      type: data.name,
                                      image: data.image,
                                      played: data.play,
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: SizeUtils.horizontalBlockSize * 3),
              ],
            ),
      ),
    );
  }

  teamSquad({
    String? name,
    String? type,
    String? image,
    bool? played,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeUtils.horizontalBlockSize * 4,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 25,
              foregroundColor: AppColor.cardBtn,
              backgroundImage: NetworkImage(
                image ?? "https://wallpapercave.com/wp/wp9220300.jpg",
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(left: SizeUtils.horizontalBlockSize * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: SizeUtils.horizontalBlockSize * 5.5,
                    child: AppText(
                      name ?? "",
                      fontSize: SizeUtils.fSize_15(),
                      fontWeight: FontWeight.w500,
                      color: AppColor.black,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  AppText(
                    name ?? "",
                    fontSize: SizeUtils.fSize_13(),
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          // const Spacer(),
          // played == true
          //     ? const Icon(
          //         Icons.done_all,
          //         color: Colors.green,
          //       )
          //     : const SizedBox(),
        ],
      ),
    );
  }

  teamSquad2({
    String? name,
    String? type,
    String? image,
    bool? played,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeUtils.horizontalBlockSize * 4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding:
                  EdgeInsets.only(right: SizeUtils.horizontalBlockSize * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: SizeUtils.horizontalBlockSize * 5.5,
                    child: AppText(
                      name ?? "",
                      fontSize: SizeUtils.fSize_15(),
                      fontWeight: FontWeight.w500,
                      color: AppColor.black,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  AppText(
                    type ?? "",
                    fontSize: SizeUtils.fSize_13(),
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 25,
              foregroundColor: AppColor.cardBtn,
              backgroundImage: NetworkImage(
                image ?? "https://wallpapercave.com/wp/wp9220300.jpg",
              ),
            ),
          ),
          // const Spacer(),
          // played == true
          //     ? const Icon(
          //         Icons.done_all,
          //         color: Colors.green,
          //       )
          //     : const SizedBox(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    homeController.showFirstSquad.value = false;
    homeController.showSecondSquad.value = false;
  }
}
