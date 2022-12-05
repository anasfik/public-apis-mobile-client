import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/favorites_controller.dart';

import '../../../../data/models/favoriteApi.dart';

class FavoritesCounter extends GetView<FavoritesController> {
  const FavoritesCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: controller.favorites.listenable(),
      builder:
          (BuildContext context, Box<FavoriteApi> favorites, Widget? child) {
        return Center(
          child: Text(
            favorites.length.toString(),
            // Todo: set a style.
            style: const TextStyle(
              fontFamily: "Roboto",
              color: Colors.white,
              fontSize: 9,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}
