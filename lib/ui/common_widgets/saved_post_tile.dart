import 'package:flutter/material.dart';
import 'package:workvn/model/post_detail/PostDetail.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:workvn/navigation.dart';
import 'package:workvn/res/app_color.dart';

class SavedPostTile extends StatelessWidget {
  SavedPostTile(this.post, this.salary);

  final DataBean post;
  final String salary;

  static SavedPostTile buildInstance(DataBean post, String salary) {
    return SavedPostTile(post, salary);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(post.company_Id!.optionalDetailCompany_Id!.logoUrl!)
            .expand(flex: 1),
        ListTile(
          onTap: () => Get.toNamed(SiteNavigation.POSTDETAIL,
              arguments: [post.id, salary]),
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
              salary.text.color(AppColor.lightBlue).make(),
            ],
          ).pOnly(top: 4),
        ).expand(flex: 3),
      ],
    ).p(8);
  }
}
