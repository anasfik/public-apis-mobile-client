import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/search_bar_change.dart';

import '../../../controllers/home_controller/home_controller.dart';

class CustomSliverTextField extends GetView<HomeController> {
  const CustomSliverTextField({
    super.key,
    required this.inputController,
    required this.hintText,
    required this.labelText,
  });

  final TextEditingController inputController;
  final String labelText;
  final String hintText;
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      
      padding: const EdgeInsets.symmetric(horizontal: 15),
      sliver: SliverToBoxAdapter(
        child: FocusScope(
        autofocus: false,
        canRequestFocus: true,
        child: SizedBox(
          height: controller.searchBarHeight,
          child: TextField(
            style: Theme.of(context).textTheme.headline3!.copyWith(
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
                color: Colors.grey.withOpacity(.75),
                // color: Theme.of(context).primaryColor,
              ),
              labelText: labelText,
              labelStyle: TextStyle(
                color: Colors.grey.withOpacity(.75),
                fontSize: 14,
              ),
              filled: true,
              hintText: hintText,
              hintStyle: TextStyle(
                color: Colors.grey.withOpacity(.5),
              ),
              fillColor: Colors.grey.withOpacity(.1),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: .6,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Theme.of(context).primaryColor,
                  width: .6,
                ),
              ),
            ),
          ),
        ),
          ),
      ),
  
    );}
}
