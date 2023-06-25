import 'package:cloud_firestore/cloud_firestore.dart';

class AppConfig {
  AppConfig._();
  static final FirebaseFirestore databaseReference = FirebaseFirestore.instance;

  // ignore: non_constant_identifier_names
  static String  collection_Highlight= "HIGHLIGHTS";
}
