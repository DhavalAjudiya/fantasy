import 'package:fantasyarenas/modual/Ads_helper/ads/banner_ads_widget.dart';
import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/assets_path.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:fantasyarenas/widget/image_lodar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_fade/image_fade.dart';

class SquadPage extends StatefulWidget {
  SquadPage({super.key});

  @override
  State<SquadPage> createState() => _SquadPageState();
}

class _SquadPageState extends State<SquadPage> {
  HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backGroundColor,
      body: Padding(
        padding: EdgeInsets.symmetric(
          vertical: SizeUtils.horizontalBlockSize * 3,
        ),
        child: homeController.squad1image.isEmpty && homeController.squad2image.isEmpty
            ? Column(
                children: [
                  Center(child: Image.asset(AssetsPath.squad, scale: 2)),
                  AppText(
                    "Squad will be available later...",
                    fontWeight: FontWeight.w500,
                    color: AppColor.white,
                    fontSize: SizeUtils.fSize_17(),
                  ),
                ],
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: SizeUtils.horizontalBlockSize * 1,
                        right: SizeUtils.horizontalBlockSize * 4,
                        left: SizeUtils.horizontalBlockSize * 4,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColor.itemColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: SizeUtils.horizontalBlockSize * 4,
                            horizontal: SizeUtils.horizontalBlockSize * 4,
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color(0xff171b24),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: SizeUtils.horizontalBlockSize * 1,
                                horizontal: SizeUtils.horizontalBlockSize * 1,
                              ),
                              child: Obx(
                                () => Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        homeController.changeSquad.value = false;
                                      },
                                      child: Container(
                                        width: SizeUtils.horizontalBlockSize * 40,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: homeController.changeSquad.value
                                              ? const Color(0xff171b24)
                                              : AppColor.backGroundColor,
                                          border: Border.all(
                                              color: homeController.changeSquad.value
                                                  ? const Color(0xff171b24)
                                                  : Colors.green),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: SizeUtils.horizontalBlockSize * 2,
                                          ),
                                          child: AppText(homeController.team1Name.toString(),
                                              color: Colors.white, fontSize: SizeUtils.fSize_17()),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        homeController.changeSquad.value = true;
                                      },
                                      child: Container(
                                        width: SizeUtils.horizontalBlockSize * 40,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: !homeController.changeSquad.value
                                              ? const Color(0xff171b24)
                                              : AppColor.backGroundColor,
                                          border: Border.all(
                                              color: !homeController.changeSquad.value
                                                  ? const Color(0xff171b24)
                                                  : Colors.green),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: SizeUtils.horizontalBlockSize * 2,
                                          ),
                                          child: AppText(homeController.team2Name.toString(),
                                              color: Colors.white, fontSize: SizeUtils.fSize_17()),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Obx(
                      () => !homeController.changeSquad.value
                          ? ImageFade(
                              image: NetworkImage(homeController.squad1image.value),
                              duration: const Duration(milliseconds: 500),
                              syncDuration: const Duration(milliseconds: 150),
                              // alignment: Alignment.center,
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
                                  child: Padding(
                                padding: EdgeInsets.only(top: SizeUtils.horizontalBlockSize * 50),
                                child: CircularProgressIndicator(value: progress, color: AppColor.white),
                              )),

                              // displayed when an error occurs:
                              errorBuilder: (context, error) => Container(
                                color: const Color(0xFF6F6D6A),
                                alignment: Alignment.center,
                                child: const Icon(Icons.warning, color: Colors.black26, size: 128.0),
                              ),
                            )
                          : ImageFade(
                              image: NetworkImage(homeController.squad2image.value),
                              duration: const Duration(milliseconds: 500),

                              syncDuration: const Duration(milliseconds: 150),

                              // alignment: Alignment.center,
                              fit: BoxFit.fitWidth,

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
                                  child: Padding(
                                padding: EdgeInsets.only(top: SizeUtils.horizontalBlockSize * 50),
                                child: CircularProgressIndicator(value: progress, color: AppColor.white),
                              )),

                              // displayed when an error occurs:
                              errorBuilder: (context, error) => Container(
                                color: const Color(0xFF6F6D6A),
                                alignment: Alignment.center,
                                child: const Icon(Icons.warning, color: Colors.black26, size: 128.0),
                              ),
                            ),
                    ),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: BannerAds(),
    );
  }

  teamSquad({
    String? name,
    String? type,
    String? image,
    bool? played,
  }) {
    String? s = name?.replaceAll(" ", "-") ?? "";
    String? a = s.split("-").first;
    String? b = s.split("-").last;
    String c = a.substring(0, 1).toUpperCase();
    String d = b.substring(0, 1).toUpperCase();
    String e = a.replaceRange(0, 1, c);
    String f = b.replaceRange(0, 1, d);
    name = "$e $f";
    return Padding(
      padding: EdgeInsets.only(
        top: SizeUtils.horizontalBlockSize * 2,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: imageLoader(
                h: SizeUtils.horizontalBlockSize * 11,
                w: SizeUtils.horizontalBlockSize * 11,
                url: image ?? ""),
            /*    child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 25,
              foregroundColor: AppColor.cardBtn,
              backgroundImage: NetworkImage(
                image ?? "https://wallpapercave.com/wp/wp9220300.jpg",
              ),
            ),*/
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(left: SizeUtils.horizontalBlockSize * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: SizeUtils.horizontalBlockSize * 5.5,
                    child: AppText(
                      name ?? "",
                      fontSize: SizeUtils.fSize_15(),
                      fontWeight: FontWeight.w500,
                      color: AppColor.black,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  AppText(
                    type?.toUpperCase() ?? "",
                    fontSize: SizeUtils.fSize_12(),
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          // const Spacer(),
          // played == true
          //     ? const Icon(
          //         Icons.done_all,
          //         color: Colors.green,
          //       )
          //     : const SizedBox(),
        ],
      ),
    );
  }

  teamSquad2({
    String? name,
    String? type,
    String? image,
    bool? played,
  }) {
    String? s = name?.replaceAll(" ", "-") ?? "";

    String? a = s.split("-").first;
    String? b = s.split("-").last;
    String c = a.substring(0, 1).toUpperCase();
    String d = b.substring(0, 1).toUpperCase();
    String e = a.replaceRange(0, 1, c);
    String f = b.replaceRange(0, 1, d);
    name = "$e $f";
    return Padding(
      padding: EdgeInsets.only(
        top: SizeUtils.horizontalBlockSize * 2,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.only(right: SizeUtils.horizontalBlockSize * 2),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: SizeUtils.horizontalBlockSize * 5.5,
                    child: AppText(
                      name ?? "",
                      fontSize: SizeUtils.fSize_15(),
                      fontWeight: FontWeight.w500,
                      color: AppColor.black,
                      textAlign: TextAlign.right,
                    ),
                  ),
                  AppText(
                    type?.toUpperCase() ?? "",
                    fontSize: SizeUtils.fSize_12(),
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: imageLoader(
              h: SizeUtils.horizontalBlockSize * 11,
              w: SizeUtils.horizontalBlockSize * 11,
              url: image ?? "",
            ),
            /*  child: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 25,
              foregroundColor: AppColor.cardBtn,
              backgroundImage: NetworkImage(
                image ?? "https://wallpapercave.com/wp/wp9220300.jpg",
              ),
            ),*/
          ),
          // const Spacer(),
          // played == true
          //     ? const Icon(
          //         Icons.done_all,
          //         color: Colors.green,
          //       )
          //     : const SizedBox(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    homeController.showFirstSquad.value = false;
    homeController.showSecondSquad.value = false;
  }
}
