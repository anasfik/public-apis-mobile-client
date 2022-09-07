import 'package:flutter/material.dart';

import 'favorite.dart';

class CustomSliverGrid extends StatelessWidget {
  const CustomSliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.count(
      crossAxisCount: 2,
      childAspectRatio: 16 / 8,
      crossAxisSpacing: 15,
      mainAxisSpacing: 15,
      children: [
        ...List.generate(
          20,
          (index) => FavoriteBox(
            dataList: ["frf", "cz"],
            indexPass: 5,
          ),
        )
      ],
    );
  }
}
