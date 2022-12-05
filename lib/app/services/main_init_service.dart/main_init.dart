import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:public_apis_desktop_client/app/services/local_db/hive/favorites_db.dart';
import 'package:public_apis_desktop_client/app/services/local_db/hive/locals_box.dart';

import '../../../firebase_options.dart';
import '../../data/models/favoriteApi.dart';
import '../crashlytics/crashlytics.dart';
import '../local_db/hive/boxes.dart';

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
    LocalsDB favorites = LocalsDB.instance;
    FavoritesDB locals = FavoritesDB.instance;

    if (kDebugMode) {
      final ct = await favorites.clear();
      final ft = await locals.clear();
      print("Cleared $ct favorites and $ft locals");
    }
  }
}
