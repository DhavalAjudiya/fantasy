import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/utils/navigation_utils/navigation.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/utils/time_manager.dart';
import 'package:fantasyarenas/utils/translate_up_animation.dart';
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
      backgroundColor: AppColor.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Hero(
                tag: "news${argument["index"].toString()}",
                child: Stack(
                  children: [
                    Image.network(argument["image"].toString()),
                    Positioned(
                      top: SizeUtils.horizontalBlockSize * 2.5,
                      left: SizeUtils.horizontalBlockSize * 3,
                      child: GestureDetector(
                        onTap: () {
                          Navigation.pop();
                        },
                        child: const Icon(
                          Icons.arrow_back_sharp,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: SizeUtils.horizontalBlockSize * 4,
                    vertical: SizeUtils.horizontalBlockSize * 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TranslateUpAnimation(
                      duration: const Duration(milliseconds: 1700),
                      child: AppText(
                        argument["title"].toString(),
                        color: AppColor.white,
                        fontWeight: FontWeight.bold,
                        fontSize: SizeUtils.fSize_15(),
                      ),
                    ),
                    SizedBox(height: SizeUtils.horizontalBlockSize * 1),
                    TranslateUpAnimation(
                      duration: const Duration(milliseconds: 1800),
                      child: AppText(
                        argument["subtitle"].toString(),
                        color: AppColor.white.withOpacity(0.5),
                        fontSize: SizeUtils.fSize_11(),
                      ),
                    ),
                    SizedBox(height: SizeUtils.horizontalBlockSize * 1),
                    TranslateUpAnimation(
                      duration: const Duration(milliseconds: 1900),
                      child: AppText(
                        TimeManager.setNewsUpdateTime(argument["time"]),
                        color: AppColor.white.withOpacity(0.5),
                        fontSize: SizeUtils.fSize_10(),
                      ),
                    ),
                    SizedBox(height: SizeUtils.horizontalBlockSize * 3),
                    TranslateUpAnimation(
                      duration: const Duration(milliseconds: 2000),
                      child: AppText(
                        argument["description"].toString(),
                        color: AppColor.white,
                        fontWeight: FontWeight.w300,
                        fontSize: SizeUtils.fSize_12(),
                      ),
                    ),
                    SizedBox(height: SizeUtils.horizontalBlockSize * 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
