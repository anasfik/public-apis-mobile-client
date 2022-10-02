import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/apis_view_controller.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/extensions/generate_id_based_on_index.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/extensions/update_elected_ilter_options.dart';

import '../../../../data/models/filter_choice_option.dart';

extension ReAssignIsSelectedValueExtension on ApisViewController {
  void reAssignIsSelectedValueOf(
    FilterChoiceOption choiceChip, {
    required String withIdOf,
    required bool isSelected,
    required int withIndexOf,
  }) {
    choiceChip.isSelected = isSelected;

    update([withIdOf]);
    updateSelectedFilterOptionsList();
  }
}

