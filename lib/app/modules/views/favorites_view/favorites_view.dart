import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../controllers/favorites_controller.dart';
import 'widgets/favorite_api_card.dart';

class FavoritesView extends GetView<FavoritesController> {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bookmarks"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: ValueListenableBuilder(
            valueListenable: Hive.box("favorites").listenable(),
            builder: (BuildContext context, Box box, child) {
              List favoriteApis = box.values.toList();
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...List.generate(
                    box.values.toList().length,
                    (index) => FavoriteApiCard(
                      apiInformation: favoriteApis[index],
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
