import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workvn/controller/benefits_controller.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:workvn/model/post_detail/PostDetail.dart';
import 'package:workvn/res/app_color.dart';
import 'package:workvn/res/gaps.dart';
import 'package:workvn/ui/common_widgets/show_more.dart';

class PostDetailColumn extends StatelessWidget {
  PostDetailColumn({required this.postDetail, required this.salary});

  final BenefitsController _benefitsController = Get.find();
  final PostDetail postDetail;
  final String salary;

  static PostDetailColumn buildInstance(PostDetail postDetail, String salary) {
    return PostDetailColumn(postDetail: postDetail, salary: salary);
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildBenefit() {
      List<String> benefitNames = [];
      Random ran = Random();
      for (int i = 0; i < 5; i++) {
        benefitNames.add(
            _benefitsController.benefits.data![ran.nextInt(15)].benefitName!);
      }
      return Wrap(
        children: benefitNames
            .map((e) => VxBox(
                  child: e.text.size(18).color(AppColor.lightBlue).make().p(8),
                ).lightBlue100.make().p(8))
            .toList(),
      );
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Gaps.vGap8,
          Align(
            alignment: Alignment.centerLeft,
            child:
                postDetail.data!.jobTitle!.text.size(28).semiBold.make().p(8),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              VxBox(
                child:
                    salary.text.size(18).color(AppColor.lightBlue).make().p(8),
              ).lightBlue100.make().pOnly(left: 8),
              VxBox(
                      child: 'Toàn thời gian'
                          .text
                          .color(AppColor.textColor)
                          .size(18)
                          .make()
                          .p(8))
                  .make(),
            ],
          ),
          Gaps.vGap10,
          ListTile(
            leading: Image.network(postDetail
                .data!.company_Id!.optionalDetailCompany_Id!.logoUrl!),
            title:
                postDetail.data!.company_Id!.companyName!.text.size(16).make(),
            subtitle: Row(
              children: [
                Icon(Icons.people_outline, color: AppColor.textColor),
                Gaps.hGap4,
                postDetail.data!.company_Id!.optionalDetailCompany_Id!
                    .companySize_Id!.companySize!.text
                    .make(),
              ],
            ).pSymmetric(v: 4),
          ),
          Gaps.vGap10,
          'Địa điểm làm việc'
              .text
              .semiBold
              .size(18)
              .make()
              .pSymmetric(h: 8)
              .pOnly(bottom: 4),
          postDetail.data!.company_Id!.exactAddress!.text
              .size(16)
              .make()
              .pSymmetric(h: 8),
          Divider(color: AppColor.dividerColor, height: 12, thickness: 14)
              .pSymmetric(v: 20),
          'Chế độ phúc lợi'
              .text
              .semiBold
              .size(18)
              .make()
              .pSymmetric(h: 8)
              .pOnly(bottom: 4),
          _buildBenefit(),
          Divider(color: AppColor.dividerColor, height: 12, thickness: 14)
              .pSymmetric(v: 20),
          ShowMore(
            contentFull: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                'Mô tả công việc'
                    .text
                    .semiBold
                    .size(18)
                    .make()
                    .pSymmetric(h: 8)
                    .pOnly(bottom: 4),
                postDetail.data!.jobDescription!.text
                    .color(AppColor.textColor)
                    .size(16)
                    .make()
                    .pSymmetric(h: 8),
                Gaps.vGap8,
                'Yêu cầu công việc'
                    .text
                    .semiBold
                    .size(18)
                    .make()
                    .pSymmetric(h: 8)
                    .pOnly(bottom: 4),
                postDetail.data!.jobRequirement!.text
                    .color(AppColor.textColor)
                    .size(16)
                    .make()
                    .pSymmetric(h: 8),
              ],
            ),
            contentLess: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                'Mô tả công việc'
                    .text
                    .semiBold
                    .size(18)
                    .make()
                    .pSymmetric(h: 8)
                    .pOnly(bottom: 4),
                postDetail.data!.jobDescription!.text
                    .color(AppColor.textColor)
                    .size(16)
                    .make()
                    .pSymmetric(h: 8),
              ],
            ),
            minHeight: 300,
          ),
          Gaps.vGap10,
          Divider(color: AppColor.dividerColor, height: 12, thickness: 14),
          Gaps.vGap10,
          'Việc làm tương tự'
              .text
              .semiBold
              .size(18)
              .make()
              .pSymmetric(h: 8)
              .pOnly(bottom: 4),
        ],
      ),
    );
  }
}
