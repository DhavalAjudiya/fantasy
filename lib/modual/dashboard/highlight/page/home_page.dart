import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasyarenas/modual/dashboard/highlight/controller/home_controller.dart';
import 'package:fantasyarenas/modual/dashboard/highlight/modal/highlight_modal.dart';
import 'package:fantasyarenas/modual/dashboard/highlight/widget/highlights_type.dart';
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

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
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
    animation = CurvedAnimation(parent: animationController, curve: Curves.ease);
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
      if (_currentPage < 5) {
        _currentPage++;
      } else {
        _currentPage = 0;
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
      if (_currentPageB < 5) {
        _currentPageB++;
      } else {
        _currentPageB = 0;
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
      backgroundColor: AppColor.black,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          Expanded(
            child: ListView(
              controller: controller,
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: SizeUtils.horizontalBlockSize * 5),
              children: [
                backPoster(),
                appIcon(),
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

  Widget buildColumn({
    required IconData icons,
    required String text,
  }) {
    return Column(
      children: [
        Icon(
          icons,
          color: Colors.white,
          size: SizeUtils.fSize_17(),
        ),
        AppText(
          text,
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: SizeUtils.fSize_11(),
        )
      ],
    );
  }

  backPoster() {
    List<PosterModal> posterList = [];
    return StreamBuilder(
      stream: AppConfig.databaseReference.collection(AppConfig.poster).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        posterList.clear();

        for (var element in snapshot.data?.docs ?? []) {
          PosterModal posterModal = PosterModal.fromMap(element.data() as Map<String, dynamic>);
          posterList.add(posterModal);
        }
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return SizedBox(
              height: SizeUtils.horizontalBlockSize * 40,
              child: PageView.builder(
                  controller: pageControllerB,
                  itemCount: posterList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                        padding: EdgeInsets.only(
                          top: SizeUtils.horizontalBlockSize * 1,
                          bottom: SizeUtils.horizontalBlockSize * 1.5,
                          left: SizeUtils.horizontalBlockSize * 3,
                          right: SizeUtils.horizontalBlockSize * 3,
                        ),
                        child: Container(
                            decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          image: DecorationImage(
                              image: NetworkImage(
                                posterList[index].backposter.toString(),
                              ),
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.fill),
                        )));
                  }),
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
          stream: AppConfig.databaseReference.collection(AppConfig.poster).snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            posterList.clear();

            for (var element in snapshot.data?.docs ?? []) {
              PosterModal posterModal = PosterModal.fromMap(element.data() as Map<String, dynamic>);
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
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                  image: NetworkImage(
                                    posterList[index].poster.toString(),
                                  ),
                                  filterQuality: FilterQuality.high,
                                  fit: BoxFit.fill),
                            )),
                            Padding(
                              padding: EdgeInsets.only(bottom: SizeUtils.horizontalBlockSize * 8),
                              child: Center(
                                child: ScaleUpAnimation(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      AppText(
                                        posterList[index].title.toString().split("-").first,
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
                                        posterList[index].title.toString().split("_").last,
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
                      }),
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
            top: SizeUtils.horizontalBlockSize * 2,
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
    return Padding(
      padding: EdgeInsets.only(bottom: SizeUtils.horizontalBlockSize * 2),
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
                  child: Image.asset(AssetsPath.fantasy, scale: 12)),
              SizedBox(width: SizeUtils.horizontalBlockSize * 2),
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
