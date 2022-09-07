import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/models/AllApis.dart';
import '../../controllers/apis_view_controller.dart';

class ApisView extends GetView<ApisViewController> {
  const ApisView({
    Key? key,
    required this.category,
    required this.apis,
  }) : super(key: key);

  final List<Api> apis;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: Text(category),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
AutoSizeText(""),
              
              ...List.generate(
                apis.length,
                (index) => Text(
                  apis[index].name,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
            ],
          ),
        ));
  }
}
