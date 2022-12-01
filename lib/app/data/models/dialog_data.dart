import 'package:flutter/widgets.dart';

class DialogData {
  final String title;
  final String content;
  final void Function() retryButtonMethod;
  final String retryButtonText;

  DialogData({
    required this.content,
    required this.retryButtonMethod,
    this.retryButtonText = "Retry",
    this.title = "Error",
  });
}
