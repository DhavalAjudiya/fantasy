import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:flutter/material.dart';

import '../../widget/app_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
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
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeUtils.screenWidth * 0.021),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildColumn(
                              icons: Icons.sports_baseball, text: 'Cricket'),
                          buildColumn(
                              icons: Icons.sports_baseball, text: 'Cricket'),
                          buildColumn(
                              icons: Icons.sports_baseball, text: 'Cricket'),
                          buildColumn(
                              icons: Icons.sports_baseball, text: 'Cricket'),
                          buildColumn(
                              icons: Icons.sports_baseball, text: 'Cricket')
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
          ),
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
}
