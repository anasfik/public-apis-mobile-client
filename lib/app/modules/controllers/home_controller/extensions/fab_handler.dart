import '../home_controller.dart';

enum FabDirectionOption {
  up,
  down,
}

extension FabHandler on HomeController {
  
  void switchAndUpdateFabDataTo(FabDirectionOption directionOption) {
    String key = _keyBasedOnEnum(directionOption);
    currentFabData = fabOptionsData[key]!;
    update([fabId]);
  }

  String _keyBasedOnEnum(FabDirectionOption enumValue) {
    return enumValue.name;
  }
}
