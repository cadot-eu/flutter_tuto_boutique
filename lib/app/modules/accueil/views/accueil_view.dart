import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:t1/app/controllers/database_controller.dart';
import 'package:t1/app/modules/login/controllers/login_controller.dart';

import '../controllers/accueil_controller.dart';
import 'categorie_view.dart';
import 'devant_view.dart';

class AccueilView extends GetView<AccueilController> {
  AccueilView({Key? key}) : super(key: key);
  final accueilController = Get.put(AccueilController());
  final databaseController = Get.put(DatabaseController());
  final loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    //final AccueilController _tabs = Get.put(AccueilController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('AccueilView'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              loginController.logout();
            },
            icon: Icon(Icons.logout),
          ),
          IconButton(
            onPressed: () {
              accueilController.addInsert();
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: new Column(
        children: [
          TabBar(
            controller: accueilController.controller,
            tabs: accueilController.Tabs,
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
              controller: accueilController.controller,
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
