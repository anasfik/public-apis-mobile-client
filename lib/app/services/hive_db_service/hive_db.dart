import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
   Box locals = Hive.box("locals");
   String key = "numberOfTimesUserOpenedAnApiLink";

   void incrementNumberOfApisOpenedByUser() {
    int numberOfTimesUserOpenedAnApiLink = locals.get(key, defaultValue: 0);

    locals.put(key, ++numberOfTimesUserOpenedAnApiLink);
  }

  handleFirstShowingOfAppRequestReview() {
    
  }
}
