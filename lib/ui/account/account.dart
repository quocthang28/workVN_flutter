import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:workvn/res/app_color.dart';

class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: 'Tài khoản'
              .text
              .semiBold
              .textStyle(TextStyle(
                  foreground: Paint()..shader = AppColor.linearGradient))
              .make(),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: 'account'.text.make(),
        ));
  }
}
