import 'package:flutter/material.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import '../../../../data/models/setting_option_model.dart';

class SettingsCard extends StatelessWidget {
  const SettingsCard({
    Key? key,
    required this.settingOption,
  }) : super(key: key);

  final SettingOptionModel settingOption;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        bottom: 15,
        top: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              color: Theme.of(context).primaryColor.withOpacity(.2),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Center(
                  child: Icon(
                    settingOption.icon,
                    size: 27.5,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            TextHelperMethods.firstLettersToCapital(settingOption.title),
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontSize: 18,
                ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
