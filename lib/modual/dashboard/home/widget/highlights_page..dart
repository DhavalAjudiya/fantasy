import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:youtube_player_iframe/youtube_player_iframe.dart';

class HighLightsPage extends StatefulWidget {
  const HighLightsPage({super.key});

  @override
  State<HighLightsPage> createState() => _HighLightsPageState();
}

class _HighLightsPageState extends State<HighLightsPage> {
  var argVideo;

  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    argVideo = Get.arguments;
    _controller = YoutubePlayerController.fromVideoId(
      videoId: argVideo["video"].toString(),
      autoPlay: true,
      params: const YoutubePlayerParams(
        color: "yellow",
        showFullscreenButton: true,
        showControls: true,
        enableCaption: false,
        playsInline: false,
        showVideoAnnotations: false,
        origin: "https://www.youtube.com",
        strictRelatedVideos: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: YoutubePlayerScaffold(
        backgroundColor: Colors.black,
        builder: (BuildContext context, Widget player) {
          return Column(
            children: [
              player,
              Container(height: 200, color: Colors.red, width: 350),
            ],
          );
        },
        controller: _controller,
      ),
    );
  }
}
