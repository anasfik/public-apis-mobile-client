import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/apis_view_controller/apis_view_controller.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import '../../../../data/models/AllApis.dart';
import '../../../controllers/favorites_controller.dart';
import '../../../controllers/home_controller.dart';
import '../../apis_view/apis_view.dart';

class CategoryBox extends GetView<HomeController> {
  const CategoryBox({
    Key? key,
    required this.dataList,
    required this.apis,
  }) : super(key: key);
  final Map<String, String> dataList;
  final List<Api> apis;
  @override
  Widget build(BuildContext context) {
    // return OpenContainer(closedBuilder: MyWidget(), openBuilder: () => )
    return OpenContainer(
      tappable: false,
      middleColor: Theme.of(context).scaffoldBackgroundColor,
      transitionDuration: const Duration(milliseconds: 200),
      // transitionType: ContainerTransitionType.fadeThrough,
      closedColor: Theme.of(context).scaffoldBackgroundColor,
      openColor: Theme.of(context).scaffoldBackgroundColor,
      onClosed: (value) {
        Get.delete<ApisViewController>();
      },
      openBuilder: (context, function) {
        Get.put<ApisViewController>(ApisViewController());
        return ApisView(
          apis: apis,
          category: dataList["title"]!,
        );
      },
      closedBuilder: (context, openContainer) {
        return GestureDetector(
          onTap: () {
            openContainer();
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset(
                  dataList["image"]!,
                  fit: BoxFit.cover,
                ),
                Material(
                  animationDuration: const Duration(milliseconds: 400),
                  color: Theme.of(context).primaryColor.withOpacity(.4),
                  child: Container(
                    width: double.infinity,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: AutoSizeText(
                    dataList["title"]!,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3!.copyWith(
                          fontSize: TextHelperMethods.handleFontSizeValue(
                            dataList["title"]!,
                          ),
                        ),
                    maxLines: 3,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
