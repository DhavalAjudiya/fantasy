import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/assets_path.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:flutter/material.dart';

class KabaddiHomePage extends StatelessWidget {
  const KabaddiHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundLightColor,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: SizeUtils.screenWidth,
              height: SizeUtils.screenHeight * 0.25,
              decoration: BoxDecoration(
                // color: const Color(0xff205295).withOpacity(0.2),
                gradient: LinearGradient(
                  colors: [
                    const Color(0xff205295).withOpacity(0.4),
                    const Color(0xff205295).withOpacity(0.2),
                    const Color(0xff205295).withOpacity(0.1),
                    Colors.transparent,
                  ],
                  begin: FractionalOffset.topCenter,
                  end: FractionalOffset.bottomCenter,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(bottom: SizeUtils.screenHeight * 0.08),
                child: Opacity(
                  opacity: 0.4,
                  child: Image.asset(
                    AssetsPath.backImage,
                    fit: BoxFit.cover,
                    color: AppColor.appBarColor.withOpacity(0.1),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: SizeUtils.horizontalBlockSize * 3),
              child: Column(
                children: [
                  SizedBox(height: SizeUtils.horizontalBlockSize * 25),
                  Image.asset(AssetsPath.kabaddi, color: AppColor.appBarColor),
                  SizedBox(height: SizeUtils.horizontalBlockSize * 5),
                  AppText("Kabaddi Fantasy and Match Details Are Coming Soon",
                      textAlign: TextAlign.center,
                      color: AppColor.appBarColor,
                      fontWeight: FontWeight.w500,
                      fontSize: SizeUtils.fSize_18()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
