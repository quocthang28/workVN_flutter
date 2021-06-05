import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:workvn/controller/recruitment_post_controller/recruitment_post_controller.dart';
import 'package:workvn/model/recruitment_post/top_view_post/TopViewPosts.dart';
import 'package:workvn/navigation.dart';
import 'package:workvn/res/app_color.dart';
import 'package:workvn/ui/common_widgets/post_tile.dart';

class TopViewPostsScreen extends StatefulWidget {
  @override
  _TopViewPostsScreenState createState() => _TopViewPostsScreenState();
}

class _TopViewPostsScreenState extends State<TopViewPostsScreen> {
  final RecruitmentPostController _recruitmentPostController = Get.find();

  final String categoryID = Get.arguments;

  TopViewPosts _topViewPosts = TopViewPosts();
  bool isLoading = true;

  @override
  void initState() {
    _recruitmentPostController
        .getTopViewPosts({"jobDetail_Id": categoryID}).then((value) {
      setState(() {
        _topViewPosts = value;
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildPosts() {
      return ListView.separated(
        itemCount: _topViewPosts.data!.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Row(
          children: [
            ListTile(
              onTap: () => Get.toNamed(SiteNavigation.POSTDETAIL, arguments: [
                _topViewPosts.data![index].id,
                _topViewPosts.data![index].salaryRange_Id!.salaryMin == 0 &&
                        _topViewPosts.data![index].salaryRange_Id!.salaryMax ==
                            0
                    ? 'Thương lượng'
                    : '${_topViewPosts.data![index].salaryRange_Id!.salaryMin}\$ - ${post.salaryRange_Id!.salaryMax}\$'
              ]),
              visualDensity: VisualDensity.comfortable,
              title: _topViewPosts.data![index].jobTitle!.text.ellipsis
                  .size(18)
                  .make(),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //element.id!.text.make(),
                  post.company_Id!.companyName!.text.ellipsis
                      .size(16)
                      .make()
                      .pOnly(bottom: 4),
                  post.salaryRange_Id!.salaryMin == 0 &&
                          post.salaryRange_Id!.salaryMax == 0
                      ? 'Thương lượng'
                          .text
                          .size(16)
                          .color(AppColor.lightBlue)
                          .make()
                      : '${_topViewPosts.data![index].salaryRange_Id!.salaryMin}\$ - ${_topViewPosts.data![index].salaryRange_Id!.salaryMax}\$'
                          .text
                          .color(AppColor.lightBlue)
                          .make(),
                ],
              ).pOnly(top: 4),
            ).expand(flex: 3),
          ],
        ).p(8),
        separatorBuilder: (context, index) => Divider(
          thickness: 1.0,
          color: Colors.grey[300],
        ).pSymmetric(h: 16),
      );
    }

    return Scaffold(
      appBar: AppBar(),
      body: isLoading ? CircularProgressIndicator().centered() : _buildPosts(),
    );
  }
}
