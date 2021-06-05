import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:workvn/res/app_color.dart';
import 'package:workvn/res/gaps.dart';

class ShowMore extends StatefulWidget {
  const ShowMore({
    Key? key,
    required this.contentFull,
    required this.contentLess,
    this.minHeight,
  }) : super(key: key);

  final Widget contentFull;
  final Widget contentLess;
  final double? minHeight;

  @override
  ShowMoreState createState() => ShowMoreState();
}

class ShowMoreState extends State<ShowMore> {
  var showMore = false.obs;

  @override
  Widget build(BuildContext context) {
    if (widget.contentFull == null) {
      return Gaps.empty;
    }

    final Widget full = Column(
      children: [
        widget.contentFull,
        GestureDetector(
          onTap: () {
            showMore.value = false;
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              'Thu gọn'.text.color(AppColor.lightBlue).size(16).make(),
              Icon(
                Icons.expand_less_rounded,
                color: AppColor.lightBlue,
              )
            ],
          ).p(10),
        )
      ],
    );

    final Widget less = Container(
      child: Column(
        children: [
          widget.contentLess,
          GestureDetector(
            onTap: () {
              showMore.value = true;
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                'Xem thêm'.text.color(AppColor.lightBlue).size(16).make(),
                Icon(
                  Icons.expand_more_rounded,
                  color: AppColor.lightBlue,
                )
              ],
            ).p(10),
          ),
        ],
      ),
    );

    return Obx(() {
      return showMore.value ? full : less;
    });
  }
}
