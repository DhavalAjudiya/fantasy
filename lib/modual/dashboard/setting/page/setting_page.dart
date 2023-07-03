import 'package:fantasyarenas/widget/app_text.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffC4DFCB),
      child: Center(
        child: AppText(
          "SettingPage",
          color: Colors.green[900],
          fontSize: 45,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
