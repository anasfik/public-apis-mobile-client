import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/data/models/favoriteApi.dart';
import 'package:public_apis_desktop_client/app/modules/home/controllers/favorites_controller.dart';
import 'package:public_apis_desktop_client/app/modules/home/views/apis_view/widgets/api_open_link_button.dart';

import '../../../../../data/models/AllApis.dart';
import '../../apis_view/widgets/api_chip.dart';

class FavoriteApiCard extends GetWidget<FavoritesController> {
  FavoriteApiCard({
    Key? key,
    required this.apiInformation,
    this.isFavorite = false,
  }) : super(key: key);

  final FavoriteApi apiInformation;
  bool isFavorite;
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
              if (apiInformation.auth.toLowerCase() != "no") ...[
                ApiChip(
                  text: apiInformation.auth,
                ),
              ],
              const SizedBox(
                width: 5,
              ),
              if (apiInformation.https.toLowerCase() == "yes") ...[
                const ApiChip(
                  text: "https",
                ),
              ] else ...[
                const ApiChip(
                  text: "http",
                ),
              ],
              const SizedBox(
                width: 5,
              ),
              if (apiInformation.cors.toLowerCase() == "yes") ...[
                const ApiChip(
                  text: "cors",
                ),
              ] else if (apiInformation.cors.toLowerCase() == "unknown") ...[
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
