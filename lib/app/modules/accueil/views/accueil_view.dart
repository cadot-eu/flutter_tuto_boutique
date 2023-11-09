import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/accueil_controller.dart';
import 'categorie_view.dart';
import 'devant_view.dart';

class AccueilView extends GetView<AccueilController> {
  const AccueilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final AccueilController _tabs = Get.put(AccueilController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('AccueilView'),
        centerTitle: true,
      ),
      body: new Column(
        children: [
          TabBar(
            controller: _tabs.controller,
            tabs: _tabs.Tabs,
            labelColor: Colors.blue,
            indicator: BoxDecoration(
                border: Border(
              bottom: BorderSide(
                color: Colors.blue,
                width: 3.0,
              ),
            )),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabs.controller,
              children: [
                DevantView(),
                CategorieView(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
