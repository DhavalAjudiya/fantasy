import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasyarenas/modual/Ads_helper/ads/interstitialAd.dart';
import 'package:fantasyarenas/modual/dashboard/news/modal/news_modal.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/appconfig.dart';
import 'package:fantasyarenas/res/assets_path.dart';
import 'package:fantasyarenas/utils/analytics.dart';
import 'package:fantasyarenas/utils/navigation_utils/navigation.dart';
import 'package:fantasyarenas/utils/navigation_utils/routes.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/utils/time_manager.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:image_fade/image_fade.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseAnalyticsUtils.sendCurrentScreen(FirebaseAnalyticsUtils.news);

    return Scaffold(
        backgroundColor: AppColor.backGroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.backGroundColor,
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: AppText(
            'News',
            textAlign: TextAlign.center,
            color: Colors.white,
            fontSize: SizeUtils.fSize_21(),
            letterSpacing: 1,
          ),
        ),
        body: Column(
          children: [news()],
        ));
  }

  appIcon() {
    return Padding(
      padding: EdgeInsets.only(bottom: SizeUtils.horizontalBlockSize * 3),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey.withOpacity(0.5),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: SizeUtils.horizontalBlockSize * 2,
              vertical: SizeUtils.horizontalBlockSize * 1),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.asset(
                    AssetsPath.fantasy,
                    height: SizeUtils.horizontalBlockSize * 13,
                    width: SizeUtils.horizontalBlockSize * 20,
                    fit: BoxFit.fill,
                  )),
              SizedBox(width: SizeUtils.horizontalBlockSize * 2),
              RichText(
                text: TextSpan(
                    text: "Fantasy",
                    style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.w600,
                      fontSize: SizeUtils.fSize_18(),
                    ),
                    children: [
                      TextSpan(
                        text: "\nArenas",
                        style: TextStyle(
                          color: AppColor.white,
                          fontWeight: FontWeight.w300,
                          fontSize: SizeUtils.fSize_14(),
                        ),
                      ),
                    ]),
              ),
              const Spacer(),
              Icon(
                SFSymbols.gamecontroller,
                size: SizeUtils.horizontalBlockSize * 10,
              )
            ],
          ),
        ),
      ),
    );
  }

  news() {
    List<NewsModal> newsList = [];
    return StreamBuilder(
      stream: AppConfig.databaseReference
          .collection(AppConfig.news)
          .orderBy("time", descending: true)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        newsList.clear();

        for (var element in snapshot.data?.docs ?? []) {
          NewsModal highlightModal = NewsModal.fromMap(element.data() as Map<String, dynamic>);
          newsList.add(highlightModal);
        }
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return newsList.isEmpty
                ? Column(
                    children: [
                      SizedBox(height: SizeUtils.verticalBlockSize * 30),
                      Icon(SFSymbols.doc_text, size: SizeUtils.horizontalBlockSize * 15),
                      SizedBox(height: SizeUtils.horizontalBlockSize * 3),
                      AppText(
                        "News not found",
                        fontSize: SizeUtils.fSize_20(),
                        color: AppColor.white,
                      )
                    ],
                  )
                : Expanded(
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: newsList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                              left: SizeUtils.horizontalBlockSize * 2,
                              right: SizeUtils.horizontalBlockSize * 2),
                          child: Container(
                            decoration: BoxDecoration(
                              color: AppColor.itemColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: SizeUtils.screenWidth * 0.02,
                                vertical: SizeUtils.screenHeight * 0.02,
                              ),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      InterstitialAdClass.showInterstitialAds();
                                      Navigation.pushNamed(
                                        Routes.oneNewsPage,
                                        arg: {
                                          "title": newsList[index].title.toString(),
                                          "description": newsList[index].description.toString(),
                                          "image": newsList[index].image.toString(),
                                          "subtitle": newsList[index].subtitle.toString() ?? "",
                                          "time": newsList[index].time ?? 0,
                                          "index": index,
                                        },
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Hero(
                                        tag: "news$index",
                                        child: Row(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: SizeUtils.screenHeight * 0.13,
                                              width: SizeUtils.screenWidth * 0.34,
                                              child: ClipRRect(
                                                borderRadius: BorderRadius.circular(10),
                                                child: ImageFade(
                                                  image: NetworkImage(
                                                    newsList[index].image.toString(),
                                                  ),
                                                  duration: const Duration(
                                                    milliseconds: 900,
                                                  ),
                                                  syncDuration: const Duration(
                                                    milliseconds: 150,
                                                  ),
                                                  fit: BoxFit.cover,
                                                  placeholder: Container(
                                                    color: const Color(0xFFCFCDCA),
                                                    alignment: Alignment.center,
                                                    child: const Icon(
                                                      Icons.photo,
                                                      color: Colors.white30,
                                                      size: 115.0,
                                                    ),
                                                  ),
                                                  loadingBuilder: (context, progress, chunkEvent) =>
                                                      Center(
                                                    child: CircularProgressIndicator(
                                                      value: progress,
                                                    ),
                                                  ),
                                                  errorBuilder: (context, error) => Container(
                                                    color: const Color(0xFF6F6D6A),
                                                    alignment: Alignment.center,
                                                    child: const Icon(
                                                      Icons.warning,
                                                      color: Colors.black26,
                                                      size: 115.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: SizeUtils.screenWidth * 0.02,
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: SizeUtils.screenWidth * 0.55,
                                                  height: SizeUtils.screenHeight * 0.10,
                                                  child: SingleChildScrollView(
                                                    physics: const BouncingScrollPhysics(),
                                                    child: AppText(
                                                      newsList[index].title.toString(),
                                                      color: AppColor.white,
                                                      maxLines: 4,
                                                      fontSize: SizeUtils.fSize_16(),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: SizeUtils.horizontalBlockSize * 1,
                                                ),
                                                AppText(
                                                  TimeManager.setNewsUpdateTime(
                                                    newsList[index].time,
                                                  ),
                                                  maxLines: 1,
                                                  color: AppColor.white.withOpacity(0.5),
                                                  fontSize: SizeUtils.fSize_14(),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeUtils.screenHeight * 0.01,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: SizeUtils.screenWidth * 0.002,
                                    ),
                                    child: divider1(),
                                  ),
                                  SizedBox(
                                    height: SizeUtils.screenHeight * 0.01,
                                  ),
                                  AppText(
                                    newsList[index].subtitle.toString(),
                                    maxLines: 2,
                                    color: AppColor.white,
                                    fontSize: SizeUtils.fSize_13(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(height: SizeUtils.horizontalBlockSize * 3);
                      },
                    ),
                  );
          } else if (snapshot.hasError) {
            return const AppText(
              "Server are on maintenance Please Try after some time",
              color: AppColor.black,
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              color: AppColor.locationBtn,
            ));
          }
        } else {
          return const SizedBox();
        }
      },
    );
  }

  Widget sizedBox() {
    return SizedBox(
      height: SizeUtils.screenHeight * 0.01,
    );
  }

  Widget divider1() {
    return Container(
      height: SizeUtils.screenHeight * 0.001,
      width: SizeUtils.screenWidth,
      color: Colors.grey,
    );
  }
}
