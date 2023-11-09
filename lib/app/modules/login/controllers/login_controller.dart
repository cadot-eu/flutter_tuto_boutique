import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t1/app/constans.dart';
import 'package:http/http.dart' as http;
import 'package:t1/app/data/models/user_model.dart';
import 'package:t1/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final GetStorage getStorage = GetStorage();
  late User user;

/* ---------------------------------- login --------------------------------- */
  Future<void> login(String username, String password) async {
    //vérification
    if (username.trim().isEmpty || password.trim().isEmpty) {
      _snack("Error", "Veuillez renseigner tous les champs", "error");
      return;
    }
    final responseToken = await http.post(Uri.parse(Const.API_TOKEN),
        headers: Const.HEADER_JSON,
        body: jsonEncode({"username": username, "password": password}));
    if (responseToken.statusCode == 200) {
      final responseBody = jsonDecode(responseToken.body);
      // Extract the token value from the response body
      final token = responseBody['token'];
      getStorage.write('token', token);
      //on se reconecte avec le token
      final responseUser = await http.get(
          Uri.parse(Const.API_GETUSER + username),
          headers: {'Authorization': 'Bearer $token'});
      if (responseUser.statusCode == 200) {
        user = User.fromJson(jsonDecode(responseUser.body));
        getStorage.write('user', user);
        Get.offAllNamed(Routes.HOME);
        _snack("Success", "Connexion reussie", "success");
      } else {
        _snack(
            "Error",
            'Request failed with status code: ${responseUser.statusCode}',
            "error");
      }
    } else {
      _snack(
          "Error",
          'Request failed with status code: ${responseToken.statusCode}',
          "error");
    }
  }

/* --------------------------------- logout --------------------------------- */
  void logout() {
    getStorage.remove('token');
    getStorage.remove('user');
    Get.offAllNamed(Routes.LOGIN);
  }

/* -------------------------------- snackbar -------------------------------- */
  _snack(String title, String content, String type) {
    Get.snackbar(title, content,
        backgroundColor: type == "error" ? Colors.red : Colors.green,
        colorText: Colors.white);
  }
}
