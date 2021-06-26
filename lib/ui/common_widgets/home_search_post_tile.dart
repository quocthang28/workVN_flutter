import 'package:flutter/material.dart';
import 'package:workvn/model/home_search/HomeSearchPost.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:workvn/navigation.dart';
import 'package:workvn/res/app_color.dart';

class HomeSearchTile extends StatelessWidget {
  HomeSearchTile(this.post);

  final DataBean post;

  static HomeSearchTile buildInstance(DataBean post) {
    return HomeSearchTile(post);
  }

  String getSalary() {
    if (post.salaryRange_Id!.salaryMin! == 0 &&
        post.salaryRange_Id!.salaryMax! == 0) {
      return 'Thương lượng';
    } else
      return '${post.salaryRange_Id!.salaryMin!}\$ - ${post.salaryRange_Id!.salaryMax!}';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          post.company_Id!.optionalDetailCompany_Id!.logoUrl!,
          errorBuilder:
              (BuildContext context, Object exception, StackTrace? stackTrace) {
            return SizedBox(
              width: 100,
              child: Icon(
                Icons.error,
                color: Colors.grey,
              ),
            );
          },
        ).expand(flex: 1),
        ListTile(
          onTap: () => Get.toNamed(SiteNavigation.POSTDETAIL,
              arguments: [post.id, getSalary()]),
          visualDensity: VisualDensity.comfortable,
          title: post.jobTitle!.text.ellipsis.size(18).make(),
          subtitle: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              post.company_Id!.companyName!.text.ellipsis
                  .size(16)
                  .make()
                  .pOnly(bottom: 4),
              getSalary().text.color(AppColor.lightBlue).make(),
            ],
          ).pOnly(top: 4),
        ).expand(flex: 3),
      ],
    ).pSymmetric(h: 8);
  }
}
