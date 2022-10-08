
import '../home_controller.dart';



extension FabHandler on HomeController {
  static const String _fabId = "fabId";
  String get fabId => _fabId;


  void switchFabDataTo(FabDirectionOption directionOption) {
    String key = _keyBasedOnEnum(directionOption);
currentFabData = fabOptionsData[key]!;
    update([fabId]);
  }

  String _keyBasedOnEnum(FabDirectionOption enumValue) {
    return enumValue.name;
  }
}

enum FabDirectionOption {
  up,
  down,
}
