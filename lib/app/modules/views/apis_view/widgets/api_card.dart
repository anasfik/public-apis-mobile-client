import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/services/crashlytics/crashlytics.dart';
import 'package:public_apis_desktop_client/app/utils/extensions/api_model_extension.dart';

import '../../../../data/models/AllApis.dart';
import '../../../controllers/favorites_controller.dart';
import 'api_chip.dart';
import 'api_open_link_button.dart';

class ApiCard extends GetWidget<FavoritesController> {
  ApiCard({
    Key? key,
    required this.apiInformation,
    required this.category,
    this.isFavorite = false,
  }) : super(key: key);

  final Api apiInformation;
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
                  apiInformation.name,
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
                  GetBuilder<FavoritesController>(
                    init: FavoritesController(),
                    global: false,
                    id: apiInformation.name,
                    builder: (controller) {
                      return GestureDetector(
                        onTap: () {
                          isFavorite = !isFavorite;
                          controller.toggleFavoriteStatus(
                            isFavorite: isFavorite,
                            name: apiInformation.name,
                            category: category,
                            description: apiInformation.description,
                            auth: apiInformation.auth,
                            https: apiInformation.https,
                            cors: apiInformation.cors,
                            link: apiInformation.link,
                          );
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(200),
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
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ApiButton(
                    link: apiInformation.link,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            apiInformation.description,
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
              if (apiInformation.hasAuth()) ...[
                ApiChip(
                  text: apiInformation.auth,
                ),
              ],
              const SizedBox(
                width: 5,
              ),
              if (apiInformation.isHttps()) ...[
                const ApiChip(
                  text: "https",
                ),
              ] else if (apiInformation.isHttp()) ...[
                const ApiChip(
                  text: "http",
                ),
              ],
              const SizedBox(
                width: 5,
              ),
              if (apiInformation.hasCors()) ...[
                const ApiChip(
                  text: "cors",
                ),
              ] else if (apiInformation.hasUnknownCors()) ...[
                const ApiChip(
                  text: "unknown",
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

