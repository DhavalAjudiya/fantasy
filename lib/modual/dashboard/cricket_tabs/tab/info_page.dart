import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/assets_path.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

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
                      CircleAvatar(
                        backgroundColor: AppColor.appBarColor,
                        minRadius: SizeUtils.screenWidth * 0.05,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      AppText(
                        'Major League Cricket, 2023',
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
                    teamLogo: AssetsPath.plaBage,
                    teamName: 'Texas Super king',
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
                    teamLogo: AssetsPath.plaBage,
                    teamName: 'Mi New York',
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
              child: Column(
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
                    subtitle: 'Match 7, T20, Major League Cricket'
                  ),
                  SizedBox(
                    height: SizeUtils.screenHeight * 0.01,
                  ),
                  matchDetails(
                      title: 'Match Start Time',
                      subtitle: '6:00 AM, 18 Jul, 2023'
                  ),
                  SizedBox(
                    height: SizeUtils.screenHeight * 0.01,
                  ),
                  matchDetails(
                      title: 'Stadium/Venue',
                      subtitle: 'Grand Prairies Stadium, USA'
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
        CircleAvatar(
          backgroundColor: AppColor.appBarColor,
          minRadius: SizeUtils.screenWidth * 0.05,
          backgroundImage: AssetImage(teamLogo),
        ),
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
