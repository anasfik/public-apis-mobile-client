import 'package:flutter/cupertino.dart';

typedef FabCallback = void Function();

class FabData {
  final FabCallback callback;
  final FabDirectionOption direction;

  FabData({
    required this.callback,
    required this.direction,
  });

  @override
  operator ==(covariant FabData other) {
    return direction.name == other.direction.name;
  }

  // ignore: member-ordering
  @override
  int get hashCode => direction.name.hashCode;
}

enum FabDirectionOption {
  up,
  down,
}
