import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/data/models/favoriteApi.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/extensions/generate_api_key.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/favorites_controller/extensions/toggle_favorite_status.dart';
import 'package:public_apis_desktop_client/app/utils/extensions/api_model_extension.dart';

import '../../../../data/models/AllApis.dart';
import '../../../controllers/favorites_controller/favorites_controller.dart';
import 'api_chip.dart';
import 'api_open_link_button.dart';

class ApiCard extends GetView<FavoritesController> {
  ApiCard({
    Key? key,
    required this.api,
    required this.category,
    this.isFavorite = false,
  }) : super(key: key);

  final Api api;
  bool isFavorite;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(.15),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                child: AutoSizeText(
                  api.name,
                  style: Theme.of(context).textTheme.headline3!.copyWith(
                        fontSize: 20,
                      ),
                  minFontSize: 20,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  wrapWords: false,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Builder(builder: (context) {
                    final key = Get.find<FavoritesController>().consistentKey(
                      category,
                      api.name,
                    );

                    return GetBuilder<FavoritesController>(
                      init: FavoritesController(),
                      global: false,
                      id: key,
                      builder: (controller) {
                        return GestureDetector(
                          onTap: () {
                            isFavorite = !isFavorite;
                            final currentFav = FavoriteApi.from(api, category);
                            controller.toggleFavoriteStatus(
                              currentFav,
                              isFavorite,
                              key,
                            );
                          },
                          child: ClipRRect(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            child: Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(200)),
                              ),
                              height: 30,
                              width: 30,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  AnimatedContainer(
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(.7),
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    duration: const Duration(milliseconds: 50),
                                    height: isFavorite ? 30 : 0,
                                    width: isFavorite ? 30 : 0,
                                  ),
                                  Icon(
                                    Icons.bookmark,
                                    color: isFavorite
                                        ? Theme.of(context).primaryColor
                                        : Colors.grey,
                                    size: 22,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }),
                  const SizedBox(
                    width: 5,
                  ),
                  ApiButton(
                    link: api.link,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            api.description,
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.w300,
                  letterSpacing: 1.2,
                ),
          ),
          const SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              if (api.hasAuthWithApiKey()) ...[
                const ApiChip(
                  text: "apiKey",
                ),
              ] else if (api.hasAuth()) ...[
                const ApiChip(
                  text: "auth",
                ),
              ],
              const SizedBox(
                width: 5,
              ),
              if (api.isHttps()) ...[
                const ApiChip(
                  text: "https",
                ),
              ],
              if (api.isHttp()) ...[
                const ApiChip(
                  text: "http",
                ),
              ],
              const SizedBox(
                width: 5,
              ),
              if (api.hasCors() || api.hasUnknownCors()) ...[
                const ApiChip(
                  text: "cors",
                ),
              ]
            ],
          ),
        ],
      ),
    );
  }
}
