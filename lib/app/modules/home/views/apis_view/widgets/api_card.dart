import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:public_apis_desktop_client/app/modules/home/views/apis_view/widgets/api_open_link_button.dart';

import '../../../../../data/models/AllApis.dart';
import 'apiChip.dart';

class ApiCard extends StatelessWidget {
  const ApiCard({
    Key? key,
    required this.apiInformation,
  }) : super(key: key);

  final Api apiInformation;
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
              AutoSizeText(
                apiInformation.name,
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontSize: 20,
                    ),
                maxLines: 1,
              ),
              ApiButton(link: apiInformation.link),
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
