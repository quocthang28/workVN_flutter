import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:workvn/navigation.dart';
import 'package:workvn/res/gaps.dart';

class Pages extends StatelessWidget {
  Pages(
      {required this.text,
      required this.image,
      required this.title,
      required this.index});

  final String text;
  final String image;
  final String title;
  final int index;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          50.heightBox,
          SvgPicture.asset(
            image,
            height: 300,
            width: 200,
          ),
          25.heightBox,
          25.heightBox,
          title.text
              .size(30)
              .color(Color(0xff4568dc))
              .fontFamily("Inter")
              .bold
              .make(),
          20.heightBox,
          text.text
              .size(14)
              .color(Color(0xff4568dc))
              .fontFamily("Inter")
              .bold
              .make(),
          35.heightBox,
          index == 2
              ? Container(
                  height: 50,
                  width: 200,
                  child: TextButton(
                    child: Center(
                      child:
                          "Bắt đầu".text.size(16).semiBold.center.white.make(),
                    ),
                    onPressed: () {
                      Get.offAllNamed(SiteNavigation.REGISTER);
                    },
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff4568dc), Color(0xffb06ab3)],
                    ),
                    borderRadius: BorderRadius.circular(30),
                  ),
                )
              : Gaps.empty,
        ],
      ),
    );
  }
}
