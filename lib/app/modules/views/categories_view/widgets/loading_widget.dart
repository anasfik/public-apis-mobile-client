import 'package:flutter/material.dart';
import 'package:public_apis_desktop_client/app/modules/views/categories_view/widgets/spin_kit.dart';

class LoadingWidget extends StatelessWidget {
  final double height;
  const LoadingWidget({
    super.key,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
        child: const Center(
          child: SpinKit(),
        ),
      ),
    );
  }
}
