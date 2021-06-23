import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workvn/api/firebase/firebase_service.dart';
import 'package:workvn/controller/auth_controller.dart';
import 'package:workvn/controller/recruitment_post_controller/recruitment_post_controller.dart';
import 'package:workvn/model/post_detail/PostDetail.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:workvn/navigation.dart';
import 'package:workvn/res/app_color.dart';
import 'package:workvn/ui/common_widgets/post_detail_column.dart';

class PostDetailScreen extends StatefulWidget {
  @override
  _PostDetailScreenState createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final RecruitmentPostController _recruitmentPostController = Get.find();
  final AuthController _authController = Get.find();
  final FirebaseService _firebaseService = FirebaseService();
  final String _postID = Get.arguments[0];
  final String _salary = Get.arguments[1];
  PostDetail _postDetail = PostDetail();
  bool _isLoading = true;
  var _saved = false.obs;

  bool checkSaved() {
    return _authController.firestoreUser.value!.favorites
        .contains(_postDetail.data!.id);
  }

  @override
  void initState() {
    _recruitmentPostController.recruitmentPostService
        .getPostDetail(_postID)
        .then((value) {
      setState(() {
        _postDetail = value;
        _isLoading = false;
      });
    }).then((value) => _saved.value = checkSaved());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        actions: [
          TextButton(
            onPressed: () => Get.offNamedUntil(
                SiteNavigation.MAIN, (route) => route.isFirst),
            child:
                'Về trang chủ'.text.semiBold.color(AppColor.lightBlue).make(),
          ),
        ],
      ),
      floatingActionButton: Obx(() => FloatingActionButton.extended(
            backgroundColor: Colors.white,
            onPressed: () {
              if (_saved.value) {
                _firebaseService.firestore
                    .collection('users')
                    .doc(_authController.firebaseUser.value!.uid)
                    .update({
                  'favorites': FieldValue.arrayRemove([_postDetail.data!.id])
                }).then((value) => _saved.value = checkSaved());
              } else {
                _firebaseService.firestore
                    .collection('users')
                    .doc(_authController.firebaseUser.value!.uid)
                    .update({
                  'favorites': FieldValue.arrayUnion([_postDetail.data!.id])
                }).then((value) => _saved.value = checkSaved());
              }
            },
            label: _saved.value
                ? 'Đã lưu'.text.color(AppColor.lightBlue).make()
                : 'Lưu'.text.color(AppColor.lightBlue).make(),
            icon: _saved.value
                ? Icon(Icons.favorite, color: AppColor.lightBlue)
                : Icon(Icons.favorite_border_outlined,
                    color: AppColor.lightBlue),
          )),
      body: _isLoading
          ? CircularProgressIndicator().centered()
          : PostDetailColumn.buildInstance(_postDetail, _salary),
    );
  }
}
