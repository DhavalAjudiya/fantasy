import 'dart:async';

import 'package:fantasyarenas/fantasyarena.dart';
import 'package:flutter/material.dart';

import 'helper/shared_preference.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AppPreference.initMySharedPreferences();

  runApp(FantsyApp());
}
