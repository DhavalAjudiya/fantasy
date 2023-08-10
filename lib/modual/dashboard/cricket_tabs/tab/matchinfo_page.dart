import 'package:fantasyarenas/modual/Ads_helper/ads/banner_ads_widget.dart';
import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/assets_path.dart';
import 'package:fantasyarenas/utils/analytics.dart';
import 'package:fantasyarenas/utils/navigation_utils/navigation.dart';
import 'package:fantasyarenas/utils/navigation_utils/routes.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:fantasyarenas/widget/image_lodar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MatchInfoPage extends StatelessWidget {
  MatchInfoPage({super.key});

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    FirebaseAnalyticsUtils.sendCurrentScreen(FirebaseAnalyticsUtils.com);

    return Scaffold(
      backgroundColor: AppColor.backGroundLightColor,
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Navigation.pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: SizeUtils.fSize_21(),
          ),
        ),
        title: AppText(
          "${homeController.team1Name} vs ${homeController.team2Name}",
          color: AppColor.textColor,
          fontWeight: FontWeight.bold,
          fontSize: SizeUtils.fSize_15(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                top: SizeUtils.horizontalBlockSize * 4,
                right: SizeUtils.horizontalBlockSize * 3,
                left: SizeUtils.horizontalBlockSize * 3,
                bottom: SizeUtils.horizontalBlockSize * 1,
              ),
              child: AppText(
                "Tournament",
                color: AppColor.appBarColor,
                fontWeight: FontWeight.bold,
                fontSize: SizeUtils.fSize_16(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.horizontalBlockSize * 3,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffFFF1DC),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    imageLoader(
                      h: SizeUtils.horizontalBlockSize * 11,
                      w: SizeUtils.horizontalBlockSize * 11,
                      url: homeController.tourimage.toString(),
                    ),
                    /*     CircleAvatar(
                      backgroundImage:
                          NetworkImage(homeController.tourimage?.value.toString() ?? ""),
                    ),*/
                    SizedBox(width: SizeUtils.horizontalBlockSize * 3),
                    AppText(
                      homeController.tourname?.value.toString() ?? "",
                      // color: AppColor.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: SizeUtils.fSize_16(),
                    ),
                  ]),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: SizeUtils.horizontalBlockSize * 3,
                vertical: SizeUtils.horizontalBlockSize * 3,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffFFF1DC),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(AssetsPath.toss),
                      backgroundColor: AppColor.appBarColor,
                    ),
                    SizedBox(width: SizeUtils.horizontalBlockSize * 3),
                    AppText(
                      homeController.toss?.value.toString() ?? "",
                      // color: AppColor.textColor,
                      // fontWeight: FontWeight.bold,
                      fontSize: SizeUtils.fSize_16(),
                    ),
                  ]),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: SizeUtils.horizontalBlockSize * 3,
                left: SizeUtils.horizontalBlockSize * 3,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffFFF1DC),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: (homeController.manofn?.value.isEmpty ?? false)?  const SizedBox():manOfTheMatch(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: SizeUtils.horizontalBlockSize * 3,
                left: SizeUtils.horizontalBlockSize * 3,
                top: SizeUtils.horizontalBlockSize * 3,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffFFF1DC),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: (homeController.topplayer?.isEmpty ?? false) ? const SizedBox() : playerState(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: SizeUtils.horizontalBlockSize * 3,
                left: SizeUtils.horizontalBlockSize * 3,
                top: SizeUtils.horizontalBlockSize * 3,
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xffFFF1DC),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: (homeController.fantasypoint?.isEmpty ?? false)
                    ? Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: const Color(0xffFFF1DC),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding:  EdgeInsets.symmetric(vertical:  SizeUtils.horizontalBlockSize*3,),
                          child: AppText(
                            "Fantasy Point Will Be Available Soon!",
                            color: Colors.grey,
                            fontSize: SizeUtils.fSize_16(),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    : fantsyPoint(),
              ),
            ),
            SizedBox(height: SizeUtils.horizontalBlockSize * 5),
          ],
        ),
      ),
      bottomNavigationBar: BannerAds(),
    );
  }

  playerState() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: SizeUtils.horizontalBlockSize * 2,
            left: SizeUtils.horizontalBlockSize * 4,
            right: SizeUtils.horizontalBlockSize * 4,
          ),
          child: Row(
            children: [
              AppText(
                "Top 3 Player of Match",
                color: AppColor.appBarColor,
                fontWeight: FontWeight.bold,
                fontSize: SizeUtils.fSize_16(),
              ),
            ],
          ),
        ),
        const Divider(
          color: AppColor.appBarColor,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeUtils.horizontalBlockSize * 3,
            vertical: SizeUtils.horizontalBlockSize * 1,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.appBarColor,
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeUtils.horizontalBlockSize * 3,
                  vertical: SizeUtils.horizontalBlockSize * 1.5),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: AppText(
                      "Player",
                      color: AppColor.white,
                      fontSize: SizeUtils.fSize_13(),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  AppText(
                    "Point",
                    color: AppColor.white,
                    fontSize: SizeUtils.fSize_12(),
                    fontWeight: FontWeight.w700,
                  ),

                ],
              ),
            ),
          ),
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: homeController.topplayer?.length ?? 0,
          itemBuilder: (context, index) {
            var data = homeController.topplayer?[index];
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeUtils.horizontalBlockSize * 6,
                  vertical: SizeUtils.horizontalBlockSize * 0.5),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          data?.playername ?? "",
                          color: AppColor.appBarColor,
                          fontSize: SizeUtils.fSize_13(),
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                  AppText(
                    data?.playerr ?? "",
                    color: AppColor.appBarColor,
                    fontSize: SizeUtils.fSize_13(),
                    fontWeight: FontWeight.w600,
                  ),
                  /*      SizedBox(width: SizeUtils.horizontalBlockSize * 6),
                  Expanded(
                    child: AppText(
                      data?.playerr ?? "",
                      color: AppColor.appBarColor,
                      fontSize: SizeUtils.fSize_13(),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Expanded(
                    child: AppText(
                      data?.playerw ?? "",
                      color: AppColor.appBarColor,
                      fontSize: SizeUtils.fSize_13(),
                      fontWeight: FontWeight.w600,
                    ),
                  ),*/
                ],
              ),
            );
          },
        ),
        SizedBox(
          height: SizeUtils.screenHeight * 0.02,
        ),
      ],
    );
  }

  manOfTheMatch() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: SizeUtils.horizontalBlockSize * 2,
            left: SizeUtils.horizontalBlockSize * 4,
            right: SizeUtils.horizontalBlockSize * 4,
          ),
          child: Row(
            children: [
              AppText(
                "Man of the Match",
                color: AppColor.appBarColor,
                fontWeight: FontWeight.bold,
                fontSize: SizeUtils.fSize_16(),
              ),
            ],
          ),
        ),
        const Divider(
          color: AppColor.appBarColor,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 2),
          child: Column(
            children: [
              Row(children: [
                imageLoader(
                  h: SizeUtils.horizontalBlockSize * 11,
                  w: SizeUtils.horizontalBlockSize * 11,
                  url: homeController.manOfi.toString(),
                ),
                /*        CircleAvatar(
                    backgroundImage: NetworkImage(homeController.manOfi?.value.toString() ?? "")),*/
                SizedBox(width: SizeUtils.horizontalBlockSize * 3),
                AppText(
                  homeController.manofn?.value.toString() ?? "",
                  fontWeight: FontWeight.bold,
                  fontSize: SizeUtils.fSize_16(),
                ),
              ]),
              SizedBox(height: SizeUtils.horizontalBlockSize * 2),
/*
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "W ",
                      children: [
                        TextSpan(
                            text: homeController.manofp?.value.substring(0, 1) ?? "",
                            style: const TextStyle(
                                color: AppColor.appBarColor, fontWeight: FontWeight.w400)),
                      ],
                      style:
                          const TextStyle(color: AppColor.appBarColor, fontWeight: FontWeight.w600),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "R ",
                      children: [
                        TextSpan(
                            text: homeController.manofp?.value.substring(1, 4) ?? "",
                            style: const TextStyle(
                                color: AppColor.appBarColor, fontWeight: FontWeight.w400)),
                      ],
                      style:
                          const TextStyle(color: AppColor.appBarColor, fontWeight: FontWeight.w600),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "OV",
                      children: [
                        TextSpan(
                            text: homeController.manofp?.value.substring(0, 1) ?? "",
                            style: const TextStyle(
                                color: AppColor.appBarColor, fontWeight: FontWeight.w400)),
                      ],
                      style:
                          const TextStyle(color: AppColor.appBarColor, fontWeight: FontWeight.w600),
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: "C ",
                      children: [
                        TextSpan(
                            text: homeController.manofp?.value.substring(1, 2) ?? "",
                            style: const TextStyle(
                                color: AppColor.appBarColor, fontWeight: FontWeight.w400)),
                      ],
                      style:
                          const TextStyle(color: AppColor.appBarColor, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
*/
            ],
          ),
        ),
        SizedBox(
          height: SizeUtils.horizontalBlockSize * 1.5,
        ),
      ],
    );
  }

  fantsyPoint() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: SizeUtils.horizontalBlockSize * 2,
            left: SizeUtils.horizontalBlockSize * 4,
            right: SizeUtils.horizontalBlockSize * 4,
          ),
          child: Row(
            children: [
              AppText(
                "Fantasy Point",
                color: AppColor.appBarColor,
                fontWeight: FontWeight.bold,
                fontSize: SizeUtils.fSize_16(),
              ),
            ],
          ),
        ),
        const Divider(
          color: AppColor.appBarColor,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: homeController.fantasypoint?.length ?? 0,
          itemBuilder: (context, index) {
            var data = homeController.fantasypoint?[index];
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeUtils.horizontalBlockSize * 6,
                  vertical: SizeUtils.horizontalBlockSize * 1),
              child: GestureDetector(
                onTap: () {
                  homeController.fani?.value = data?.fantasyimage ?? "";
                  homeController.team?.value = data?.teamtype ?? "";
                  homeController.eName?.value = data?.expertname ?? "";
                  Navigation.pushNamed(Routes.fantasyPointPage);
                },
                child: Row(children: [
                  imageLoader(
                    h: SizeUtils.horizontalBlockSize * 11,
                    w: SizeUtils.horizontalBlockSize * 11,
                    url: data?.expertimage ?? "",
                  ),
                  SizedBox(width: SizeUtils.horizontalBlockSize * 3),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        data?.expertname ?? "",
                        // color: AppColor.textColor,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeUtils.fSize_16(),
                      ),
                      AppText(
                        data?.teamtype == "small" ? "Small Team" : "Head to Head Team",
                        color: AppColor.black.withOpacity(0.5),
                        fontWeight: FontWeight.bold,
                        // fontSize: SizeUtils.fSize_16(),
                      ),
                    ],
                  ),
                  const Spacer(),
                  AppText(
                    data?.fantasypoint ?? "",
                    // color: AppColor.textColor,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeUtils.fSize_16(),
                  ),
                ]),
              ),
            );
          },
        ),
      ],
    );
  }
}
