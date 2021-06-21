import 'package:flutter/material.dart';

class AppColor {
  AppColor._();

  static const Color textColor = Color(0xFF585858);
  static const Color scaffoldBackgroundColor = Colors.white;
  static const Color lightBlue = Color(0xff4568dc);
  static const Color lightBrown = Color(0xFF82643E);
  static const Color authGreen = Color(0xffd2eff7);
  static const Color green = Color(0xFF69c271);
  static const Color dividerColor = Color(0xffeceaea);
  //todo: add button color

  static Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xff4568dc), Color(0xffb06ab3)],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
}
