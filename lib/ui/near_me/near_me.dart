import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:workvn/res/app_color.dart';

class NearMeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: 'Việc làm gần đây'
              .text
              .semiBold
              .textStyle(TextStyle(
                  foreground: Paint()..shader = AppColor.linearGradient))
              .make(),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: 'near me'.text.make(),
        ));
  }
}
