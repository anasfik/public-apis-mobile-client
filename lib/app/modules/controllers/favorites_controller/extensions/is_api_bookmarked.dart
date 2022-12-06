import 'package:public_apis_desktop_client/app/data/models/favoriteApi.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/extensions/generate_api_key.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/favorites_controller.dart';
import 'package:public_apis_desktop_client/app/services/local_db/hive/favorites_db.dart';

extension IsApiBookmarkedExtension on FavoritesController {
  FavoritesDB get favorites => FavoritesDB.instance;

  bool isApiBookmarked(FavoriteApi api) {
    final apiName = api.name;
    final apiCategory = api.category;
    final key = consistentKey(apiCategory, apiName);

    return favorites.doesKeyExist(key);
  }
}
