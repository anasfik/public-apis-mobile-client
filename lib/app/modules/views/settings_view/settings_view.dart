import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/settings_controllers/extensions/handle_expantion_callback.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import '../../../data/models/setting_option_model.dart';
import '../../controllers/settings_controllers/settings_controller.dart';
import 'widgets/setting_card.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
// ! NOTE
// ! I REMOVED THE INK EFFECT AND REMOVED THE EXPANSION PANEL FROM THE SOURCE CODE OF MY VERSION OF FLUTTER FRAMEWORK SOURCE CODE, BECAUSE THERE IS NO OPTION IN THE PROPERTIES TO DO IT.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "settings".capitalizeAllWordsFirstLetter(),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: GetBuilder<SettingsController>(
            id: controller.settingsViewId,
            builder: (controller) {
              return ExpansionPanelList(
                expandedHeaderPadding: EdgeInsets.zero,
                dividerColor: Colors.transparent,
                elevation: 0,
                expansionCallback: (int index, bool isExpanded) {
                  controller.handleExpansionCallBack(index, isExpanded);
                },
                children: List.generate(
                  controller.settings?.length ?? 0,
                  (index) {
                    final currentSettingOption = controller.settings?[index] ??
                        SettingOptionModel.errorNotifier();

                    return ExpansionPanel(
                      canTapOnHeader: true,
                      backgroundColor:
                          Theme.of(context).scaffoldBackgroundColor,
                      body: currentSettingOption.settingsWidget ??
                          const SizedBox(),
                      isExpanded:
                          controller.expansionTilesOpenStatus?[index] ?? false,
                      headerBuilder: (context, isExpanded) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: SettingsCard(
                            settingOption: currentSettingOption,
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
