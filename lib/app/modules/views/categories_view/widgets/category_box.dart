import 'package:animations/animations.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/data/models/category_box_data_model.dart';
import 'package:public_apis_desktop_client/app/modules/controllers/home_controller/extensions/generate_category_box_id.dart';
import 'package:public_apis_desktop_client/app/utils/text_helper_methods.dart';

import '../../../bindings/apis_view_binding.dart';
import '../../../controllers/home_controller/home_controller.dart';
import '../../apis_view/apis_view.dart';

class CategoryBox extends GetView<HomeController> {
  CategoryBox({
    super.key,
    required this.data,
    required this.index,
  });
  final CategoryBoxData data;
  final int index;

  double _scale = 1;
  @override
  Widget build(BuildContext context) {
    final String categoryBoxId = controller.generateCategoryBoxId(data, index);
    final ApisViewBinding binding = ApisViewBinding();
    return GetBuilder<HomeController>(
      id: categoryBoxId,
      builder: (controller) {
        return OpenContainer(
          tappable: false,
          middleColor: Theme.of(context).scaffoldBackgroundColor,
          transitionDuration: const Duration(milliseconds: 200),
          transitionType: ContainerTransitionType.fadeThrough,
          closedColor: Theme.of(context).scaffoldBackgroundColor,
          openColor: Theme.of(context).scaffoldBackgroundColor,
          onClosed: (value) {
            binding.unbind();
          },
          openBuilder: (context, function) {
            binding.bind();

            return ApisView(
              apis: data.apis,
              category: data.title,
            );
          },
          closedBuilder: (context, openContainer) {
            return AnimatedScale(
              duration: const Duration(milliseconds: 200),
              curve: Curves.elasticIn,
              scale: _scale,
              child: GestureDetector(
                onPanCancel: () {
                  _scale = 1;
                  controller.update([categoryBoxId]);
                },
                onPanEnd: (DragEndDetails details) {
                  _scale = 1;
                  controller.update([categoryBoxId]);
                },
                onPanDown: (DragDownDetails details) {
                  _scale = 0.95;
                  controller.update([categoryBoxId]);
                },
                onTap: () {
                  openContainer.call();
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      Image.asset(
                        data.assetPath,
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
                          data.title,
                          textAlign: TextAlign.center,
                          style:
                              Theme.of(context).textTheme.headline3!.copyWith(
                                    fontSize: data.title.handleFontSizeValue(),
                                  ),
                          maxLines: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
