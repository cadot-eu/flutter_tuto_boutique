import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  LoginView({Key? key}) : super(key: key);
  final controller = Get.put(LoginController());
  final TextEditingController usernameController =
      TextEditingController(text: 'test@cadot.eu');
  final TextEditingController passwordController =
      TextEditingController(text: 'ArowanA');
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('LoginView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Column(
                  children: [
                    TextFormField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        labelText: 'Nom d\'utilisateur',
                      ),
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Mot de passe',
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        controller.login(
                            usernameController.text, passwordController.text);
                      },
                      child: Text('Se connecter'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
