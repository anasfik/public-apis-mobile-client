import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:public_apis_desktop_client/app/services/remote_service.dart';

import '../controllers/home_controller.dart';
import 'widgets/nil.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: FutureBuilder(
                future: RemoteService.getData(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasData) {
                    return Text("${snapshot.data[1].title}");
                  }
                  return const Nil();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
