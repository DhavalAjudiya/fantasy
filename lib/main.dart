import 'dart:async';
import 'package:fantasyarenas/fantasyarena.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'helper/shared_preference.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AppPreference.initMySharedPreferences();


  runApp(const FantsyApp());
}
