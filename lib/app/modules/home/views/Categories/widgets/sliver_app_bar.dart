import 'package:flutter/material.dart';

import '../../../../../utils/colors/colors.dart';
import '../../../../../utils/text_helper_methods.dart';

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      backgroundColor: AppColors.purple,
      automaticallyImplyLeading: true,
      expandedHeight: 150,
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(20),
        expandedTitleScale: 1.5,
        title: Text(
          TextHelperMethods.firstLettersToCapital("categories"),
        ),
        background: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}
