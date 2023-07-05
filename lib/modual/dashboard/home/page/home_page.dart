import 'dart:async';
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasyarenas/modual/dashboard/home/controller/home_controller.dart';
import 'package:fantasyarenas/modual/dashboard/home/modal/highlight_modal.dart';
import 'package:fantasyarenas/modual/dashboard/home/widget/highlights_type.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/appconfig.dart';
import 'package:fantasyarenas/res/assets_path.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:fantasyarenas/widget/scaleup_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sfsymbols/flutter_sfsymbols.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  Timer? timer;
  Timer? timerB;
  int _currentPage = 0;
  int _currentPageB = 0;
  HomeController homeController = Get.put(HomeController());
  PageController pageController = PageController(initialPage: 0);
  PageController pageControllerB = PageController(initialPage: 0);
  ScrollController? controller;
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller = ScrollController();
    controller?.addListener(_scrollListener);
    animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..addListener(() {
        if (animationController.isCompleted) {
          animationController.stop(canceled: true);
        }
      });
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.ease);
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
    timer?.cancel();
    timerB?.cancel();
  }

  _scrollListener() {
    if (controller!.offset >= 140) {
      homeController.showAppbar.value = true;
    }
    if (controller!.offset <= 130) {
      homeController.showAppbar.value = false;
    }
  }

  posterTimer() {
    timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (homeController.isPosterReverse.value) {
        if (_currentPage > 0) {
          _currentPage--;
        } else {
          homeController.isPosterReverse.value = false;
        }
      } else {
        if (_currentPage < 7) {
          _currentPage++;
        } else {
          homeController.isPosterReverse.value = true;
        }
      }
      pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 50),
        curve: Curves.easeIn,
      );
    });
  }

  backPosterTimer() {
    timerB = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (homeController.isBackPosterReverse.value) {
        if (_currentPageB > 0) {
          _currentPageB--;
        } else {
          homeController.isBackPosterReverse.value = false;
        }
      } else {
        if (_currentPageB < 7) {
          _currentPageB++;
        } else {
          homeController.isBackPosterReverse.value = true;
        }
      }
      pageControllerB.animateToPage(
        _currentPageB,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    posterTimer();
    backPosterTimer();
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.6),
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Expanded(
            child: ListView(
              controller: controller,
              shrinkWrap: true,
              padding:
                  EdgeInsets.only(bottom: SizeUtils.horizontalBlockSize * 5),
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: SizeUtils.screenHeight * 0.015,
                    right: SizeUtils.screenWidth * 0.03,
                    left: SizeUtils.screenWidth * 0.03,
                    bottom: SizeUtils.screenHeight * 0.015,
                  ),
                  child: Column(
                    children: [
                      backPoster(),
                      appIcon(),
                    ],
                  ),
                ),
                poster(),
                matchType(0),
                iccHighlight(),
                matchType(1),
                domesticAndOtherHighlight(),
                matchType(2),
                t20LeaguesHighlight(),
                matchType(3),
                womenHighlight(),
                matchType(4),
                allMatchHighlight(),
              ],
            ),
          ),
          Obx(() => homeController.showAppbar.value
              ? AnimatedOpacity(
                  duration: const Duration(seconds: 3),
                  opacity: 1,
                  alwaysIncludeSemantics: true,
                  curve: Curves.ease,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: AppColor.black,
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
                                height: SizeUtils.horizontalBlockSize * 15,
                                width: SizeUtils.horizontalBlockSize * 20,
                                fit: BoxFit.fill,
                              )),
                          SizedBox(width: SizeUtils.horizontalBlockSize * 5),
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
                                      fontSize: SizeUtils.fSize_13(),
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
                )
              : const SizedBox()),
        ],
      ),
    );
  }

  backPoster() {
    List<PosterModal> posterList = [];
    return StreamBuilder(
      stream:
          AppConfig.databaseReference.collection(AppConfig.poster).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        posterList.clear();
        log("element--- 1 ${snapshot.data?.docs.toString()}");

        for (var element in snapshot.data?.docs ?? []) {
          PosterModal posterModal = PosterModal.fromMap(element.data() as Map<String, dynamic>);
          posterList.add(posterModal);
        }
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return SizedBox(
              height: SizeUtils.horizontalBlockSize * 44,
              child: PageView.builder(
                controller: pageControllerB,
                itemCount: posterList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                          posterList[index].backposter.toString(),
                        ),
                        filterQuality: FilterQuality.high,
                        fit: BoxFit.fill,
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

  poster() {
    List<PosterModal> posterList = [];
    return Column(
      children: [
        StreamBuilder(
          stream: AppConfig.databaseReference
              .collection(AppConfig.poster)
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            posterList.clear();
            for (var element in snapshot.data?.docs ?? []) {
              PosterModal posterModal =
                  PosterModal.fromMap(element.data() as Map<String, dynamic>);
              posterList.add(posterModal);
            }
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return SizedBox(
                  height: SizeUtils.horizontalBlockSize * 70,
                  child: PageView.builder(
                    controller: pageController,
                    itemCount: posterList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  posterList[index].poster.toString(),
                                ),
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: SizeUtils.horizontalBlockSize * 8,
                            ),
                            child: Center(
                              child: ScaleUpAnimation(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    AppText(
                                      posterList[index]
                                          .title
                                          .toString()
                                          .split("-")
                                          .first,
                                      color: AppColor.white,
                                      fontSize: SizeUtils.fSize_20(),
                                      fontWeight: FontWeight.w600,
                                    ),
                                    AppText(
                                      posterList[index]
                                          .title
                                          .toString()
                                          .split("-")
                                          .last
                                          .split("_")
                                          .first,
                                      color: AppColor.white,
                                      fontSize: SizeUtils.fSize_15(),
                                    ),
                                    AppText(
                                      posterList[index]
                                          .title
                                          .toString()
                                          .split("_")
                                          .last,
                                      color: AppColor.white,
                                      fontSize: SizeUtils.fSize_15(),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
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
        ),
        Padding(
          padding: EdgeInsets.only(
            bottom: SizeUtils.horizontalBlockSize * 4,
            top: SizeUtils.horizontalBlockSize * 3,
          ),
          child: SmoothPageIndicator(
            controller: pageController,
            count: 7,
            effect: WormEffect(
              activeDotColor: Colors.grey,
              dotWidth: 6,
              dotHeight: 6,
              dotColor: Colors.grey.withOpacity(0.5),
            ),
          ),
        ),
      ],
    );
  }

  appIcon() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.05),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: SizeUtils.horizontalBlockSize * 2,
          vertical: SizeUtils.horizontalBlockSize * 1.5,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                AssetsPath.fantasy,
                scale: 12,
              ),
            ),
            SizedBox(
              width: SizeUtils.horizontalBlockSize * 2,
            ),
            RichText(
              text: TextSpan(
                text: "Fantasy",
                style: TextStyle(
                  color: AppColor.white,
                  fontWeight: FontWeight.w600,
                  fontSize: SizeUtils.fSize_15(),
                ),
                children: [
                  TextSpan(
                    text: "\nArenas",
                    style: TextStyle(
                      color: AppColor.white,
                      fontWeight: FontWeight.w300,
                      fontSize: SizeUtils.fSize_11(),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.1),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: SizeUtils.screenWidth * 0.04,
                  vertical: SizeUtils.screenHeight * 0.005,
                ),
                child: Icon(
                  Icons.share,
                  color: Colors.grey.withOpacity(0.3),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

/*         ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: ImageFade(
                      image: NetworkImage(highlightList[index].image.toString()),
                      duration: const Duration(milliseconds: 200),
                      syncDuration: const Duration(milliseconds: 150),
                      width: SizeUtils.horizontalBlockSize * 95,
                      fit: BoxFit.fitWidth,
                      placeholder: Container(
                        color: const Color(0xFFCFCDCA),
                        alignment: Alignment.center,
                        child: const Icon(Icons.photo, color: Colors.white30, size: 128.0),
                      ),
                      loadingBuilder: (context, progress, chunkEvent) =>
                          Center(child: CircularProgressIndicator(value: progress)),
                      errorBuilder: (context, error) => Container(
                        color: const Color(0xFF6F6D6A),
                        alignment: Alignment.center,
                        child: const Icon(Icons.warning, color: Colors.black26, size: 128.0),
                      ),
                    ),
                  ),*/

/*
            SliverAppBar(
              automaticallyImplyLeading: false,
              backgroundColor: AppColor.black,
              expandedHeight: SizeUtils.horizontalBlockSize * 60,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.symmetric(
                    horizontal: SizeUtils.horizontalBlockSize * 3,
                    vertical: SizeUtils.horizontalBlockSize * 3),
                background: SizedBox(
                  child: backPoster(),
                ),
                collapseMode: CollapseMode.parallax,
                title: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: SizeUtils.horizontalBlockSize * 1,
                        vertical: SizeUtils.horizontalBlockSize * 1),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Image.asset(AssetsPath.fantasy, scale: 17)),
                        SizedBox(width: SizeUtils.horizontalBlockSize * 2),
                        RichText(
                          text: TextSpan(
                              text: "Fantasy",
                              style: TextStyle(
                                color: AppColor.white,
                                fontWeight: FontWeight.w600,
                                fontSize: SizeUtils.fSize_11(),
                              ),
                              children: [
                                TextSpan(
                                  text: "\nArenas",
                                  style: TextStyle(
                                    color: AppColor.white,
                                    fontWeight: FontWeight.w300,
                                    fontSize: SizeUtils.fSize_8(),
                                  ),
                                ),
                              ]),
                        ),
                        const Spacer(),
                        Icon(
                          SFSymbols.gamecontroller,
                          size: SizeUtils.horizontalBlockSize * 6,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
*/
