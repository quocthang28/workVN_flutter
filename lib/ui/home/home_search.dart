import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:workvn/controller/recruitment_post_controller/recruitment_post_controller.dart';
import 'package:workvn/model/home_search/HomeSearchPost.dart';
import 'package:workvn/res/app_color.dart';
import 'package:workvn/ui/common_widgets/home_search_post_tile.dart';

class HomeSearchScreen extends StatefulWidget {
  @override
  _HomeSearchScreenState createState() => _HomeSearchScreenState();
}

class _HomeSearchScreenState extends State<HomeSearchScreen> {
  RecruitmentPostController _recruitmentPostController = Get.find();
  Map<String, dynamic> filterMap = {
    "match_data": {
      "list_job_detail_id": [],
      "job_level_id": null,
      "salary_range_id": null,
      "min_salary": 0,
      "max_salary": 9000,
      "job_type_id": null,
      "company_id": ""
    },
    "page_number": 5,
    "sort_type": "createdAt",
    "max_distance": 0
  };
  HomeSearchPost homeSearchPost = HomeSearchPost();
  String keyWord = Get.arguments;
  bool isLoading = true;

  @override
  void initState() {
    _recruitmentPostController
        .getHomeSearchPosts(keyWord, filterMap)
        .then((value) {
      setState(() {
        homeSearchPost = value;
        isLoading = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: '\"$keyWord\"'
              .text
              .textStyle(TextStyle(
                  foreground: Paint()..shader = AppColor.linearGradient))
              .make(),
          backgroundColor: Colors.white,
        ),
        body: isLoading
            ? CircularProgressIndicator().centered()
            : homeSearchPost.data!.length == 0
                ? 'Không có kết quả tìm kiếm phù hợp với từ khóa'
                    .text
                    .make()
                    .centered()
                : ListView.separated(
                    itemBuilder: (context, index) =>
                        HomeSearchTile.buildInstance(
                            homeSearchPost.data![index]),
                    separatorBuilder: (context, index) => Divider(
                          thickness: 1.0,
                          color: Colors.grey[300],
                        ).pSymmetric(h: 16),
                    itemCount: homeSearchPost.data!.length));
  }
}
