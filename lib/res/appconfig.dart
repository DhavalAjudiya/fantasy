import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppConfig {
  AppConfig._();
  static final FirebaseFirestore databaseReference = FirebaseFirestore.instance;
  static ValueNotifier<int> bottomBarValue = ValueNotifier<int>(0);

  static String iccHighlight = "ICCHIGHLIGHTS";
  static String domesticHighlight = "DOMESTIC";
  static String t20Leagues = "T20 Leagues";
  static String women = "Women ";
  static String allMatch = "All Match";
  static String matchType = "typs";
  static String poster = "poster";

  static const dateTimeFormate = 'EEEE, dd MMM';
  static const timeFormat = 'hh:mm aaa';
  static const dateFormat = 'EEE, dd MMM';
}
