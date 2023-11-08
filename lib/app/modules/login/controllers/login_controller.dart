import 'dart:convert';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t1/app/constans.dart';
import 'package:http/http.dart' as http;
import 'package:t1/app/data/models/user_model.dart';
import 'package:t1/app/routes/app_pages.dart';

class LoginController extends GetxController {
  final GetStorage getStorage = GetStorage();
  late User user;

  Future<void> login(String username, String password) async {
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
      } else {
        print('Request failed with status code: ${responseUser.statusCode}');
      }
    } else {
      print('Request failed with status code: ${responseToken.statusCode}');
    }
  }

  void logout() {
    getStorage.remove('token');
    getStorage.remove('user');
    Get.offAllNamed(Routes.LOGIN);
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
