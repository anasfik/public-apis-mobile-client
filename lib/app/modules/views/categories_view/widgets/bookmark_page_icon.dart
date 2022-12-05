import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/home_controller/home_controller.dart';
import 'favorites_coutner.dart';

class BookmarkPageIcon extends GetView<HomeController> {
  const BookmarkPageIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
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
          top: 10,
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
                      borderRadius: const BorderRadius.all(Radius.circular(50)),
                    ),
                    child: const FavoritesCounter(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
