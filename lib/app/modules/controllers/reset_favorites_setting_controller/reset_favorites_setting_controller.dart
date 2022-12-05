import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:public_apis_desktop_client/app/services/local_db/hive/favorites_db.dart';
import 'package:public_apis_desktop_client/app/utils/extensions/getx_controller_extension.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import '../../../data/models/favoriteApi.dart';

class ResetFavoritesController extends GetxController {
  FavoritesDB favorites = FavoritesDB.instance;
  BuildContext? context;

  ResetFavoritesController({this.context});

  void openConfirmDialogToDeleteFavorites() {
    showDialog(
      context: context!,
      builder: (context) => AlertDialog(
        title: const Text('Reset Favorites'),
        content: const Text('Are you sure you want to reset your bookmarks?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              "cancel".capitalizeAllWordsFirstLetter(),
            ),
          ),
          TextButton(
            onPressed: () {
              clearTheFavorites();
            },
            child: Text("reset".capitalizeAllWordsFirstLetter()),
          ),
        ],
      ),
    );
  }

  void clearTheFavorites() {
    try {
      favorites.clear();
    } catch (e) {
    } finally {
      Get.back();
    }
  }
}
