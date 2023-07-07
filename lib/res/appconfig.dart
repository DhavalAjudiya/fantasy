import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AppConfig {
  AppConfig._();
  static final FirebaseFirestore databaseReference = FirebaseFirestore.instance;
  static ValueNotifier<int> bottomBarValue = ValueNotifier<int>(0);

  static String completedMatch = "completedmatch";
  static String upcomingMatch = "upcomingmatch";

  static String news = "news";

  static const dateTimeFormate = 'dd MMM, EEEE';
  static const timeFormat = 'hh:mm aaa';
  static const dateFormat = 'EEE, dd MMM';
}
