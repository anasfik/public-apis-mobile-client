import 'package:flutter/material.dart';

class CategoryBoxOption {
  final IconData icon;
  final VoidCallback onTap;
  final String title;

  CategoryBoxOption({
    required this.title,
    required this.icon,
    required this.onTap,
  });
}
