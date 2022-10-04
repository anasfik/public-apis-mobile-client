import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/extensions/filter_apis_view_extension.dart';
import 'package:public_apis_desktop_client/app/modules/views/apis_view/widgets/api_card.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import '../../../data/models/AllApis.dart';
import '../../../data/models/favoriteApi.dart';
import '../../controllers/apis_view_controller/apis_view_controller.dart';
import 'widgets/apis_view_app_bar.dart';

class ApisView extends StatelessWidget {
  const ApisView({
    super.key,
    required this.category,
    required this.apis,
  });

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
        child: GetBuilder<ApisViewController>(
          id: category,
          builder: (controller) {
            return FutureBuilder(
              future: runAndGetFilteredApisMethodOnSeparateIsolate(apis),
              builder: ((
                context,
                AsyncSnapshot<List<Api>> snapshot,
              ) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return LinearProgressIndicator(
                    minHeight: 3,
                    backgroundColor: Colors.white.withOpacity(.4),
                  );
                }
                if (snapshot.hasData) {
                  List<Api> processedApis = snapshot.data!;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
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
                    ),
                  );
                }
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: Center(
                    child: Text(
                      "something wrong happened \ntry again"
                          .firstLettersToCapital(),
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline5!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                );
              }),
            );
          },
        ),
      ),
    );
  }
}
