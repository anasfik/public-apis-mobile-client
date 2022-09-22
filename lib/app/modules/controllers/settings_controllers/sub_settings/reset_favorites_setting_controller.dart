import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import '../../../../data/models/favoriteApi.dart';

class ResetFavoritesController extends GetxController {
  ResetFavoritesController({this.context});

  BuildContext? context;

  void openConfirmDialogToDeleteFavorites() {
    showDialog(
      context: context!,
      builder: (context) => AlertDialog(
        title: const Text('Reset Favorites'),
        content: const Text('Are you sure you want to reset your bookmarks?'),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text(
              TextHelperMethods.firstLettersToCapital("cancel"),
            ),
          ),
          TextButton(
            onPressed: () {
              clearTheFavoritesBox();
            },
            child: Text(TextHelperMethods.firstLettersToCapital("reset")),
          ),
        ],
      ),
    );
  }

  void clearTheFavoritesBox() {
    Box favoritesBox = Hive.box<FavoriteApi>("favorites");
    try {
      favoritesBox.clear();
      Get.back();
    } catch (e) {}
  }
}
