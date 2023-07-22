import 'package:fantasyarenas/modual/dashboard/cricket_tabs/modal/fantasy_modal.dart';
import 'package:fantasyarenas/modual/dashboard/cricket_tabs/modal/upcomingMatch.dart';
import 'package:fantasyarenas/modual/dashboard/home/modal/completedMatch.dart' as com;
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool showFirstSquad = false.obs;
  RxBool showSecondSquad = false.obs;
  RxBool expansionTileShow = false.obs;
  RxBool isFantasy = false.obs;

  RxList<TeamFirst> fistTeamList = <TeamFirst>[].obs;
  RxList<TeamSecond> secondTeamList = <TeamSecond>[].obs;
  RxList<Info> infoList = <Info>[].obs;
  RxList<Fantasy> headTeamList = <Fantasy>[].obs;
  RxList<Fantasy> smallTeamList = <Fantasy>[].obs;
  RxList<PlayerState> playerState = <PlayerState>[].obs;
  RxList<com.TopPlayer>? topplayer = <com.TopPlayer>[].obs;
  RxList<com.Fantasy>? fantasypoint = <com.Fantasy>[].obs;
  RxString team1Name = "".obs;
  RxString teamImage = "".obs;
  RxInt expertName = 0.obs;
  RxInt smallTeam = 0.obs;
  RxInt headTeam = 0.obs;
  RxString team2Name = "".obs;
  RxString team1image = "".obs;
  RxString team2image = "".obs;
  RxString matchHeader = "".obs;
  RxString upComingMatchDocId = "".obs;
  RxString? tourimage = "".obs;
  RxString? tourname = "".obs;
  RxString? toss = "".obs;
  RxString? manOfi = "".obs;
  RxString? manofn = "".obs;
  RxString? manofp = "".obs;
  RxString? fani = "".obs;
  RxString? team = "".obs;
  RxString? eName = "".obs;

  //-- old homePage--  variable
  RxInt pageLength = 0.obs;
  RxBool showAppbar = false.obs;
  RxBool isBackPosterReverse = false.obs;
  RxBool isBackPosterShadow = false.obs;
  RxBool isPosterReverse = false.obs;
}
