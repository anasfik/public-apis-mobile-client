import 'package:flutter/cupertino.dart';

typedef FabCallback = void Function();

class FabData {
  final FabCallback callback;
  final FabDirectionOption direction;
  
  FabData({
    required this.callback,
    required this.direction,
  });
}
enum FabDirectionOption {
  up,
  down,
}
