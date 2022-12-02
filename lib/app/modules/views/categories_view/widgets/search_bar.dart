import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/search_bar_change.dart';

import '../../../controllers/home_controller/home_controller.dart';

class CustomSliverTextField extends GetView<HomeController> {
  final TextEditingController inputController;
  final String labelText;
  final String hintText;
  final void Function(String) onChanged;

  const CustomSliverTextField({
    super.key,
    required this.inputController,
    required this.hintText,
    required this.labelText,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final hintColor = Colors.grey.withOpacity(0.75);
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: controller.searchBarHeight,
          child: TextField(
            focusNode: controller.focusNode,
            style: theme.textTheme.headline3?.copyWith(
              color: Colors.white,
              fontSize: 14,
            ),
            autofocus: false,
            controller: inputController,
            onChanged: onChanged,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              suffixIcon: InkWell(
                splashColor: primary,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
                onTap: () {},
                child: Icon(
                  Icons.search,
                  color: hintColor,
                ),
              ),
              labelText: labelText,
              labelStyle: TextStyle(
                color: hintColor,
                fontSize: 14,
              ),
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(0.5),
              ),
              fillColor: Colors.grey.withOpacity(0.1),
              border: _outlinedBorder(theme),
              enabledBorder: _outlinedBorder(theme),
              focusedBorder: _outlinedBorder(theme, 0.7),
            ),
          ),
        ),
      ),
    );
  }
}

_outlinedBorder(ThemeData theme, [double borderWidth = 0.6]) {
  return OutlineInputBorder(
    borderRadius: const BorderRadius.all(Radius.circular(5)),
    borderSide: BorderSide(
      color: theme.primaryColor,
      width: borderWidth,
    ),
  );
}
