import 'package:flutter/material.dart';
import 'package:public_apis_desktop_client/app/modules/views/general/loading/spin_kit.dart';

class LoadingWidget extends StatelessWidget {
  final double? height;
  final bool isSliverChild;
  const LoadingWidget({
    super.key,
    this.height,
    this.isSliverChild = true,
  });

  @override
  Widget build(BuildContext context) {
    return isSliverChild
        ? SliverToBoxAdapter(
            child: SizedBox(
              height: height,
              child: const Center(
                child: SpinKit(),
              ),
            ),
          )
        : SizedBox(
            height: height,
            child: const Center(
              child: SpinKit(),
            ),
          );
  }
}
