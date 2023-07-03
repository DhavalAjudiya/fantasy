import 'package:cloud_firestore/cloud_firestore.dart';

class AppConfig {
  AppConfig._();
  static final FirebaseFirestore databaseReference = FirebaseFirestore.instance;

  static String iccHighlight = "ICCHIGHLIGHTS";
  static String domesticHighlight = "DOMESTIC";
  static String t20Leagues = "T20 Leagues";
  static String women = "Women ";
  static String allMatch = "All Match";
  static String matchType = "typs";

  static const dateTimeFormate = 'EEEE, dd MMM';
  static const timeFormat = 'hh:mm aaa';
  static const dateFormat = 'EEE, dd MMM';
}
