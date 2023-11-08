import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:t1/app/modules/accueil/views/accueil_view.dart';
import 'package:t1/app/modules/favorite/views/favorite_view.dart';
import 'package:t1/app/modules/login/controllers/login_controller.dart';
import 'package:t1/app/modules/panier/views/panier_view.dart';
import 'package:t1/app/modules/profil/views/profil_view.dart';
import 'package:t1/app/modules/transaction/views/transaction_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  final loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        body: IndexedStack(index: controller.tabIndex, children: [
          AccueilView(),
          FavoriteView(),
          PanierView(),
          TransactionView(),
          ProfilView(),
        ]),
        floatingActionButton: FloatingActionButton(
          onPressed: () => loginController.logout(),
          child: const Icon(Icons.logout),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: controller.tabIndex,
          onTap: (index) => controller.changeTabIndex(index),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorite',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Panier',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'Transaction',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
        ),
      );
    });
  }
}
