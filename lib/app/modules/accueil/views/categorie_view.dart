import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CategorieView extends GetView {
  const CategorieView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CategorieView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'CategorieView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
