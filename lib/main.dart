import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t1/app/controllers/database_controller.dart';

import 'app/modules/splash/bindings/splash_binding.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  final db = DatabaseController();
  await db.initDatabase();
  await db.insert('categories', {"nom": "tutu"});
  final resultSet = await db.select('categories');
  for (final row in resultSet) {
    print('[id: ${row['id']}, nom: ${row['nom']}]');
  }

  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      debugShowCheckedModeBanner: false,
      getPages: AppPages.routes,
      initialBinding: SplashBinding(),
    ),
  );
}
