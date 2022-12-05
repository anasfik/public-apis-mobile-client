import 'package:flutter/material.dart';

class CategoryBoxOption {
  final IconData icon;
  final VoidCallback onTap;
  final String title;
  static int indexId = 0;

  CategoryBoxOption({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
