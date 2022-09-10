import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

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
                    color: controller.badgeBackgroundColor.value ??
                        Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              )),
              Center(
                child: Text(
                  Hive.box("favorites").values.toList().length.toString(),
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.white,
                        fontSize: 9,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
