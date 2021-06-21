import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:workvn/controller/auth_controller.dart';
import 'package:workvn/res/app_color.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AuthController _authController = Get.find();

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: 'Việc làm yêu thích'
              .text
              .semiBold
              .textStyle(TextStyle(
                  foreground: Paint()..shader = AppColor.linearGradient))
              .make(),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: _authController.firestoreUser.value!.name.text.make(),
        ));
  }
}
