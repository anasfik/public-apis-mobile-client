import 'package:flutter/cupertino.dart';

typedef FabCallback = void Function();

class FabData {
  final IconData icon;
  final FabCallback callback;
  FabData({
    required this.icon,
    required this.callback,
  });
}
