import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:workvn/model/recruitment_post/recommended_post/RecommendedPost.dart';
import 'package:workvn/navigation.dart';
import 'package:workvn/res/app_color.dart';

class PostTile extends StatelessWidget {
  PostTile({required this.post});

  DataBean post;

  static PostTile buildInstance(dynamic post) {
    return PostTile(post: post);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(post!.company_Id!.optionalDetailCompany_Id!.logoUrl!)
            .expand(flex: 1),
        ListTile(
          onTap: () => Get.toNamed(SiteNavigation.POSTDETAIL, arguments: [
            post.id,
            post.salaryRange_Id!.salaryMin == 0 &&
                    post.salaryRange_Id!.salaryMax == 0
                ? 'Thương lượng'
                : '${post.salaryRange_Id!.salaryMin}\$ - ${post.salaryRange_Id!.salaryMax}\$'
          ]),
          visualDensity: VisualDensity.comfortable,
          title: post.jobTitle!.text.ellipsis.size(18).make(),
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
                  : '${post.salaryRange_Id!.salaryMin}\$ - ${post.salaryRange_Id!.salaryMax}\$'
                      .text
                      .color(AppColor.lightBlue)
                      .make(),
            ],
          ).pOnly(top: 4),
        ).expand(flex: 3),
      ],
    ).p(8);
  }
}
