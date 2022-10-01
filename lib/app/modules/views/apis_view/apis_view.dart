import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:public_apis_desktop_client/app/modules/views/apis_view/widgets/api_card.dart';

import '../../../data/models/AllApis.dart';
import '../../../data/models/favoriteApi.dart';
import '../../controllers/apis_view_controller/apis_view_controller.dart';
import 'widgets/apis_view_app_bar.dart';

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
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: ApisViewWidget(
            title: category,
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GetBuilder<ApisViewController>(
              id: controller.apisViewId,
              builder: (controller) {
                List<Api> processedApis =
                    //  controller.filteredApis() ??

                    apis;

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ...List.generate(
                      processedApis.length,
                      (index) => ApiCard(
                        apiInformation: processedApis[index],
                        category: category,
                        isFavorite: Hive.box<FavoriteApi>("favorites")
                            .values
                            .toList()
                            .any(
                              (favoriteApi) =>
                                  favoriteApi.name == processedApis[index].name,
                            ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ));
  }
}
