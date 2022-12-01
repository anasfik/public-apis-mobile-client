import 'dart:isolate';

import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/utils/extensions/api_model_extension.dart';

import '../../../../data/models/AllApis.dart';
import '../../../../data/models/filter_choice_option.dart';
import '../apis_view_controller.dart';

// ! Please: this code is shitty, I know, You should refactor it, it's my first time using isolate so I don't know how to do it better

Future<List<Api>> runAndGetFilteredApisMethodOnSeparateIsolate(
  List<Api> categoryApis,
) async {
  /// New controller will be injected every time to re init the values.
  final ApisViewController newController =
      Get.put<ApisViewController>(ApisViewController());

  /// The receive port for the isolate.
  ReceivePort receivePort = ReceivePort();

  /// We sent the receive port to the function in the isolate with other necessary data that will work with.
  await Isolate.spawn(filteredApis, [
    receivePort.sendPort,
    categoryApis,
    newController.selectedFilterOptions,
  ]);

  /// the ReceivePort.first will return the first message that is sent to the isolate,
  // ! see docs ( it implements Stream )
  List<Api> finalResult = await receivePort.first;

  /// Returns the final result.
  // reversed here is O(1)
  return newController.shouldApisListReverse
      ? finalResult.reversed.toList()
      : finalResult;
}

// ignore: long-method
void filteredApis(List<dynamic> arguments) async {
  // ! Here it's strict checks to avoid types problems in future.

  assert(
    arguments[0] is SendPort,
    "please assign the SendPort object as first argument",
  );
  SendPort sendPort = arguments[0];

  assert(
    arguments[1] is List<Api>,
    "please assign the List<Api> object as second argument",
  );
  List<Api> categoryApis = arguments[1];

  assert(
    arguments[2] is List<FilterChoiceOption>,
    "please assign the List<FilterChoiceOption> object as third argument",
  );
  List<FilterChoiceOption> selectedChoiceOptions = arguments[2];

  if (selectedChoiceOptions.isEmpty) {
    Isolate.exit(sendPort, categoryApis);
  }
  List<Api> result = categoryApis.where(
    (api) {
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
        if (selectedChoiceOption.optionText == "open source") {
          if (api.isOpenSource()) {
            isApiValid = true;
          } else {
            return false;
          }
        }
      }

      return isApiValid;
    },
  ).toList();
  await Future.delayed(const Duration(milliseconds: 200));
  Isolate.exit(sendPort, result);
}
