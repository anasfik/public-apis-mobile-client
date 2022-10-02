import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/extensions/filter_apis_view_extension.dart';
import 'package:public_apis_desktop_client/app/modules/views/apis_view/widgets/api_card.dart';

import '../../../data/models/AllApis.dart';
import '../../../data/models/favoriteApi.dart';
import '../../controllers/apis_view_controller/apis_view_controller.dart';
import 'widgets/apis_view_app_bar.dart';

class ApisView extends StatelessWidget {
  ApisView({
    super.key,
    required this.category,
    required this.apis,
  });
  final ApisViewController controller = Get.put(ApisViewController());

  final List<Api> apis;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: ApisViewAppBar(
          title: category,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: GetBuilder<ApisViewController>(
            id: category,
            builder: (controller) {
              print("get builder new build");
              return FutureBuilder(
                future: runFilteredApisMethodOnSeparateIsolate(apis),
                builder: ((context, AsyncSnapshot<List<Api>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }
                  if (snapshot.hasData) {
                    List<Api> processedApis = snapshot.data!;

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ...List.generate(
                          processedApis.length,
                          (index) => ApiCard(
                            key: ValueKey(
                              "${processedApis[index].name} $index",
                            ),
                            apiInformation: processedApis[index],
                            category: category,
                            isFavorite: Hive.box<FavoriteApi>("favorites")
                                .values
                                .toList()
                                .any(
                                  (favoriteApi) =>
                                      favoriteApi.name ==
                                      processedApis[index].name,
                                ),
                          ),
                        ),
                      ],
                    );
                  }
                  return Text("zzz");
                }),
              );
            },
          ),
        ),
      ),
    );
  }
}
