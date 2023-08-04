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
      backgroundColor: AppColor.backGroundLightColor,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: AppColor.appBarColor,
        leading: const SizedBox(),
        centerTitle: true,
        toolbarHeight: SizeUtils.screenHeight * 0.09,
        title: AppText(
          'Setting',
          textAlign: TextAlign.center,
          color: Colors.white.withOpacity(0.8),
          fontSize: SizeUtils.fSize_21(),
          letterSpacing: 1,
        ),
      ),
      body: Column(
        children: [
          secondItem(),
        ],
      ),
    );
  }

  secondItem() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeUtils.horizontalBlockSize * 3,
        vertical: SizeUtils.horizontalBlockSize * 3.5,
      ),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.appBarColor,
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              blurRadius: 5,
              spreadRadius: 8,
            ),
          ],
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
                    Uri.parse(
                        "https://apps.apple.com/us/app/my-qr-code-reader-generator/id6449487974"),
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
                  Share.share(
                      "https://apps.apple.com/us/app/my-qr-code-reader-generator/id6449487974");
                },
              ),
              Divider(
                height: SizeUtils.horizontalBlockSize * 5,
              ),
              _item(
                text: "Terms & Condition",
                onTap: () async {
                  if (!await launchUrl(
                    Uri.parse("https://atharvtechs.com/terms-condition/"),
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
                    Uri.parse("https://atharvtechs.com/privacy-policy/"),
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
                    Uri.parse(
                        "https://apps.apple.com/us/app/my-qr-code-reader-generator/id6449487974"),
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
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          AppText(
            text ?? "",
            fontSize: SizeUtils.fSize_18(),
            color: AppColor.textColor,
            fontWeight: FontWeight.w400,
          ),
          const Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            color: AppColor.textColor,
            size: SizeUtils.horizontalBlockSize * 6,
          )
        ],
      ),
    );
  }
}
