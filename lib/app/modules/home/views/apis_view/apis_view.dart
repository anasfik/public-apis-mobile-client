import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/home/views/apis_view/widgets/api_card.dart';

import '../../../../data/models/AllApis.dart';
import '../../controllers/apis_view_controller.dart';

class ApisView extends StatelessWidget {
  ApisView({
    Key? key,
    required this.category,
    required this.apis,
  }) : super(key: key);

  final ApisViewController controller = Get.put(ApisViewController());

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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ...List.generate(
                  apis.length,
                  (index) => ApiCard(
                    apiInformation: apis[index],
                    category: category,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
