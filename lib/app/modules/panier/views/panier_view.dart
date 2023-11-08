import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/panier_controller.dart';

class PanierView extends GetView<PanierController> {
  const PanierView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PanierView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PanierView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
