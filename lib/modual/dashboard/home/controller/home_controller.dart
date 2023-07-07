import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  //-- old homePage--  variable

  RxInt pageLength = 0.obs;
  RxBool showAppbar = false.obs;
  RxBool isBackPosterReverse = false.obs;
  RxBool isBackPosterShadow = false.obs;
  RxBool isPosterReverse = false.obs;
}
