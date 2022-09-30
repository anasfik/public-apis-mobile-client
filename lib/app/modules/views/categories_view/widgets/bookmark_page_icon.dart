import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../data/models/favoriteApi.dart';
import '../../../controllers/home_controller.dart';

class BookmarkPageIcon extends GetView<HomeController> {
  const BookmarkPageIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            Get.toNamed("/favorites");
          },
          icon: const Icon(
            Icons.bookmarks,
          ),
        ),
        Positioned(
          top: 5,
          left: 5,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  child: Obx(
                () => Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: controller.badgeBackgroundColor.value,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: ValueListenableBuilder(
                      valueListenable:
                          Hive.box<FavoriteApi>("favorites").listenable(),
                      builder: (BuildContext context, Box favoritesBox,
                          Widget? child) {
                        return Center(
                          child: Text(
                            favoritesBox.length.toString(),
                            style: const TextStyle(
                                fontFamily: "Roboto",
                                color: Colors.white,
                                fontSize: 9,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        );
                      }),
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
