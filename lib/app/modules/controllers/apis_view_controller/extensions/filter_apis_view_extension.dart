import 'dart:isolate';

import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/utils/extensions/api_model_extension.dart';

import '../../../../data/models/AllApis.dart';
import '../../../../data/models/filter_choice_option.dart';
import '../apis_view_controller.dart';

Future<List<Api>> runFilteredApisMethodOnSeparateIsolate(
  List<Api> categoryApis,
) async {
  ReceivePort receivePort = ReceivePort();
  await Isolate.spawn(
    filteredApis,
    [
      receivePort.sendPort,
      categoryApis,
      Get.find<ApisViewController>().selectedFilterOptions,
    ],
  );

  List<Api> finalResult = await receivePort.first;
  return finalResult;
}

void filteredApis(List<dynamic> arguments) async {
  SendPort sendPort = arguments[0];
  List<Api> categoryApis = arguments[1];
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
