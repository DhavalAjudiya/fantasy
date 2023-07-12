import 'dart:developer';

import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.horizontalBlockSize * 3,
          vertical: SizeUtils.horizontalBlockSize * 3,
        ),
        child: homeController.fistTeamList.isEmpty && homeController.secondTeamList.isEmpty
            ? Center(
                child: AppText("Both Squad Are Coming Soon",
                    fontWeight: FontWeight.bold,
                    color: AppColor.white,
                    fontSize: SizeUtils.fSize_20()),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Obx(
                            () => ExpansionTile(
                              expandedCrossAxisAlignment: CrossAxisAlignment.start,
                              onExpansionChanged: (value) {
                                homeController.showFirstSquad.value = value;
                              },
                              trailing: Icon(homeController.showFirstSquad.value
                                  ? Icons.arrow_drop_up_sharp
                                  : Icons.arrow_drop_down_sharp),
                              leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(homeController.team1image.toString())),
                              title: AppText(
                                homeController.team1Name.toString(),
                                color: AppColor.white,
                              ),
                              childrenPadding: EdgeInsets.symmetric(
                                  horizontal: SizeUtils.horizontalBlockSize * 1.5,
                                  vertical: SizeUtils.horizontalBlockSize * 1),
                              children: [
                                homeController.fistTeamList.isEmpty
                                    ? Padding(
                                        padding:
                                            EdgeInsets.only(top: SizeUtils.verticalBlockSize * 35),
                                        child: Center(
                                          child: AppText(
                                              "${homeController.team1Name} Squad Are Coming Soon",
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.white,
                                              fontSize: SizeUtils.fSize_20()),
                                        ),
                                      )
                                    : ListView.builder(
                                        padding: EdgeInsets.only(
                                            bottom: SizeUtils.horizontalBlockSize * 1),
                                        physics: const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemCount: homeController.fistTeamList.length,
                                        itemBuilder: (context, index) {
                                          var data = homeController.fistTeamList[index];
                                          return teamSquad(
                                              name: data.name,
                                              type: data.name,
                                              image: data.image,
                                              played: data.play);
                                        },
                                      )
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: SizeUtils.horizontalBlockSize * 3),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          decoration: BoxDecoration(
                            color: AppColor.black.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Obx(
                            () => ExpansionTile(
                              // clipBehavior: Clip.antiAliasWithSaveLayer,

                              expandedCrossAxisAlignment: CrossAxisAlignment.start,
                              onExpansionChanged: (value) {
                                homeController.showSecondSquad.value = value;
                              },
                              trailing: Icon(homeController.showSecondSquad.value
                                  ? Icons.arrow_drop_up_sharp
                                  : Icons.arrow_drop_down_sharp),
                              leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(homeController.team2image.toString())),
                              title: AppText(
                                homeController.team2Name.toString(),
                                color: AppColor.white,
                              ),
                              childrenPadding: EdgeInsets.symmetric(
                                  horizontal: SizeUtils.horizontalBlockSize * 1.5,
                                  vertical: SizeUtils.horizontalBlockSize * 1),
                              children: [
                                homeController.secondTeamList.isEmpty
                                    ? Padding(
                                        padding:
                                            EdgeInsets.only(top: SizeUtils.verticalBlockSize * 35),
                                        child: Center(
                                          child: AppText(
                                              "${homeController.team2Name} Squad Are Coming Soon",
                                              fontWeight: FontWeight.bold,
                                              color: AppColor.white,
                                              fontSize: SizeUtils.fSize_20()),
                                        ),
                                      )
                                    : ListView.builder(
                                        physics: const NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.only(
                                            bottom: SizeUtils.horizontalBlockSize * 2),
                                        shrinkWrap: true,
                                        itemCount: homeController.secondTeamList.length,
                                        itemBuilder: (context, index) {
                                          var data = homeController.secondTeamList[index];
                                          return teamSquad(
                                              name: data.name,
                                              type: data.name,
                                              image: data.image,
                                              played: data.play);
                                        },
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
      padding: EdgeInsets.symmetric(
          vertical: SizeUtils.horizontalBlockSize * 2,
          horizontal: SizeUtils.horizontalBlockSize * 2),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColor.phoneBtn,
            radius: 25,
            foregroundColor: AppColor.cardBtn,
            backgroundImage: NetworkImage(image ?? "https://wallpapercave.com/wp/wp9220300.jpg"),
          ),
          SizedBox(width: SizeUtils.horizontalBlockSize * 5),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                name ?? "",
                fontSize: SizeUtils.fSize_17(),
                fontWeight: FontWeight.w500,
                color: AppColor.white,
              ),
              AppText(
                type ?? "",
                fontSize: SizeUtils.fSize_13(),
                fontWeight: FontWeight.w500,
                color: AppColor.white.withOpacity(0.6),
              ),
            ],
          ),
          Spacer(),
          played == true
              ? const Icon(
                  Icons.done_all,
                  color: Colors.green,
                )
              : SizedBox(),
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
