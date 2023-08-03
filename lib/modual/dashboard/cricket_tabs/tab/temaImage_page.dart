import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:fantasyarenas/widget/image_lodar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_fade/image_fade.dart';

import '../../../../res/assets_path.dart';
import '../../../../utils/size_utils.dart';

class TeamImagePage extends StatelessWidget {
  TeamImagePage({super.key});

  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appBarColor,
        centerTitle: true,
        title: const AppText(
          'Team Preview',
          color: Colors.white,
        ),
      ),
      backgroundColor: AppColor.backGroundLightColor,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: homeController.teamImage.value.isEmpty
                    ? Column(
                        children: [
                          Container(
                            alignment: Alignment.bottomCenter,
                            height: SizeUtils.horizontalBlockSize * 140,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage(AssetsPath.loaderImage),
                              fit: BoxFit.cover,
                            )),
                            child: Padding(
                              padding: EdgeInsets.only(bottom: SizeUtils.horizontalBlockSize * 15),
                              child: AppText(
                                "Sorry😔 No Team available here",
                                fontSize: SizeUtils.fSize_18(),
                                fontWeight: FontWeight.w500,
                                color: AppColor.white,
                              ),
                            ),
                          ),
                        ],
                      )
                    : ImageFade(
                        image: NetworkImage(homeController.teamImage.value),
                        duration: const Duration(milliseconds: 500),

                        syncDuration: const Duration(milliseconds: 150),

                        alignment: Alignment.center,
                        fit: BoxFit.cover,

                        placeholder: Center(
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage(AssetsPath.loaderImage),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),

                        loadingBuilder: (context, progress, chunkEvent) => Center(
                            child: Center(
                                child: CircularProgressIndicator(
                                    value: progress, color: AppColor.appBarColor))),

                        // displayed when an error occurs:
                        errorBuilder: (context, error) => Container(
                          color: const Color(0xFF6F6D6A),
                          alignment: Alignment.center,
                          child: const Icon(Icons.warning, color: Colors.black26, size: 128.0),
                        ),
                      ),
              ),
              // child: Image.network(homeController.teamImage.value),
            ),
          ],
        ),
      ),
    );
  }
}
