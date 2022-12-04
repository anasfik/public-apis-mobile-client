import 'package:flutter/material.dart';
import 'package:public_apis_desktop_client/app/data/models/category_box_option.dart';

mixin CategoryBoxOptionsMixin {
  final options = <CategoryBoxOption>[
    CategoryBoxOption(
      title: "copy",
      icon: Icons.copy,
      onTap: () {},
    ),
    CategoryBoxOption(
      title: "hide category",
      icon: Icons.visibility_off,
      onTap: () {},
    ),
    CategoryBoxOption(
      title: "add all apis to bookmarks",
      icon: Icons.bookmark_add,
      onTap: () {},
    ),
    CategoryBoxOption(
      title: "remove all apis from bookmarks",
      icon: Icons.bookmark_remove,
      onTap: () {},
    ),
    CategoryBoxOption(
      title: "share",
      icon: Icons.share,
      onTap: () {},
    ),
  ];
}
