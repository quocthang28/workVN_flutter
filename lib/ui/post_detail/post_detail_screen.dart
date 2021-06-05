import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workvn/controller/benefits_controller.dart';
import 'package:workvn/controller/recruitment_post_controller/recruitment_post_controller.dart';
import 'package:workvn/model/post_detail/PostDetail.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:workvn/res/app_color.dart';
import 'package:workvn/res/gaps.dart';
import 'package:workvn/ui/common_widgets/post_detail_column.dart';
import 'package:workvn/ui/common_widgets/show_more.dart';

class PostDetailScreen extends StatefulWidget {
  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final RecruitmentPostController _recruitmentPostController = Get.find();
  final BenefitsController _benefitsController = Get.find();
  final String _postID = Get.arguments[0];
  final String _salary = Get.arguments[1];
  PostDetail _postDetail = PostDetail();
  bool _isLoading = true;

  @override
  void initState() {
    _recruitmentPostController.recruitmentPostService
        .getPostDetail(_postID)
        .then((value) {
      setState(() {
        _postDetail = value;
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.favorite_border_outlined)],
      ),
      body: _isLoading
          ? CircularProgressIndicator().centered()
          : PostDetailColumn.buildInstance(_postDetail, _salary),
    );
  }
}
