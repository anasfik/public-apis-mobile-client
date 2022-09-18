import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class Crashlytics {
  FirebaseCrashlytics crashlyticsInstance = FirebaseCrashlytics.instance;

  crashApp() {
    crashlyticsInstance.crash();
  }
}
