import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasyarenas/dashboard/home_page/controller/home_controller.dart';
import 'package:fantasyarenas/dashboard/home_page/modal/highlight_modal.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/appconfig.dart';
import 'package:fantasyarenas/utils/navigation_utils/navigation.dart';
import 'package:fantasyarenas/utils/navigation_utils/routes.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_fade/image_fade.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../../widget/app_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          header(),
          _highlight(),
        ],
      ),
      bottomSheet: Container(
        height: SizeUtils.screenHeight * 0.02,
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
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

  header() {
    return Container(
      width: SizeUtils.screenWidth,
      height: SizeUtils.screenHeight * 0.19,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xff0e304f),
            Color(0xff071e33),
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: SizeUtils.horizontalBlockSize * 02,
          ),
          child: Column(
            children: [
              SizedBox(
                height: SizeUtils.screenHeight * 0.015,
              ),
              Row(
                children: [
                  CircleAvatar(
                    minRadius: SizeUtils.screenWidth * 0.047,
                  ),
                  SizedBox(
                    width: SizeUtils.screenWidth * 0.15,
                  ),
                  AppText(
                    'FANTASY ARENAS',
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: SizeUtils.fSize_20(),
                  ),
                  const Spacer(),
                  Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                    size: SizeUtils.fSize_24(),
                  ),
                  SizedBox(
                    width: SizeUtils.screenWidth * 0.05,
                  ),
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Colors.white,
                    size: SizeUtils.fSize_21(),
                  )
                ],
              ),
              const Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: SizeUtils.screenWidth * 0.021),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildColumn(icons: Icons.sports_baseball, text: 'Cricket'),
                    buildColumn(icons: Icons.sports_baseball, text: 'Cricket'),
                    buildColumn(icons: Icons.sports_baseball, text: 'Cricket'),
                    buildColumn(icons: Icons.sports_baseball, text: 'Cricket'),
                    buildColumn(icons: Icons.sports_baseball, text: 'Cricket')
                  ],
                ),
              ),
              SizedBox(
                height: SizeUtils.screenHeight * 0.010,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _highlight() {
    List<HighlightModal> highlightList = [];

    return StreamBuilder(
      stream: AppConfig.databaseReference.collection(AppConfig.collection_Highlight).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        highlightList.clear();
        for (var element in snapshot.data?.docs ?? []) {
          HighlightModal processesModal =
              HighlightModal.fromMap(element.data() as Map<String, dynamic>);
          highlightList.add(processesModal);
        }
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: highlightList.length,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: SizeUtils.horizontalBlockSize * 60,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              AspectRatio(
                                aspectRatio: 1.8,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigation.pushNamed(Routes.highLightsPage, arg: {
                                      "video": highlightList[index].video.toString(),
                                      "title": highlightList[index].title.toString(),
                                    });
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: ImageFade(
                                      image: NetworkImage(highlightList[index].image.toString()),
                                      duration: const Duration(milliseconds: 900),
                                      syncDuration: const Duration(milliseconds: 150),
                                      alignment: Alignment.center,
                                      fit: BoxFit.cover,
                                      placeholder: Container(
                                        color: const Color(0xFFCFCDCA),
                                        alignment: Alignment.center,
                                        child: const Icon(Icons.photo,
                                            color: Colors.white30, size: 128.0),
                                      ),
                                      loadingBuilder: (context, progress, chunkEvent) =>
                                          Center(child: CircularProgressIndicator(value: progress)),
                                      errorBuilder: (context, error) => Container(
                                        color: const Color(0xFF6F6D6A),
                                        alignment: Alignment.center,
                                        child: const Icon(Icons.warning,
                                            color: Colors.black26, size: 128.0),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          AppText(
                            highlightList[index].title.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
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
}
