import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t1/app/controllers/database_controller.dart';

class AccueilController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  late List<Map<String, dynamic>> categories = [];
  final List<Tab> Tabs = <Tab>[
    Tab(text: "Devant"),
    Tab(text: "Favorite"),
  ];
  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: Tabs.length, vsync: this);
    getCategorie(); // Appel de la méthode getCategorie pour récupérer les catégories
  }

  Future<void> getCategorie() async {
    final dbController = Get.put(DatabaseController());
    categories = await dbController.select('categories');
    update(); // Met à jour la vue pour refléter les nouvelles données
  }

  addInsert() {
    final dbController = Get.put(DatabaseController());
    dbController.testinsert();
    getCategorie();
  }
}
