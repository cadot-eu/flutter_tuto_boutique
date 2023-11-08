import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t1/app/constans.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  final GetStorage getStorage = GetStorage();

  dynamic login(String username, String password) async {
    final responseToken = await http.post(Uri.parse(Const.API_TOKEN),
        headers: Const.HEADER_JSON,
        body: jsonEncode({"username": "test@cadot.eu", "password": "ArowanA"}));

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
        getStorage.write('user', responseUser.body);
      } else {
        print('Request failed with status code: ${responseUser.statusCode}');
      }
    } else {
      print('Request failed with status code: ${responseToken.statusCode}');
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
