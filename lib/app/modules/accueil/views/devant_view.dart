import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:t1/app/controllers/database_controller.dart';
import 'package:t1/app/modules/accueil/controllers/accueil_controller.dart';

class DevantView extends GetView<AccueilController> {
  final controller = Get.put(AccueilController());
  final databaseController = Get.put(DatabaseController());

  DevantView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            GetBuilder<AccueilController>(
                builder: (_) => Container(
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        itemCount: _.categories.length,
                        itemBuilder: (context, index) {
                          return Text(_.categories[index]['nom']);
                        }))),
          ],
        ),
      ),
    );
  }
}
