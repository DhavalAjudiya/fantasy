import 'package:fantasyarenas/modual/dashboard/highlight/widget/highlights_type.dart';
import 'package:fantasyarenas/res/app_colors.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:fantasyarenas/widget/app_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.black,
      body: Column(
        children: [
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.only(bottom: SizeUtils.horizontalBlockSize * 5),
              children: [
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
          )
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
}
