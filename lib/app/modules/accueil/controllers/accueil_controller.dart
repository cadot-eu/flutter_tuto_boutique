import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccueilController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late TabController controller;
  final List<Tab> Tabs = <Tab>[
    Tab(text: "Devant"),
    Tab(text: "Favorite"),
  ];
  @override
  void onInit() {
    super.onInit();
    controller = TabController(length: Tabs.length, vsync: this);
  }
}
