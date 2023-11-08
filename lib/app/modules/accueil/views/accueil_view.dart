import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/accueil_controller.dart';

class AccueilView extends GetView<AccueilController> {
  const AccueilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AccueilView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AccueilView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
