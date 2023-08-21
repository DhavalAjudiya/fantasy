import 'package:fantasyarenas/modual/Ads_helper/ads/banner_ads_widget.dart';
import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/assets_path.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:fantasyarenas/widget/image_lodar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_fade/image_fade.dart';

class ScorePage extends StatelessWidget {
  ScorePage({super.key});

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 4),
              child: Row(
                children: [
                  imageLoader(
                    url: homeController.team1image.value,
                    h: SizeUtils.horizontalBlockSize * 10,
                    w: SizeUtils.horizontalBlockSize * 10,
                  ),
                  SizedBox(width: SizeUtils.horizontalBlockSize * 3),
                  AppText(
                    homeController.team1Name.value,
                    fontWeight: FontWeight.w500,
                    fontSize: SizeUtils.fSize_17(),
                    color: AppColor.white,
                  ),
                  const Spacer(),
                  AppText(
                    homeController.nr1.value,
                    fontWeight: FontWeight.w500,
                    fontSize: SizeUtils.fSize_17(),
                    color: AppColor.white,
                  ),
                  SizedBox(width: SizeUtils.horizontalBlockSize * 3),
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      if (homeController.showTeam1ScoreBoard.value == false) {
                        homeController.showTeam1ScoreBoard.value = true;
                      } else {
                        homeController.showTeam1ScoreBoard.value = false;
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8), color: AppColor.itemColor),
                      child: Padding(
                        padding: EdgeInsets.all(SizeUtils.horizontalBlockSize * 3),
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, border: Border.all(color: AppColor.white)),
                            child: Padding(
                              padding: EdgeInsets.all(SizeUtils.horizontalBlockSize * 0.5),
                              child: Obx(
                                () => Icon(
                                  homeController.showTeam1ScoreBoard.value == true
                                      ? Icons.remove
                                      : Icons.add,
                                  size: SizeUtils.horizontalBlockSize * 4,
                                  color: AppColor.white,
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => homeController.showTeam1ScoreBoard.value == true
                  ? ImageFade(
                      image: NetworkImage(homeController.sb1?.value ?? ""),

                      duration: const Duration(milliseconds: 500),
                      syncDuration: const Duration(milliseconds: 150),
                      alignment: Alignment.center,
                      fit: BoxFit.cover,

                      placeholder: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(AssetsPath.loaderImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // shows progress while loading an image:
                      loadingBuilder: (context, progress, chunkEvent) => Center(
                          child:
                              CircularProgressIndicator(value: progress, color: AppColor.appBarColor)),

                      // displayed when an error occurs:
                      errorBuilder: (context, error) => Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 5),
                            child: AppText(
                              "ScoreBoard will be soon!",
                              color: AppColor.white.withOpacity(0.5),
                              fontSize: SizeUtils.fSize_16(),
                            ),
                          )),
                    )
                  : const Divider(color: Colors.grey),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 4),
              child: Row(
                children: [
                  imageLoader(
                    url: homeController.team2image.value,
                    h: SizeUtils.horizontalBlockSize * 10,
                    w: SizeUtils.horizontalBlockSize * 10,
                  ),
                  SizedBox(width: SizeUtils.horizontalBlockSize * 3),
                  AppText(
                    homeController.team2Name.value,
                    fontWeight: FontWeight.w500,
                    fontSize: SizeUtils.fSize_17(),
                    color: AppColor.white,
                  ),
                  const Spacer(),
                  AppText(
                    homeController.nr1.value,
                    fontWeight: FontWeight.w500,
                    fontSize: SizeUtils.fSize_17(),
                    color: AppColor.white,
                  ),
                  SizedBox(width: SizeUtils.horizontalBlockSize * 3),
                  InkWell(
                    borderRadius: BorderRadius.circular(8),
                    onTap: () {
                      if (homeController.showTeam2ScoreBoard.value == false) {
                        homeController.showTeam2ScoreBoard.value = true;
                      } else {
                        homeController.showTeam2ScoreBoard.value = false;
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8), color: AppColor.itemColor),
                      child: Padding(
                        padding: EdgeInsets.all(SizeUtils.horizontalBlockSize * 3),
                        child: Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, border: Border.all(color: AppColor.white)),
                            child: Padding(
                              padding: EdgeInsets.all(SizeUtils.horizontalBlockSize * 0.5),
                              child: Obx(
                                () => Icon(
                                  homeController.showTeam2ScoreBoard.value == true
                                      ? Icons.remove
                                      : Icons.add,
                                  size: SizeUtils.horizontalBlockSize * 4,
                                  color: AppColor.white,
                                ),
                              ),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => homeController.showTeam2ScoreBoard.value == true
                  ? ImageFade(
                      image: NetworkImage(homeController.sb2?.value ?? ""),

                      duration: const Duration(milliseconds: 500),
                      syncDuration: const Duration(milliseconds: 150),
                      alignment: Alignment.center,
                      fit: BoxFit.cover,

                      placeholder: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(AssetsPath.loaderImage),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      // shows progress while loading an image:
                      loadingBuilder: (context, progress, chunkEvent) => Center(
                          child:
                              CircularProgressIndicator(value: progress, color: AppColor.appBarColor)),

                      // displayed when an error occurs:
                      errorBuilder: (context, error) => Container(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 5),
                            child: AppText(
                              "ScoreBoard will be soon!",
                              color: AppColor.white.withOpacity(0.5),
                              fontSize: SizeUtils.fSize_16(),
                            ),
                          )),
                    )
                  : const Divider(color: Colors.grey),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BannerAds(),
    );
  }
}
