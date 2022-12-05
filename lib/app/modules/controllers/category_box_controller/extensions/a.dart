import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../data/models/category_box_option.dart';
import '../category_box_controller.dart';

extension HandleOptionOnTapExtension on CategoryBoxController {
  Future<void> handleOptionOnTap(
    BuildContext context,
    CategoryBoxOption option,
  ) async {
    try {
      await option.onTap();
      _showSnackbar(context, option.onSuccessText);
    } catch (e) {
      _showSnackbar(context, option.onErrorText);
    } finally {
      Get.back();
    }
  }

  void _showSnackbar(BuildContext context, String message) {
    final theme = Theme.of(context);

    void Function()? closeSnackbar;

    final snackbar = SnackBar(
      action: SnackBarAction(
        label: 'Close',
        onPressed: () {
          if (closeSnackbar != null) {
            closeSnackbar.call();
          }
        },
      ),
      duration: const Duration(milliseconds: 1500),
      dismissDirection: DismissDirection.up,
      content: Text(
        message,
        style: theme.textTheme.button?.copyWith(
          color: theme.bottomSheetTheme.backgroundColor,
        ),
      ),
    );

    final scaffoldController =
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
    closeSnackbar = scaffoldController.close;
  }
}
