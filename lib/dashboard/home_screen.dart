import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_fade/image_fade.dart';
import '../res/app_colors.dart';
import '../res/appconfig.dart';
import '../utils/navigation_utils/navigation.dart';
import '../utils/navigation_utils/routes.dart';
import '../utils/size_utils.dart';
import '../widget/app_text.dart';
import 'home_page/modal/highlight_modal.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: SizeUtils.screenHeight * 0.02,
        ),
        SizedBox(
          height: SizeUtils.screenHeight * 0.02,
        ),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeUtils.screenWidth * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                'Highlights',
                fontSize: SizeUtils.fSize_13(),
                fontWeight: FontWeight.w200,
                color: Colors.grey,
              ),
              AppText(
                'See All',
                fontSize: SizeUtils.fSize_13(),
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ],
          ),
        ),
        SizedBox(
          height: SizeUtils.screenHeight * 0.001,
        ),
        _highlight(),
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: SizeUtils.screenWidth * 0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText(
                'Highlights',
                fontSize: SizeUtils.fSize_13(),
                fontWeight: FontWeight.w200,
                color: Colors.grey,
              ),
              AppText(
                'See All',
                fontSize: SizeUtils.fSize_13(),
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ],
          ),
        ),
      ],
    );
  }

  _highlight() {
    List<HighlightModal> highlightList = [];

    return StreamBuilder(
      stream: AppConfig.databaseReference
          .collection(AppConfig.collection_Highlight)
          .snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        highlightList.clear();
        for (var element in snapshot.data?.docs ?? []) {
          HighlightModal processesModal =
              HighlightModal.fromMap(element.data() as Map<String, dynamic>);
          highlightList.add(processesModal);
        }
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            return SizedBox(
              height: SizeUtils.screenHeight * 0.24,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
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
                                    Navigation.pushNamed(
                                      Routes.highLightsPage,
                                      arg: {
                                        "video": highlightList[index]
                                            .video
                                            .toString(),
                                        "title": highlightList[index]
                                            .title
                                            .toString(),
                                      },
                                    );
                                  },
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: ImageFade(
                                      image: NetworkImage(highlightList[index]
                                          .image
                                          .toString()),
                                      duration:
                                          const Duration(milliseconds: 900),
                                      syncDuration:
                                          const Duration(milliseconds: 150),
                                      alignment: Alignment.center,
                                      fit: BoxFit.cover,
                                      placeholder: Container(
                                        color: const Color(0xFFCFCDCA),
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.photo,
                                          color: Colors.white30,
                                          size: 128.0,
                                        ),
                                      ),
                                      loadingBuilder:
                                          (context, progress, chunkEvent) =>
                                              Center(
                                        child: CircularProgressIndicator(
                                          value: progress,
                                        ),
                                      ),
                                      errorBuilder: (context, error) =>
                                          Container(
                                        color: const Color(0xFF6F6D6A),
                                        alignment: Alignment.center,
                                        child: const Icon(
                                          Icons.warning,
                                          color: Colors.black26,
                                          size: 128.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AppText(
                            highlightList[index].title.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            color: Colors.grey,
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
