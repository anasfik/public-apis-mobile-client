import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:public_apis_desktop_client/app/modules/views/apis_view/widgets/api_card.dart';

import '../../../data/models/AllApis.dart';
import '../../../data/models/favoriteApi.dart';
import '../../controllers/apis_view_controller/apis_view_controller.dart';

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
          actions: <Widget>[
            const SizedBox(
              width: 10,
            ),
            Tooltip(
              message: 'Filter',
              child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.filter_list,
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GetBuilder<ApisViewController>(
              
              // id: controller.apisViewId
              builder: (controller) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...List.generate(
                      apis.length,
                      (index) => ApiCard(
                        apiInformation: apis[index],
                        category: category,
                        isFavorite: Hive.box<FavoriteApi>("favorites")
                            .values
                            .toList()
                            .any((favoriteApi) =>
                                favoriteApi.name == apis[index].name),
                      ),
                    ),
                  ],
                );
              }
            ),
          ),
        ));
  }
}
