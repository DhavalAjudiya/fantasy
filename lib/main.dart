import 'dart:async';
import 'package:fantasyarenas/fantasyarena.dart';
import 'package:fantasyarenas/res/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'helper/shared_preference.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await AppPreference.initMySharedPreferences();
  await FirebaseMessaging.instance.subscribeToTopic("fantasyarena");
  await NotificationService.initialize();

  runApp(const FantsyApp());
}
