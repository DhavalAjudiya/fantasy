import 'package:fantasyarenas/modual/Ads_helper/advertisemment_controller.dart';
import 'package:fantasyarenas/modual/Ads_helper/set_data_in_firebase.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AdvertisementController>(AdvertisementController());
  }
}
