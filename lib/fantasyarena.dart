import 'package:bot_toast/bot_toast.dart';
import 'package:fantasyarenas/utils/app_binding.dart';
import 'package:fantasyarenas/utils/my_behavior.dart';
import 'package:fantasyarenas/utils/navigation_utils/routes.dart';
import 'package:fantasyarenas/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'helper/net_conectivity.dart';

class FantsyApp extends StatelessWidget {
  const FantsyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBinding(),
      initialRoute: Routes.splashPage,
      getPages: Routes.routes,
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      // ),
      // themeMode: ThemeMode.dark,
      builder: (context, child) {
        SizeUtils().init(context);
        return Scaffold(
          resizeToAvoidBottomInset: false,
          body: ScrollConfiguration(
            behavior: MyBehavior(),
            child: ConnectivityWidget(
              builder: (_, __) => BotToastInit()(_, child),
            ),
          ),
        );
      },
    );
  }
}
