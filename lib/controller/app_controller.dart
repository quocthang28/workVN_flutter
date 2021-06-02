import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum AppTab { HOME, FAVORITES, NEAR_ME, ACCOUNT }

class AppController extends GetxController {
  GlobalKey keyMenuHome = GlobalKey();
  GlobalKey keyMenuFavorites = GlobalKey();
  GlobalKey keyMenuNearMe = GlobalKey();
  GlobalKey keyMenuAccount = GlobalKey();

  final mainTabStream = 0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  void goToTab(AppTab tab) {
    switch (tab) {
      case AppTab.HOME:
        mainTabStream.value = 0;
        break;
      case AppTab.FAVORITES:
        mainTabStream.value = 1;
        break;
      case AppTab.NEAR_ME:
        mainTabStream.value = 2;
        break;
      case AppTab.ACCOUNT:
        mainTabStream.value = 3;
        break;
    }
  }
}

final appState = Get.put(AppController());
