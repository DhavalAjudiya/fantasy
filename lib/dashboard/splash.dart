import 'dart:async';
import 'package:flutter/material.dart';
import '../utils/navigation_utils/navigation.dart';
import '../utils/navigation_utils/routes.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    startTimeOut();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.brown,
      body: Stack(
        children: [
          Container(
            height: screenHeight / 1.9,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(
              children: const [
                // Image.asset(
                //   AssetsPath.coffFilesa,
                //   height: 190,
                //   width: 190,
                // ),
                // AppText(AppString.cafe),
              ],
            ),
          )
        ],
      ),
    );
  }

  void startTimeOut() {
    Timer(
      const Duration(seconds: 1),
      () {
        Navigation.pushNamed(Routes.pages);
      },
    );
  }
}
