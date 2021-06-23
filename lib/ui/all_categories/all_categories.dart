import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:workvn/controller/job_detail_controller/job_detail_controller.dart';
import 'package:workvn/model/job_detail/all_categories/AllCategories.dart';
import 'package:workvn/navigation.dart';
import 'package:workvn/res/app_color.dart';

class AllCategoriesScreen extends StatelessWidget {
  final JobDetailController _jobDetailController = Get.find();

  @override
  Widget build(BuildContext context) {
    // return ListView.separated(itemBuilder: itemBuilder, separatorBuilder: separatorBuilder, itemCount: itemCount);
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: 'Tất cả danh mục'
              .text
              .semiBold
              .textStyle(TextStyle(
                  foreground: Paint()..shader = AppColor.linearGradient))
              .make(),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () =>
                      Get.toNamed(SiteNavigation.TOPVIEWPOSTS, arguments: [
                    _jobDetailController.allCategories.data![index].id,
                    _jobDetailController
                        .allCategories.data![index].JobDetailName
                  ]),
                  // onTap: () => print(element.detail!.id),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        '${_jobDetailController.allCategories.data![index].JobDetailName} (${_jobDetailController.allCategories.data![index].scrapeId!})'
                            .text
                            .color(AppColor.lightBlue)
                            .size(18.0)
                            .ellipsis
                            .make()
                            .expand(),
                        Icon(
                          Icons.chevron_right,
                          color: AppColor.lightBlue,
                          size: 35,
                        ),
                      ],
                    ),
                  ).p(8),
                ),
            separatorBuilder: (context, index) => Divider(
                  thickness: 1.0,
                  color: Colors.grey[300],
                ).pSymmetric(h: 16),
            itemCount: 70));
  }
}
