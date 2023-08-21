import 'package:fantasyarenas/modual/Ads_helper/ads/banner_ads_widget.dart';
import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/utils/navigation_utils/navigation.dart';
import 'package:fantasyarenas/utils/navigation_utils/routes.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:fantasyarenas/widget/image_lodar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FantasyCenter extends StatelessWidget {
  FantasyCenter({super.key});

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: SingleChildScrollView(
          child: Column(children: [
        Padding(
          padding: EdgeInsets.only(
            right: SizeUtils.horizontalBlockSize * 4,
            left: SizeUtils.horizontalBlockSize * 4,
            top: SizeUtils.horizontalBlockSize * 3,
            bottom: SizeUtils.horizontalBlockSize * 4,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.itemColor,
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
              color: AppColor.itemColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: (homeController.fantasypoint?.isEmpty ?? false)
                ? Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColor.itemColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: SizeUtils.horizontalBlockSize * 3,
                      ),
                      child: AppText(
                        "Fantasy Point Will Be Available Soon!",
                        color: AppColor.white,
                        fontSize: SizeUtils.fSize_16(),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : fantasyPoint(),
          ),
        ),
      ])),
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
                color: AppColor.white,
                fontWeight: FontWeight.bold,
                fontSize: SizeUtils.fSize_16(),
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeUtils.horizontalBlockSize * 3,
            vertical: SizeUtils.horizontalBlockSize * 1,
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColor.backGroundColor,
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
                    "Selected %",
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
                          color: AppColor.white,
                          fontSize: SizeUtils.fSize_13(),
                          fontWeight: FontWeight.w600,
                        ),
                      ],
                    ),
                  ),
                  AppText(
                    data?.playerr ?? "",
                    color: AppColor.white,
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
          height: SizeUtils.horizontalBlockSize * 2,
        ),
      ],
    );
  }

  fantasyPoint() {
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
                color: AppColor.white,
                fontWeight: FontWeight.bold,
                fontSize: SizeUtils.fSize_16(),
              ),
            ],
          ),
        ),
        const Divider(
          color: Colors.grey,
        ),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: homeController.fantasypoint?.length ?? 0,
          itemBuilder: (context, index) {
            var data = homeController.fantasypoint?[index];
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeUtils.horizontalBlockSize * 4,
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
                        color: AppColor.white,
                        fontWeight: FontWeight.w600,
                        fontSize: SizeUtils.fSize_16(),
                      ),
                      AppText(
                        data?.teamtype == "small" ? "Small Team" : "Head to Head Team",
                        color: AppColor.white.withOpacity(0.5),
                        fontWeight: FontWeight.w400,
                        fontSize: SizeUtils.fSize_12(),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppText(
                        data?.fantasypoint ?? "",
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeUtils.fSize_16(),
                      ),
                      Row(
                        children: [
                          AppText(
                            "See Team",
                            color: AppColor.white.withOpacity(0.5),
                            fontWeight: FontWeight.w400,
                            fontSize: SizeUtils.fSize_11(),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: SizeUtils.horizontalBlockSize * 3,
                            color: AppColor.white.withOpacity(0.5),
                          )
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
            );
          },
        ),
        SizedBox(
          height: SizeUtils.horizontalBlockSize * 2,
        ),
      ],
    );
  }
}
