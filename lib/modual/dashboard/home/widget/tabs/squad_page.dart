import 'dart:developer';

import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SquadPage extends StatelessWidget {
  SquadPage({super.key});

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.horizontalBlockSize * 3,
          vertical: SizeUtils.horizontalBlockSize * 3,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  homeController.showFirstSquad.value = !homeController.showFirstSquad.value;
                },
                child: Container(
                  // height: SizeUtils.horizontalBlockSize *
                  //     (homeController.showFirstSquad.value ? 40 : 15),
                  // duration: const Duration(milliseconds: 300),
                  decoration: BoxDecoration(
                    color: AppColor.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeUtils.horizontalBlockSize * 4,
                      vertical: SizeUtils.horizontalBlockSize * 3,
                    ),
                    child: Column(
                      children: [
                        Obx(
                          () => Row(
                            children: [
                              AppText(
                                "${homeController.team1Name}",
                                color: AppColor.white,
                              ),
                              const Spacer(),
                              Icon(homeController.showFirstSquad.value
                                  ? Icons.arrow_drop_up_sharp
                                  : Icons.arrow_drop_down_sharp)
                            ],
                          ),
                        ),
                        Obx(
                          () => homeController.showFirstSquad.value
                              ? SizedBox(
                                  height: SizeUtils.horizontalBlockSize * 40,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: homeController.playerList.length,
                                    itemBuilder: (context, index) {
                                      var data = homeController.playerList[index];
                                      return teamSquad(
                                        name: data.name,
                                        type: data.name,
                                      );
                                    },
                                  ),
                                )
                              : const SizedBox(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: SizeUtils.horizontalBlockSize * 3),
              GestureDetector(
                onTap: () {
                  homeController.showSecondSquad.value = !homeController.showSecondSquad.value;
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColor.black.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: SizeUtils.horizontalBlockSize * 4,
                      vertical: SizeUtils.horizontalBlockSize * 3,
                    ),
                    child: Column(
                      children: [
                        Obx(
                          () => Row(
                            children: [
                              AppText(
                                "${homeController.team2Name}",
                                color: AppColor.white,
                              ),
                              const Spacer(),
                              Icon(homeController.showSecondSquad.value
                                  ? Icons.arrow_drop_up_sharp
                                  : Icons.arrow_drop_down_sharp)
                            ],
                          ),
                        ),
                        Obx(
                          () => homeController.showSecondSquad.value
                              ? SizedBox(
                                  height: SizeUtils.horizontalBlockSize * 40,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: homeController.playerList.length,
                                    itemBuilder: (context, index) {
                                      var data = homeController.playerList[index];
                                      return teamSquad(
                                        name: data.name,
                                        type: data.name,
                                      );
                                    },
                                  ),
                                )
                              : const SizedBox(),
                        ),
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

  teamSquad({
    String? name,
    String? type,
    String? image,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: CircleAvatar(
        backgroundColor: AppColor.phoneBtn,
        backgroundImage: NetworkImage(image ?? ""),
      ),
      title: AppText(
        name ?? "",
        fontSize: SizeUtils.fSize_16(),
        fontWeight: FontWeight.w500,
        color: AppColor.white,
      ),
      subtitle: AppText(
        type ?? "",
        fontSize: SizeUtils.fSize_13(),
        fontWeight: FontWeight.w500,
        color: AppColor.white.withOpacity(0.7),
      ),
    );
  }
}
