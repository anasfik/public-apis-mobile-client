import '../../../../data/models/fab_model.dart';
import '../home_controller.dart';

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
