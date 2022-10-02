import 'dart:isolate';

import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/utils/extensions/api_model_extension.dart';

import '../../../../data/models/AllApis.dart';
import '../../../../data/models/filter_choice_option.dart';
import '../apis_view_controller.dart';

final controller = Get.find<ApisViewController>();
Future<List<Api>> runFilteredApisMethodOnSeparateIsolate(
  List<Api> categoryApis,
) async {
  ReceivePort receivePort = ReceivePort();
  await Isolate.spawn(
    filteredApis,
    [
      receivePort.sendPort,
      categoryApis,
      controller.selectedFilterOptions,
    ],
  );

  List<Api> finalResult = await receivePort.first;
  return controller.shouldApisListReverse
      ? finalResult
      : finalResult.reversed.toList();
}

void filteredApis(List<dynamic> arguments) async {
  // ! here it's strict to avoid types problems

  assert(arguments[0] is SendPort,
      "please assign the SendPort object as first argument");
  SendPort sendPort = arguments[0];

  assert(arguments[1] is List<Api>,
      "please assign the List<Api> object as second argument");
  List<Api> categoryApis = arguments[1];

  assert(arguments[2] is List<FilterChoiceOption>,
      "please assign the List<FilterChoiceOption> object as third argument");
  List<FilterChoiceOption> selectedChoiceOptions = arguments[2];

  List<Api> result = [];

  if (selectedChoiceOptions.isEmpty) {
    Isolate.exit(sendPort, categoryApis);
  }

  result = categoryApis.where((api) {
    bool isApiValid = false;

    for (FilterChoiceOption selectedChoiceOption in selectedChoiceOptions) {
      if (selectedChoiceOption.optionText == "auth") {
        if (api.hasAuth()) {
          isApiValid = true;
        } else {
          return false;
        }
      }
      if (selectedChoiceOption.optionText.toLowerCase() == "apikey") {
        if (api.hasAuthWithApiKey()) {
          isApiValid = true;
        } else {
          return false;
        }
      }
      if (selectedChoiceOption.optionText == "https") {
        if (api.isHttps()) {
          isApiValid = true;
        } else {
          return false;
        }
      }
      if (selectedChoiceOption.optionText == "http") {
        if (api.isHttp()) {
          isApiValid = true;
        } else {
          return false;
        }
      }
      if (selectedChoiceOption.optionText == "cors") {
        if (api.hasCors() && !api.hasUnknownCors()) {
          isApiValid = true;
        } else {
          return false;
        }
      }
    }
    // print("name: ${api.name} isApiValid: $isApiValid");
    // print("result: ${result.length}");
    // print("${api.name} isApiValid: $isApiValid");
    return isApiValid;
  }).toList();
  // await Future.delayed(const Duration(milliseconds: 500));
  Isolate.exit(sendPort, result);
}
