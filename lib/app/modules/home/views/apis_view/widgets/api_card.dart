import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/AllApis.dart';

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
              MaterialButton(
                height: 30,
                minWidth: 60,
                color: Theme.of(context).primaryColor,
                onPressed: () {},
                splashColor: Colors.white,
                child: Text(
                  'Open',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
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
        ],
      ),
    );
  }
}
