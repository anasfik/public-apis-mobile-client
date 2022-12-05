import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import '../../../firebase_options.dart';
import '../crashlytics/crashlytics.dart';
import '../local_db/hive/initializer.dart';

class MainInit {
  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await _initAppServices();
    await LocalDatabase.instance.initDatabases();
    await LocalDatabase.instance.clearDatabasesWhile(kDebugMode);
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
    ]);
  }
}
