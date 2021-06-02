import 'package:flutter/material.dart';
import 'package:workvn/res/app_color.dart';

showLoadingIndicator(BuildContext context) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return Center(
        child: Container(
          width: 50.0,
          height: 50.0,
          child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColor.lightBlue)),
        ),
      );
    },
  );
}
