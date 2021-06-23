import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:workvn/controller/auth_controller.dart';
import 'package:workvn/controller/recruitment_post_controller/recruitment_post_controller.dart';
import 'package:workvn/controller/salary_range_controller.dart';
import 'package:workvn/model/post_detail/PostDetail.dart';
import 'package:workvn/res/app_color.dart';
import 'package:workvn/ui/common_widgets/saved_post_tile.dart';

class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  AuthController _authController = Get.find();
  RecruitmentPostController _postController = Get.find();
  SalaryRangeController _salaryRangeController = Get.find();
  var savedPosts = <PostDetail>[].obs;

  @override
  void initState() {
    _authController.firestoreUser.value!.favorites
        .sublist(1)
        .forEach((element) {
      _postController.getPostDetail(element).then((value) {
        savedPosts.add(value);
      });
    });
    super.initState();
  }

  String getSalaryRange(String id) {
    var salaryRange = _salaryRangeController.salaryRange.data!
        .firstWhere((element) => element.id == id);
    if (salaryRange.salaryMin == 0 && salaryRange.salaryMax == 0) {
      return 'Thương lượng';
    } else
      return '${salaryRange.salaryMin.toString()}\$ - ${salaryRange.salaryMax.toString()}\$';
  }

  @override
  Widget build(BuildContext context) {
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
      body: Obx(
        () => ListView.separated(
          itemCount: savedPosts.length,
          itemBuilder: (context, index) => SavedPostTile.buildInstance(
              savedPosts[index].data!,
              getSalaryRange(savedPosts[index].data!.salaryRange_Id!)),
          separatorBuilder: (context, index) => Divider(
            thickness: 1.0,
            color: Colors.grey[300],
          ).pSymmetric(h: 16),
        ),
      ),
    );
  }
}
