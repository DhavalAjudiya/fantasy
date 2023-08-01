import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/assets_path.dart';
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
      backgroundColor: AppColor.backGroundLightColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
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
                    color: AppColor.appBarColor,
                    fontWeight: FontWeight.w700,
                    fontSize: SizeUtils.fSize_17(),
                    letterSpacing: 1,
                  ),
                  SizedBox(
                    height: SizeUtils.screenHeight * 0.01,
                  ),
                  Row(
                    children: [
                      imageLoader(
                          h: SizeUtils.horizontalBlockSize * 12,
                          w: SizeUtils.horizontalBlockSize * 12,
                          url: homeController.infoList.first.tournamentI.toString()),
                      /*  CircleAvatar(
                        backgroundColor: AppColor.appBarColor,
                        minRadius: SizeUtils.horizontalBlockSize * 5,
                        backgroundImage:
                            NetworkImage(homeController.infoList.first.tournamentI.toString()),
                      ),*/
                      const SizedBox(
                        width: 10,
                      ),
                      AppText(
                        homeController.infoList.first.tournamentN.toString(),
                        color: Colors.grey.withOpacity(0.7),
                        fontWeight: FontWeight.w700,
                        fontSize: SizeUtils.fSize_16(),
                        letterSpacing: 1,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: SizeUtils.screenHeight * 0.02,
            ),
            Divider(
              thickness: 24,
              color: AppColor.appBarColor.withOpacity(0.1),
            ),
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
                    'Teams',
                    color: AppColor.appBarColor,
                    fontWeight: FontWeight.w700,
                    fontSize: SizeUtils.fSize_17(),
                    letterSpacing: 1,
                  ),
                  SizedBox(
                    height: SizeUtils.screenHeight * 0.015,
                  ),
                  teams(
                    teamLogo: homeController.infoList.first.team1I.toString(),
                    teamName: homeController.infoList.first.team1N.toString(),
                  ),
                  SizedBox(
                    height: SizeUtils.screenHeight * 0.01,
                  ),
                  Divider(
                    color: AppColor.appBarColor.withOpacity(0.1),
                    thickness: 2,
                  ),
                  SizedBox(
                    height: SizeUtils.screenHeight * 0.01,
                  ),
                  teams(
                    teamLogo: homeController.infoList.first.team2I.toString(),
                    teamName: homeController.infoList.first.team2N.toString(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: SizeUtils.screenHeight * 0.015,
            ),
            Divider(
              thickness: 20,
              color: AppColor.appBarColor.withOpacity(0.1),
            ),
            SizedBox(
              height: SizeUtils.screenHeight * 0.015,
            ),
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
                          color: const Color(0xffFFF1DC),
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
                            color: Colors.grey,
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
                          color: AppColor.appBarColor,
                          fontWeight: FontWeight.w700,
                          fontSize: SizeUtils.fSize_17(),
                          letterSpacing: 1,
                        ),
                        SizedBox(
                          height: SizeUtils.screenHeight * 0.020,
                        ),
                        matchDetails(
                          title: 'Match',
                          subtitle: homeController.infoList.first.match.toString(),
                        ),
                        SizedBox(
                          height: SizeUtils.screenHeight * 0.01,
                        ),
                        matchDetails(
                          title: 'Match Start Time',
                          subtitle: homeController.infoList.first.matchtime.toString(),
                        ),
                        SizedBox(
                          height: SizeUtils.screenHeight * 0.01,
                        ),
                        matchDetails(
                          title: 'Stadium/Venue',
                          subtitle: homeController.infoList.first.matchvenue.toString(),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
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
          color: Colors.grey,
          fontWeight: FontWeight.w700,
          fontSize: SizeUtils.fSize_13(),
          letterSpacing: 1,
        ),
        SizedBox(
          height: SizeUtils.screenHeight * 0.01,
        ),
        AppText(
          subtitle,
          color: AppColor.appBarColor.withOpacity(0.5),
          fontWeight: FontWeight.w500,
          fontSize: SizeUtils.fSize_13(),
          letterSpacing: 1,
        ),
        SizedBox(
          height: SizeUtils.screenHeight * 0.01,
        ),
        Divider(
          color: Colors.grey.withOpacity(0.1),
          thickness: 2,
        ),
        SizedBox(
          height: SizeUtils.screenHeight * 0.01,
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
          color: Colors.grey.withOpacity(0.7),
          fontWeight: FontWeight.w700,
          fontSize: SizeUtils.fSize_16(),
          letterSpacing: 1,
        ),
      ],
    );
  }
}
