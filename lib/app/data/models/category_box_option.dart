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
}
