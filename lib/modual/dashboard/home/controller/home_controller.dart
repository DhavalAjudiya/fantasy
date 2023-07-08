import 'package:fantasyarenas/modual/dashboard/home/modal/upcomingMatch.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool showFirstSquad = false.obs;
  RxBool showSecondSquad = false.obs;

  RxList<Player> playerList = <Player>[].obs;
  RxString team1Name = "".obs;
  RxString team2Name = "".obs;
  RxString matchHeader = "".obs;

  //-- old homePage--  variable
  RxInt pageLength = 0.obs;
  RxBool showAppbar = false.obs;
  RxBool isBackPosterReverse = false.obs;
  RxBool isBackPosterShadow = false.obs;
  RxBool isPosterReverse = false.obs;
}
