import 'package:flutter/material.dart';
import 'package:public_apis_desktop_client/app/services/remote_service.dart';

import '../../../../../data/models/AllApis.dart';
import '../../widgets/nil.dart';
import 'CategoryBox.dart';

class CustomSliverGrid extends StatelessWidget {
  const CustomSliverGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RemoteService.getData(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SliverToBoxAdapter(
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.hasError) {
          return const SliverToBoxAdapter(child: Text("Error"));
        }

        if (snapshot.hasData) {
          List<CategoryApis> result = snapshot.data;

          return SliverGrid.count(
            crossAxisCount: 2,
            childAspectRatio: 1.8,
            crossAxisSpacing: 15,
            mainAxisSpacing: 15,
            children: [
              ...List.generate(
                result.length,
                (index) => CategoryBox(
                  dataList: {
                    "title": result[index].title,
                    "image": "assets/categoriesImages/animals.jpg",
                  },
                  apis: result[index].apis,
                ),
              )
            ],
          );
        }
        return const SliverToBoxAdapter(child: Nil());
      },
    );
  }
}
