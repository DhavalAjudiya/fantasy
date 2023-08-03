import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/assets_path.dart';
import 'package:fantasyarenas/utils/navigation_utils/navigation.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_fade/image_fade.dart';

class FantasyPointPage extends StatelessWidget {
  FantasyPointPage({super.key});
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
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
        title: Column(
          children: [
            AppText(
              "${homeController.eName?.value}",
              color: AppColor.textColor,
              fontWeight: FontWeight.bold,
              fontSize: SizeUtils.fSize_17(),
            ),
            AppText(
              homeController.team?.value == "small" ? "Small Team" : "Head to Head Team",
              color: AppColor.textColor.withOpacity(0.5),
              fontWeight: FontWeight.bold,
              fontSize: SizeUtils.fSize_14(),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: SizeUtils.horizontalBlockSize * 3,
                left: SizeUtils.horizontalBlockSize * 3,
                top: SizeUtils.horizontalBlockSize * 3,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: (homeController.fani?.value.isEmpty ?? false)
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
                        image: NetworkImage(homeController.fani?.value.toString() ?? ""),
                        duration: const Duration(milliseconds: 500),
                        syncDuration: const Duration(milliseconds: 150),
                        placeholder: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage(AssetsPath.loaderImage),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        loadingBuilder: (context, progress, chunkEvent) => Center(
                            child: Center(child: CircularProgressIndicator(value: progress))),
                        errorBuilder: (context, error) => Container(
                          color: const Color(0xFF6F6D6A),
                          alignment: Alignment.center,
                          child: const Icon(Icons.warning, color: Colors.black26, size: 128.0),
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
