import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DevantView extends GetView {
  const DevantView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'DevantView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
