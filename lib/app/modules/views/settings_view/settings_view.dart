import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/settings_controllers/extensions/generate_expansion_tile_id.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

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
          ("settings").capitalizeAllWordsFirstLetter(),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: GetBuilder<SettingsController>(
              id: controller.settingsViewId,
              builder: (controller) {
                return ExpansionPanelList(
                  expandedHeaderPadding: EdgeInsets.zero,
                  dividerColor: Colors.transparent,
                  elevation: 0,
                  expansionCallback: (int index, bool isExpanded) {
                    controller.settings[index].optionFunction();

                    if (controller.settings[index].title
                            .toLowerCase()
                            .contains("reset") ||
                        controller.settings[index].title
                            .toLowerCase()
                            .contains("privacy") ||
                        controller.settings[index].title
                            .toLowerCase()
                            .contains("share")) {
                      return;
                    }

                    controller.toggleExpansionTile(
                      index,
                      isExpanded: isExpanded,
                    );
                  },
                  children: [
                    ...List.generate(
                      controller.settings.length,
                      (index) => ExpansionPanel(
                        canTapOnHeader: true,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        headerBuilder: (context, isExpanded) {
                          return SettingsCard(
                            settingOption: controller.settings[index],
                          );
                        },
                        body: controller.settings[index].settingsWidget,
                        isExpanded: controller.expansionTilesOpenStatus[index],
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
