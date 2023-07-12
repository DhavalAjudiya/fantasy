import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasyarenas/modual/dashboard/news/modal/news_modal.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/appconfig.dart';
import 'package:fantasyarenas/res/assets_path.dart';
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
    return Scaffold(
      backgroundColor: AppColor.backGroundLightColor,
      appBar: AppBar(
        elevation: 5,
        backgroundColor: AppColor.appBarColor,
        leading: const SizedBox(),
        centerTitle: true,
        toolbarHeight: SizeUtils.screenHeight * 0.09,
        title: AppText(
          'News',
          textAlign: TextAlign.center,
          color: Colors.white.withOpacity(0.8),
          fontSize: SizeUtils.fSize_21(),
          letterSpacing: 1,
        ),
      ),
      body: Column(
        children: [
          news()
        ],
      )
    );
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
      stream:
          AppConfig.databaseReference.collection(AppConfig.news).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        newsList.clear();

        for (var element in snapshot.data?.docs ?? []) {
          NewsModal highlightModal =
              NewsModal.fromMap(element.data() as Map<String, dynamic>);
          newsList.add(highlightModal);
        }
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return newsList.isEmpty
                ? Column(
                    children: [
                      SizedBox(height: SizeUtils.verticalBlockSize * 30),
                      Icon(SFSymbols.doc_text,
                          size: SizeUtils.horizontalBlockSize * 15),
                      SizedBox(height: SizeUtils.horizontalBlockSize * 3),
                      AppText(
                        "News not found",
                        fontSize: SizeUtils.fSize_20(),
                        color: AppColor.white,
                      )
                    ],
                  )
                : Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: newsList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(
                            left: SizeUtils.horizontalBlockSize * 2,
                            right: SizeUtils.horizontalBlockSize * 2,
                            bottom: SizeUtils.horizontalBlockSize * 2,
                            top: SizeUtils.screenHeight * 0.02
                          ),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  offset: const Offset(-3, 3),
                                  blurRadius: 10,
                                  spreadRadius: 5
                                )
                              ],
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal:
                                SizeUtils.screenWidth * 0.02,
                                vertical:
                                SizeUtils.screenHeight * 0.02,
                              ),
                              child: Column(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigation.pushNamed(
                                        Routes.oneNewsPage,
                                        arg: {
                                          "title":
                                              newsList[index].title.toString(),
                                          "description": newsList[index]
                                              .description
                                              .toString(),
                                          "image":
                                              newsList[index].image.toString(),
                                          "subtitle": newsList[index]
                                                  .subtitle
                                                  .toString() ??
                                              "",
                                          "time": newsList[index].time ?? 0,
                                          "index": index,
                                        },
                                      );
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Hero(
                                        tag: "news$index",
                                        transitionOnUserGestures: true,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height:
                                                  SizeUtils.screenHeight *
                                                      0.15,
                                              width: SizeUtils.screenWidth *
                                                  0.34,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10),
                                                child: ImageFade(
                                                  image: NetworkImage(
                                                    newsList[index]
                                                        .image
                                                        .toString(),
                                                  ),
                                                  duration: const Duration(
                                                    milliseconds: 900,
                                                  ),
                                                  syncDuration:
                                                      const Duration(
                                                    milliseconds: 150,
                                                  ),
                                                  fit: BoxFit.cover,
                                                  placeholder: Container(
                                                    color: const Color(
                                                        0xFFCFCDCA),
                                                    alignment:
                                                        Alignment.center,
                                                    child: const Icon(
                                                      Icons.photo,
                                                      color: Colors.white30,
                                                      size: 128.0,
                                                    ),
                                                  ),
                                                  loadingBuilder: (context,
                                                          progress,
                                                          chunkEvent) =>
                                                      Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      value: progress,
                                                    ),
                                                  ),
                                                  errorBuilder:
                                                      (context, error) =>
                                                          Container(
                                                    color: const Color(
                                                        0xFF6F6D6A),
                                                    alignment:
                                                        Alignment.center,
                                                    child: const Icon(
                                                      Icons.warning,
                                                      color: Colors.black26,
                                                      size: 128.0,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: SizeUtils.screenWidth *
                                                  0.02,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  width: SizeUtils
                                                          .screenWidth *
                                                      0.55,
                                                  height: SizeUtils
                                                          .screenHeight *
                                                      0.12,
                                                  child:
                                                      SingleChildScrollView(
                                                    physics:
                                                        const BouncingScrollPhysics(),
                                                    child: AppText(
                                                      newsList[index]
                                                          .title
                                                          .toString(),
                                                      color: AppColor.black
                                                          .withOpacity(0.7),
                                                      maxLines: 4,
                                                      fontSize: SizeUtils
                                                          .fSize_18(),
                                                      textAlign:
                                                          TextAlign.justify,
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: SizeUtils
                                                          .horizontalBlockSize *
                                                      1,
                                                ),
                                                AppText(
                                                  TimeManager
                                                      .setNewsUpdateTime(
                                                    newsList[index].time,
                                                  ),
                                                  maxLines: 1,
                                                  color: Colors.grey
                                                      .withOpacity(0.6),
                                                  fontSize:
                                                      SizeUtils.fSize_14(),
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
                                    maxLines: 4,
                                    color: AppColor.black,
                                    fontSize: SizeUtils.fSize_14(),
                                    letterSpacing: 1,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
          } else if (snapshot.hasError) {
            return const Text("Snapshot has error");
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
      height: SizeUtils.screenHeight * 0.002,
      width: SizeUtils.screenWidth,
      color: AppColor.appBarColor.withOpacity(0.3),
    );
  }
}
