import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/home/controllers/home_controller.dart';

class CustomTextField extends GetView<HomeController> {
  final TextEditingController inputController;
  final String hintText;
  final String labelText;
  const CustomTextField({
    Key? key,
    required this.inputController,
    required this.hintText,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        autofocus: false,
        controller: inputController,
        onChanged: (value) {
          controller.update();
        },
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.search,
            color: Theme.of(context).primaryColor,
          ),
          labelText: labelText,
          labelStyle: TextStyle(
            color: Colors.grey.withOpacity(.75),
            fontSize: 14,
          ),
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.withOpacity(.75),
          ),
          fillColor: Colors.grey.withOpacity(.1),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: .75,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
              width: .75,
            ),
          ),
        ),
      ),
    );
  }
}