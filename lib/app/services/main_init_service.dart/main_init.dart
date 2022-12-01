import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../firebase_options.dart';
import '../../data/models/favoriteApi.dart';
import '../crashlytics/crashlytics.dart';

class MainInit {
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initAppServices();
    Hive.registerAdapter(FavoriteApiAdapter());
    await _opnHiveBoxes();
    await _clearHiveBoxesInDebugMode();
    _configureCrashlytics();
  }

  void _configureCrashlytics() {
    FlutterError.onError = Crashlytics().crashlyticsInstance.recordFlutterError;
  }

  Future<void> _initAppServices() async {
    await Future.wait([
      Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
      ),
      Hive.initFlutter(),
    ]);
  }

  Future<void> _opnHiveBoxes() async {
    await Future.wait([
      Hive.openBox<FavoriteApi>("favorites"),
      Hive.openBox("locals"),
    ]);
  }

  Future<void> _clearHiveBoxesInDebugMode() async {
    Box favoritesBox = Hive.box<FavoriteApi>("favorites");
    Box localsBox = Hive.box("locals");

    if (!kDebugMode) {
      await favoritesBox.clear();
      await localsBox.clear();
    }
  }
}
