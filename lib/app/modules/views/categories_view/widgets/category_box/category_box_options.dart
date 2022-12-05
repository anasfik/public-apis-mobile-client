import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/category_box_controller.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/category_box_controller/mixins/category_box_options_mixin.dart';
import 'package:public_apis_desktop_client/app/modules/views/categories_view/widgets/category_box/category_box_option_tile.dart';

import 'category_box_close_button.dart';

class CategoryBoxOptions extends GetView<CategoryBoxController> {
  const CategoryBoxOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(
              height: 30,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(controller.options.length, (index) {
                final current = controller.options[index];

                return GestureDetector(
                  onTap: () async {
                    try {
                      await current.onTap();
                      showSnackbar(context, current.onSuccessText);
                    } catch (e) {
                      showSnackbar(context, current.onErrorText);
                    } finally {
                      Get.back();
                    }
                  },
                  child: CategoryBoxOptionTile(
                    index: index,
                    option: current,
                  ),
                );
              }),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
        const Positioned(
          right: 0,
          top: 0,
          child: Align(
            alignment: Alignment.centerRight,
            child: CategoryBoxCloseButton(),
          ),
        ),
      ],
    );
  }
}

void showSnackbar(BuildContext context, String message) {
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
