import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import '../../../firebase_options.dart';
import '../crashlytics/crashlytics.dart';
import '../local_db/hive/initializer.dart';

class MainInit {
  Future<void> init({bool testMode = false}) async {
    WidgetsFlutterBinding.ensureInitialized();
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    await LocalDatabase.instance.initDatabases();
    await LocalDatabase.instance.clearDatabasesWhile(kDebugMode);
    _configureCrashlytics();
  }

  void _configureCrashlytics() {
    FlutterError.onError = Crashlytics().crashlyticsInstance.recordFlutterError;
  }
}
