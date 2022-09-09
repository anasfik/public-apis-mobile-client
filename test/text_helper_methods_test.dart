import 'package:flutter_test/flutter_test.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

void main() {
  test("test \"anas\" ", () async {
    expect(TextHelperMethods.firstLettersToCapital("anas"), "Anas");
  });

  test("test \"this is an example text\" ", () async {
    expect(TextHelperMethods.firstLettersToCapital("this is an example text"),
        "This Is An Example Text");
  });


}