import 'package:fantasyarenas/modual/Ads_helper/ad_constant.dart';
import 'package:fantasyarenas/modual/Ads_helper/ads/native_ads.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.backGroundColor,
        leading: const SizedBox(),
        centerTitle: true,
        toolbarHeight: SizeUtils.screenHeight * 0.09,
        title: AppText(
          'Setting',
          textAlign: TextAlign.center,
          color: Colors.white,
          fontSize: SizeUtils.fSize_21(),
          letterSpacing: 1,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            secondItem(),
            NativeAds(),
          ],
        ),
      ),
    );
  }

  secondItem() {
    return Padding(
      padding: EdgeInsets.only(
        left: SizeUtils.horizontalBlockSize * 3,
        right: SizeUtils.horizontalBlockSize * 3,
        top: SizeUtils.horizontalBlockSize * 3.5,
        bottom: SizeUtils.horizontalBlockSize * 4,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.itemColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeUtils.horizontalBlockSize * 4,
            vertical: SizeUtils.horizontalBlockSize * 3,
          ),
          child: Column(
            children: [
              _item(
                text: "Rate us",
                onTap: () async {
                  if (!await launchUrl(
                    Uri.parse(AdConstants.appLink),
                    mode: LaunchMode.externalApplication,
                  )) {
                    throw Exception("Error");
                  }
                },
              ),
              Divider(
                height: SizeUtils.horizontalBlockSize * 5,
              ),
              _item(
                text: "Share app",
                onTap: () {
                  Share.share(AdConstants.appLink);
                },
              ),
              Divider(
                height: SizeUtils.horizontalBlockSize * 5,
              ),
              _item(
                text: "Terms & Condition",
                onTap: () async {
                  if (!await launchUrl(
                    Uri.parse(AdConstants.termsConditions),
                    mode: LaunchMode.externalApplication,
                  )) {
                    throw Exception("Error");
                  }
                },
              ),
              Divider(
                height: SizeUtils.horizontalBlockSize * 5,
              ),
              _item(
                text: "Privacy Policy",
                onTap: () async {
                  if (!await launchUrl(
                    Uri.parse(AdConstants.privacyPolicy),
                    mode: LaunchMode.externalApplication,
                  )) {
                    throw Exception("Error");
                  }
                },
              ),
              Divider(
                height: SizeUtils.horizontalBlockSize * 5,
              ),
              _item(
                text: "Check Version",
                onTap: () async {
                  if (!await launchUrl(
                    Uri.parse(AdConstants.appLink),
                    mode: LaunchMode.externalApplication,
                  )) {
                    throw Exception("Error");
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _item({String? text, GestureTapCallback? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          AppText(
            text ?? "",
            fontSize: SizeUtils.fSize_18(),
            color: AppColor.white,
            fontWeight: FontWeight.w400,
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColor.white,
            size: SizeUtils.horizontalBlockSize * 6,
          )
        ],
      ),
    );
  }
}
