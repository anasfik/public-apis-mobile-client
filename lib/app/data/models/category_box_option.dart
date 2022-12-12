import 'dart:async';

import 'package:flutter/material.dart';

class CategoryBoxOption {
  final IconData icon;
  final Future<void> Function() onTap;
  final String title;
  final String onSuccessText;
  final String onErrorText;

  CategoryBoxOption({
    required this.title,
    required this.icon,
    required this.onTap,
    this.onSuccessText = "Success",
    this.onErrorText = "Error",
  });

  factory CategoryBoxOption.share({
    required Future<void> Function() onTap,
  }) {
    return CategoryBoxOption(
      title: "share",
      icon: Icons.share,
      onTap: onTap,
      onErrorText: "cannot share, please try again",
      onSuccessText: "Shared!",
    );
  }

  factory CategoryBoxOption.copy({
    required Future<void> Function() onTap,
  }) {
    return CategoryBoxOption(
      title: "copy",
      icon: Icons.copy,
      onTap: onTap,
      onErrorText: "cannot copy category, please try again",
      onSuccessText: "Copied!",
    );
  }

  factory CategoryBoxOption.bookmarkAllApis({
    required Future<void> Function() onTap,
    required String category,
  }) {
    return CategoryBoxOption(
      title: "bookmark all apis",
      icon: Icons.bookmark_add,
      onTap: onTap,
      onErrorText: "cannot add apis to bookmarks, please try again",
      onSuccessText: "$category apis added to bookmarks",
    );
  }

  factory CategoryBoxOption.removeAllCategoryApis({
    required Future<void> Function() onTap,
    required String category,
  }) {
    return CategoryBoxOption(
      title: "remove all apis from bookmarks",
      icon: Icons.bookmark_remove,
      onTap: onTap,
      onErrorText: "cannot remove apis from bookmarks, please try again",
      onSuccessText: "$category apis removed from bookmarks",
    );
  }

  factory CategoryBoxOption.hideCategory({
    required Future<void> Function() onTap,
  }) {
    return CategoryBoxOption(
      title: "hide this category",
      icon: Icons.visibility_off,
      onTap: onTap,
      onErrorText: "cannot hide category, please try again",
      onSuccessText:
          "Category hidden successfully, you can show it again from the settings",
    );
  }

  factory CategoryBoxOption.showCategory({
    required Future<void> Function() onTap,
  }) {
    return CategoryBoxOption(
      title: "show this category",
      icon: Icons.visibility,
      onTap: onTap,
      onErrorText: "cannot show category, please try again",
      onSuccessText:
          "category is visible again",
    );
  }
}
