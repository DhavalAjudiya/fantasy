import 'package:fantasyarenas/modual/Ads_helper/ads/banner_ads_widget.dart';
import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/assets_path.dart';
import 'package:fantasyarenas/utils/analytics.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_fade/image_fade.dart';

class MatchInfoPage extends StatelessWidget {
  MatchInfoPage({super.key});

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    FirebaseAnalyticsUtils.sendCurrentScreen(FirebaseAnalyticsUtils.com);

    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageFade(
              image: NetworkImage(homeController.matchSummary?.value ?? ""),

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
              loadingBuilder: (context, progress, chunkEvent) =>
                  Center(child: CircularProgressIndicator(value: progress, color: AppColor.appBarColor)),

              // displayed when an error occurs:
              errorBuilder: (context, error) => Container(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 5),
                    child: AppText(
                      "Match Summary will be soon!",
                      color: AppColor.white.withOpacity(0.5),
                      fontSize: SizeUtils.fSize_16(),
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.horizontalBlockSize * 4,
                vertical: SizeUtils.horizontalBlockSize * 1,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    "Tournament",
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeUtils.fSize_18(),
                  ),
                  SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                  Container(
                    width: SizeUtils.horizontalBlockSize * 10,
                    height: SizeUtils.horizontalBlockSize * 1.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), color: const Color(0xff7892aa)),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.horizontalBlockSize * 4,
                vertical: SizeUtils.horizontalBlockSize * 2,
              ),
              child: AppText(
                homeController.tourname?.value ?? "",
                color: AppColor.white,
                fontWeight: FontWeight.w400,
                fontSize: SizeUtils.fSize_15(),
              ),
            ),
            SizedBox(height: SizeUtils.horizontalBlockSize * 4),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.horizontalBlockSize * 4,
                vertical: SizeUtils.horizontalBlockSize * 1,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    "Match Details",
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeUtils.fSize_18(),
                  ),
                  SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                  Container(
                    width: SizeUtils.horizontalBlockSize * 10,
                    height: SizeUtils.horizontalBlockSize * 1.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15), color: const Color(0xff7892aa)),
                  ),
                ],
              ),
            ),
            SizedBox(height: SizeUtils.horizontalBlockSize * 2),
            matchDetails(),
            SizedBox(height: SizeUtils.horizontalBlockSize * 15),
          ],
        ),
      ),
      bottomNavigationBar: BannerAds(),
    );
  }

  matchDetails() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeUtils.horizontalBlockSize * 4,
        vertical: SizeUtils.horizontalBlockSize * 1,
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: SizeUtils.horizontalBlockSize * 30,
                child: AppText(
                  "Date & Time:",
                  color: const Color(0xff717686),
                  fontWeight: FontWeight.w500,
                  fontSize: SizeUtils.fSize_13(),
                ),
              ),
              SizedBox(
                width: SizeUtils.horizontalBlockSize * 55,
                child: AppText(homeController.matchTime?.value ?? "",
                    color: AppColor.white, fontWeight: FontWeight.w400, fontSize: SizeUtils.fSize_14()),
              ),
            ],
          ),
          SizedBox(height: SizeUtils.horizontalBlockSize * 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: SizeUtils.horizontalBlockSize * 30,
                child: AppText(
                  "Match Number:",
                  color: const Color(0xff717686),
                  fontWeight: FontWeight.w500,
                  fontSize: SizeUtils.fSize_13(),
                ),
              ),
              SizedBox(
                width: SizeUtils.horizontalBlockSize * 55,
                child: AppText(homeController.match?.value ?? "",
                    color: AppColor.white, fontWeight: FontWeight.w400, fontSize: SizeUtils.fSize_14()),
              ),
            ],
          ),
          SizedBox(height: SizeUtils.horizontalBlockSize * 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: SizeUtils.horizontalBlockSize * 30,
                child: AppText(
                  "Toss Result:",
                  color: const Color(0xff717686),
                  fontWeight: FontWeight.w500,
                  fontSize: SizeUtils.fSize_13(),
                ),
              ),
              SizedBox(
                width: SizeUtils.horizontalBlockSize * 55,
                child: AppText(homeController.toss?.value ?? "",
                    color: AppColor.white, fontWeight: FontWeight.w400, fontSize: SizeUtils.fSize_14()),
              ),
            ],
          ),
          SizedBox(height: SizeUtils.horizontalBlockSize * 2),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: SizeUtils.horizontalBlockSize * 30,
                child: AppText(
                  "Location:",
                  color: const Color(0xff717686),
                  fontWeight: FontWeight.w500,
                  fontSize: SizeUtils.fSize_13(),
                ),
              ),
              SizedBox(
                width: SizeUtils.horizontalBlockSize * 55,
                child: AppText(homeController.smallHeader.value,
                    color: AppColor.white, fontWeight: FontWeight.w400, fontSize: SizeUtils.fSize_14()),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
