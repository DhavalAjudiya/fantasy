import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fantasyarenas/modual/dashboard/home/modal/highlight_modal.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/res/appconfig.dart';
import 'package:fantasyarenas/utils/navigation_utils/navigation.dart';
import 'package:fantasyarenas/utils/navigation_utils/routes.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';

matchType(int val) {
  List<MatchTypeModal> matchTypeList = [];
  return Padding(
    padding: EdgeInsets.only(
      top: SizeUtils.verticalBlockSize * 1,
      left: SizeUtils.horizontalBlockSize * 3,
      right: SizeUtils.horizontalBlockSize * 3,
      bottom: SizeUtils.verticalBlockSize * 2,
    ),
    child: StreamBuilder(
      stream: AppConfig.databaseReference.collection(AppConfig.matchType).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        matchTypeList.clear();
        for (var element in snapshot.data?.docs ?? []) {
          MatchTypeModal matchTypeModal =
              MatchTypeModal.fromMap(element.data() as Map<String, dynamic>);
          matchTypeList.add(matchTypeModal);
        }

        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return AppText(
              matchTypeList[val].type.toString(),
              fontWeight: FontWeight.w600,
              fontSize: SizeUtils.fSize_16(),
              color: AppColor.white,
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
  );
}

iccHighlight() {
  List<HighlightModal> highlightList = [];
  return StreamBuilder(
    stream: AppConfig.databaseReference.collection(AppConfig.iccHighlight).snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      highlightList.clear();

      for (var element in snapshot.data?.docs ?? []) {
        HighlightModal highlightModal =
            HighlightModal.fromMap(element.data() as Map<String, dynamic>);
        highlightList.add(highlightModal);
      }
      if (snapshot.connectionState == ConnectionState.active) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.only(bottom: SizeUtils.verticalBlockSize * 1),
            child: SizedBox(
              height: SizeUtils.horizontalBlockSize * 32,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: highlightList.length,
                itemBuilder: (context, index) {
                  return LimitedBox(
                    maxWidth: SizeUtils.horizontalBlockSize * 55,
                    child: Padding(
                      padding: EdgeInsets.only(left: SizeUtils.horizontalBlockSize * 3),
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
                          // AppText(
                          //   highlightList[index].title.toString(),
                          //   maxLines: 1,
                          //   overflow: TextOverflow.ellipsis,
                          //   color: AppColor.white,
                          //   fontWeight: FontWeight.w100,
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),
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
/*
iccHighlight() {
  return StreamBuilder(
    stream: AppConfig.databaseReference.collection("MATCH").snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.connectionState == ConnectionState.active) {
        if (snapshot.hasData) {
          return SizedBox(
            height: SizeUtils.horizontalBlockSize * 32,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: snapshot.data?.docs.length,
              itemBuilder: (context, index) {
                var data = snapshot.data?.docs.map((e) => e).toList();
                log("data------$data");
                return Column(
                  children: [
                    AppText(data['match']["domestic"][0]),
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
  );
}
*/

domesticAndOtherHighlight() {
  List<HighlightModal> highlightList = [];
  return StreamBuilder(
    stream: AppConfig.databaseReference.collection(AppConfig.domesticHighlight).snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      highlightList.clear();

      for (var element in snapshot.data?.docs ?? []) {
        HighlightModal highlightModal =
            HighlightModal.fromMap(element.data() as Map<String, dynamic>);
        highlightList.add(highlightModal);
      }
      if (snapshot.connectionState == ConnectionState.active) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.only(bottom: SizeUtils.verticalBlockSize * 1),
            child: SizedBox(
              height: SizeUtils.horizontalBlockSize * 32,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: highlightList.length,
                itemBuilder: (context, index) {
                  return LimitedBox(
                    maxWidth: SizeUtils.horizontalBlockSize * 55,
                    child: Padding(
                      padding: EdgeInsets.only(left: SizeUtils.horizontalBlockSize * 3),
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
                          // AppText(
                          //   highlightList[index].title.toString(),
                          //   maxLines: 1,
                          //   overflow: TextOverflow.ellipsis,
                          //   fontSize: SizeUtils.fSize_15(),
                          //   color: AppColor.white,
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),
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

t20LeaguesHighlight() {
  List<HighlightModal> highlightList = [];
  return StreamBuilder(
    stream: AppConfig.databaseReference.collection(AppConfig.t20Leagues).snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      highlightList.clear();

      for (var element in snapshot.data?.docs ?? []) {
        HighlightModal highlightModal =
            HighlightModal.fromMap(element.data() as Map<String, dynamic>);
        highlightList.add(highlightModal);
      }
      if (snapshot.connectionState == ConnectionState.active) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.only(bottom: SizeUtils.verticalBlockSize * 1),
            child: SizedBox(
              height: SizeUtils.horizontalBlockSize * 32,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: highlightList.length,
                itemBuilder: (context, index) {
                  return LimitedBox(
                    maxWidth: SizeUtils.horizontalBlockSize * 55,
                    child: Padding(
                      padding: EdgeInsets.only(left: SizeUtils.horizontalBlockSize * 3),
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
                          // AppText(
                          //   highlightList[index].title.toString(),
                          //   maxLines: 1,
                          //   overflow: TextOverflow.ellipsis,
                          //   fontSize: SizeUtils.fSize_15(),
                          //   color: AppColor.white,
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),
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

womenHighlight() {
  List<HighlightModal> highlightList = [];
  return StreamBuilder(
    stream: AppConfig.databaseReference.collection(AppConfig.women).snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      highlightList.clear();

      for (var element in snapshot.data?.docs ?? []) {
        HighlightModal highlightModal =
            HighlightModal.fromMap(element.data() as Map<String, dynamic>);
        highlightList.add(highlightModal);
      }
      if (snapshot.connectionState == ConnectionState.active) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.only(bottom: SizeUtils.verticalBlockSize * 1),
            child: SizedBox(
              height: SizeUtils.horizontalBlockSize * 32,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: highlightList.length,
                itemBuilder: (context, index) {
                  return LimitedBox(
                    maxWidth: SizeUtils.horizontalBlockSize * 55,
                    child: Padding(
                      padding: EdgeInsets.only(left: SizeUtils.horizontalBlockSize * 3),
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
                          // AppText(
                          //   highlightList[index].title.toString(),
                          //   maxLines: 1,
                          //   overflow: TextOverflow.ellipsis,
                          //   fontSize: SizeUtils.fSize_15(),
                          //   color: AppColor.white,
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),
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

allMatchHighlight() {
  List<HighlightModal> highlightList = [];
  return StreamBuilder(
    stream: AppConfig.databaseReference.collection(AppConfig.allMatch).snapshots(),
    builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
      highlightList.clear();

      for (var element in snapshot.data?.docs ?? []) {
        HighlightModal highlightModal =
            HighlightModal.fromMap(element.data() as Map<String, dynamic>);
        highlightList.add(highlightModal);
      }
      if (snapshot.connectionState == ConnectionState.active) {
        if (snapshot.hasData) {
          return Padding(
            padding: EdgeInsets.only(bottom: SizeUtils.verticalBlockSize * 1),
            child: SizedBox(
              height: SizeUtils.horizontalBlockSize * 32,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: highlightList.length,
                itemBuilder: (context, index) {
                  return LimitedBox(
                    maxWidth: SizeUtils.horizontalBlockSize * 55,
                    child: Padding(
                      padding: EdgeInsets.only(left: SizeUtils.horizontalBlockSize * 3),
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
                          // AppText(
                          //   highlightList[index].title.toString(),
                          //   maxLines: 1,
                          //   overflow: TextOverflow.ellipsis,
                          //   fontSize: SizeUtils.fSize_15(),
                          //   color: AppColor.white,
                          // ),
                        ],
                      ),
                    ),
                  );
                },
              ),
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
