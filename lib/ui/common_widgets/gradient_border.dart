import 'package:flutter/material.dart';

final _kInnerDecoration = BoxDecoration(
  color: Colors.white,
  border: Border.all(color: Colors.white),
);

final _kGradientBoxDecoration = BoxDecoration(
  gradient: LinearGradient(colors: [Color(0xff4568dc), Color(0xffb06ab3)]),
  border: Border.all(
    color: Color(0xff4568dc),
  ),
);

class GradientContainer extends StatelessWidget {
  GradientContainer(this.text);

  final Widget text;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      //clipBehavior: Clip.antiAlias,
      borderRadius: BorderRadius.circular(32),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(0.5), //width of the border
          child: ClipRRect(
            //clipBehavior: Clip.antiAlias,
            borderRadius: BorderRadius.circular(32),
            child: Container(
              child: text,
              decoration: _kInnerDecoration,
            ),
          ),
        ),
        decoration: _kGradientBoxDecoration,
      ),
    );
  }
}
