import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/apis_view_controller.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/extensions/generate_id_based_on_index.dart';

import '../../../../data/models/filter_choice_option.dart';

extension ReAssignIsSelectedValueExtension on ApisViewController {
  void reAssignIsSelectedValueOf(
      FilterChoiceOption choiceChip, bool newIsSelected, int index) {
    choiceChip.isSelected = newIsSelected;

    String choiceId = idBasedOnIndex(index);
    update([choiceId]);
  }
}
