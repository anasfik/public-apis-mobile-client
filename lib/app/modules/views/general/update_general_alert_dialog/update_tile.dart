import 'package:flutter/material.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

class UpdateTile extends StatelessWidget {
  const UpdateTile({
    super.key,
    required this.feature,
    required this.title,
  });

  final String title;
  final String feature;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 7.5),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Text(
                title.capitalizeAllWordsFirstLetter(),
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                "✨",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ],
          ),
          Text(
            feature.capitalizeAllWordsFirstLetter(),
            style: Theme.of(context)
                .textTheme
                .titleSmall!
                .copyWith(fontSize: 15, color: Colors.black87),
          ),
        ],
      ),
    );
  }
}
