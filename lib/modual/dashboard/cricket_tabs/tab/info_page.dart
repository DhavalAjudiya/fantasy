import 'package:fantasyarenas/modual/Ads_helper/ads/banner_ads_widget.dart';
import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:fantasyarenas/widget/image_lodar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoPage extends StatelessWidget {
  InfoPage({Key? key}) : super(key: key);
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: SizeUtils.screenHeight * 0.01,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.horizontalBlockSize * 3,
                vertical: SizeUtils.horizontalBlockSize * 3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    'Tournament',
                    color: AppColor.white,
                    fontWeight: FontWeight.w600,
                    fontSize: SizeUtils.fSize_17(),
                    letterSpacing: 1,
                  ),
                  SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                  line(),
                  SizedBox(
                    height: SizeUtils.screenHeight * 0.01,
                  ),
                  Row(
                    children: [
                      imageLoader(
                          h: SizeUtils.horizontalBlockSize * 12,
                          w: SizeUtils.horizontalBlockSize * 12,
                          url: homeController.infoList.first.tournamentI.toString()),
                      const SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        width: SizeUtils.horizontalBlockSize * 75,
                        child: AppText(
                          homeController.infoList.first.tournamentN.toString(),
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: SizeUtils.fSize_15(),
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            const Divider(color: Colors.grey),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.horizontalBlockSize * 3,
                vertical: SizeUtils.horizontalBlockSize * 3,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    'Teams',
                    color: AppColor.white,
                    fontWeight: FontWeight.w600,
                    fontSize: SizeUtils.fSize_17(),
                    letterSpacing: 1,
                  ),
                  SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                  line(),
                  SizedBox(
                    height: SizeUtils.screenHeight * 0.015,
                  ),
                  teams(
                    teamLogo: homeController.team1image.value.toString(),
                    teamName: homeController.team1Name.value.toString(),
                  ),
                  SizedBox(
                    height: SizeUtils.horizontalBlockSize * 2,
                  ),
                  teams(
                    teamLogo: homeController.team2image.value.toString(),
                    teamName: homeController.team2Name.value.toString(),
                  ),
                ],
              ),
            ),
            const Divider(color: Colors.grey),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.horizontalBlockSize * 3,
                vertical: SizeUtils.horizontalBlockSize * 3,
              ),
              child: (homeController.infoList.first.match?.isEmpty ?? false)
                  ? Padding(
                padding: EdgeInsets.only(top: SizeUtils.horizontalBlockSize * 5),
                child: Container(
                  margin: EdgeInsets.only(
                    right: SizeUtils.horizontalBlockSize * 2,
                    left: SizeUtils.horizontalBlockSize * 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColor.itemColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: SizeUtils.horizontalBlockSize * 3,
                      bottom: SizeUtils.horizontalBlockSize * 3,
                      left: SizeUtils.horizontalBlockSize * 3,
                      right: SizeUtils.horizontalBlockSize * 3,
                    ),
                    child: AppText(
                      textAlign: TextAlign.center,
                      'Match Info Overview Will Be Available Soon!',
                      color: Colors.white,
                      fontSize: SizeUtils.fSize_15(),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              )
                  : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    'Match Details',
                    color: AppColor.white,
                    fontWeight: FontWeight.w600,
                    fontSize: SizeUtils.fSize_17(),
                    letterSpacing: 1,
                  ),
                  SizedBox(height: SizeUtils.horizontalBlockSize * 2),
                  line(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: SizeUtils.horizontalBlockSize * 4),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: AppColor.itemColor, borderRadius: BorderRadius.circular(8)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: SizeUtils.horizontalBlockSize * 4,
                          horizontal: SizeUtils.horizontalBlockSize * 4,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            matchDetails(
                              title: 'Match :',
                              subtitle: homeController.infoList.first.match.toString(),
                            ),
                            SizedBox(
                              height: SizeUtils.screenHeight * 0.01,
                            ),
                            matchDetails(
                              title: 'Match Start Time :',
                              subtitle: homeController.infoList.first.matchtime.toString(),
                            ),
                            SizedBox(
                              height: SizeUtils.screenHeight * 0.01,
                            ),
                            matchDetails(
                              title: 'Stadium/Venue :',
                              subtitle: homeController.infoList.first.matchvenue.toString(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BannerAds(),
    );
  }

  Widget matchDetails({
    required String title,
    required String subtitle,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppText(
          title,
          color: const Color(0xff717686),
          fontWeight: FontWeight.w400,
          fontSize: SizeUtils.fSize_15(),
          letterSpacing: 1,
        ),
        SizedBox(
          height: SizeUtils.horizontalBlockSize * 0.5,
        ),
        AppText(
          subtitle,
          color: AppColor.white,
          fontWeight: FontWeight.w500,
          fontSize: SizeUtils.fSize_15(),
          letterSpacing: 1,
        ),
        SizedBox(
          height: SizeUtils.horizontalBlockSize * 2,
        ),
      ],
    );
  }

  Widget teams({
    required String teamLogo,
    required String teamName,
  }) {
    return Row(
      children: [
        imageLoader(
          h: SizeUtils.horizontalBlockSize * 11,
          w: SizeUtils.horizontalBlockSize * 11,
          url: teamLogo,
        ),
        /*   CircleAvatar(
          backgroundColor: AppColor.appBarColor,
          minRadius: SizeUtils.screenWidth * 0.05,
          backgroundImage: NetworkImage(teamLogo),
        ),*/
        const SizedBox(
          width: 10,
        ),
        AppText(
          teamName,
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: SizeUtils.fSize_16(),
          letterSpacing: 1,
        ),
      ],
    );
  }

  line() {
    return Container(
      width: SizeUtils.horizontalBlockSize * 10,
      height: SizeUtils.horizontalBlockSize * 1.2,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0xff7892aa)),
    );
  }
}
