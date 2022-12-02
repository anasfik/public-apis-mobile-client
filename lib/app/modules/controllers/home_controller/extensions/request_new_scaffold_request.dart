import '../home_controller.dart';

extension RequestNewScaffoldRequest on HomeController {
  /// This will remove the focus from the search bar and request a new scaffold focus request.
  void removeTextFieldsFocus() {
    focusNode.unfocus();
  }
}
