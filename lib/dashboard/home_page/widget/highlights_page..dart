import 'dart:developer';

import 'package:fantasyarenas/dashboard/home_page/controller/home_controller.dart';
import 'package:fantasyarenas/utils/navigation_utils/navigation.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HighLightsPage extends StatefulWidget {
  const HighLightsPage({super.key});

  @override
  State<HighLightsPage> createState() => _HighLightsPageState();
}

class _HighLightsPageState extends State<HighLightsPage> {
  var argVideo;

  late YoutubePlayerController _controller;
  late PlayerState playerState;
  late YoutubeMetaData videoMetaData;

  bool _isPlayerReady = false;
  bool isFullScreen = false;
  HomeController homeController = Get.find();

  @override
  void initState() {
    super.initState();
    argVideo = Get.arguments;
    _controller = YoutubePlayerController(
      initialVideoId: argVideo["video"].toString(),
      flags: const YoutubePlayerFlags(
        autoPlay: true,
      ),
    )..addListener(listener);
    playerState = PlayerState.unknown;
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controller.value.isFullScreen) {
      setState(() {
        playerState = _controller.value.playerState;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AspectRatio(
          aspectRatio: 2.2,
          child: YoutubePlayerBuilder(
            onExitFullScreen: () {
              log('Settings Tapped!  3 ');
              SystemChrome.setPreferredOrientations(DeviceOrientation.values);
            },
            onEnterFullScreen: () {
              homeController.isScreenMode.value = !homeController.isScreenMode.value;
              SystemChrome.setPreferredOrientations([
                DeviceOrientation.landscapeLeft,
                DeviceOrientation.landscapeRight,
              ]);

              log('Settings Tapped!  2 ${homeController.isScreenMode.value}');
            },
            player: YoutubePlayer(
              controller: _controller,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.blueAccent,
              controlsTimeOut: const Duration(seconds: 2),
              topActions: <Widget>[
                GestureDetector(
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  onTap: () {
                    SystemChrome.setPreferredOrientations([
                      DeviceOrientation.portraitUp,
                      DeviceOrientation.portraitDown,
                    ]).then(
                      (value) => Future.delayed(const Duration(milliseconds: 200), () {
                        Navigation.pop();
                      }),
                    );
                  },
                ),
                SizedBox(width: SizeUtils.horizontalBlockSize * 2),
                Expanded(
                  child: Text(
                    _controller.metadata.title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ],
              onReady: () {
                _isPlayerReady = true;
              },
              onEnded: (v) {
                SystemChrome.setPreferredOrientations([
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown,
                ]).then(
                  (value) => Future.delayed(const Duration(milliseconds: 200), () {
                    Navigation.pop();
                  }),
                );
              },
            ),
            builder: (BuildContext, Widget) {
              return AppText(argVideo["title"].toString());
            },
          ),
        ),
      ),
    );
  }
}
