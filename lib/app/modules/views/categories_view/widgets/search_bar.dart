import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/search_bar_change.dart';

import '../../../controllers/home_controller/home_controller.dart';

class CustomSliverTextField extends GetView<HomeController> {
  final TextEditingController inputController;
  final String labelText;
  final String hintText;

  const CustomSliverTextField({
    super.key,
    required this.inputController,
    required this.hintText,
    required this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    final hintColor = Colors.grey.withOpacity(0.75);
    final theme = Theme.of(context);

    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      sliver: SliverToBoxAdapter(
        child: FocusScope(
          autofocus: false,
          canRequestFocus: true,
          child: SizedBox(
            height: controller.searchBarHeight,
            child: TextField(
              style: theme.textTheme.headline3?.copyWith(
                color: Colors.white,
                fontSize: 14,
              ),
              autofocus: false,
              controller: inputController,
              onChanged: (value) {
                controller.onSearchBarChange();
              },
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.search,
                  color: hintColor,
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
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                  borderSide: BorderSide(
                    color: theme.primaryColor,
                    width: 0.6,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: theme.primaryColor,
                    width: 0.6,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(5)),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
