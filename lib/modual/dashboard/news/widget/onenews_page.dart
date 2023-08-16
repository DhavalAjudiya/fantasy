import 'package:colorful_safe_area/colorful_safe_area.dart';
import 'package:fantasyarenas/modual/Ads_helper/ads/banner_ads_widget.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/utils/navigation_utils/navigation.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/utils/time_manager.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OneNewsPage extends StatefulWidget {
  OneNewsPage({super.key});

  @override
  State<OneNewsPage> createState() => _OneNewsPageState();
}

class _OneNewsPageState extends State<OneNewsPage> {
  late var argument;

  @override
  void initState() {
    super.initState();
    argument = Get.arguments;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: ColorfulSafeArea(
        color: AppColor.backGroundColor,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: "news${argument["index"].toString()}",
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeUtils.screenHeight * 0.02,
                          horizontal: SizeUtils.screenWidth * 0.03),
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.network(
                          argument["image"].toString(),
                        ),
                      ),
                    ),
                    Positioned(
                      top: SizeUtils.horizontalBlockSize * 6,
                      left: SizeUtils.horizontalBlockSize * 5,
                      child: GestureDetector(
                        onTap: () {
                          Navigation.pop();
                        },
                        child: Icon(
                          Icons.arrow_back_sharp,
                          color: Colors.white,
                          size: SizeUtils.screenWidth * 0.08,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeUtils.horizontalBlockSize * 4,
                  vertical: SizeUtils.horizontalBlockSize * 1.5,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildDivider(),
                    SizedBox(
                      height: SizeUtils.screenHeight * 0.01,
                    ),
                    AppText(
                      argument["title"].toString(),
                      color: AppColor.white,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeUtils.fSize_17(),
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(
                      height: SizeUtils.horizontalBlockSize * 3,
                    ),
                    AppText(
                      argument["subtitle"].toString(),
                      color: AppColor.white.withOpacity(0.7),
                      fontSize: SizeUtils.fSize_13(),
                      letterSpacing: 1,
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: SizeUtils.horizontalBlockSize * 3,
                    ),
                    AppText(
                      TimeManager.setNewsUpdateTime(argument["time"]),
                      color: Colors.white.withOpacity(0.5),
                      fontSize: SizeUtils.fSize_12(),
                    ),
                    SizedBox(
                      height: SizeUtils.horizontalBlockSize * 2,
                    ),
                    buildDivider(),
                    SizedBox(
                      height: SizeUtils.horizontalBlockSize * 2,
                    ),
                    AppText(
                      argument["description"].toString(),
                      color: Colors.white.withOpacity(0.5),
                      fontWeight: FontWeight.w400,
                      wordSpacing: 1,
                      fontSize: SizeUtils.fSize_15(),
                    ),
                    SizedBox(
                      height: SizeUtils.horizontalBlockSize * 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BannerAds(),
    );
  }

  Divider buildDivider() {
    return Divider(
      color: Colors.grey,
    );
  }
}
