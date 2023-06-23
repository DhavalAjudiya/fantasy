import 'package:fluttertoast/fluttertoast.dart';

import '../res/app_colors.dart';

class AppToast {
  static void toastMessage(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColor.createButtonOn,
      textColor: AppColor.white,
      fontSize: 16,
    );
  }
}
