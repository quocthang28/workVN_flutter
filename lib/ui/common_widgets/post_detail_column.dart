import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:workvn/controller/benefits_controller.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:workvn/controller/recruitment_post_controller/recruitment_post_controller.dart';
import 'package:workvn/model/post_detail/PostDetail.dart';
import 'package:workvn/model/recruitment_post/similar_jobs/SimilarJobs.dart';
import 'package:workvn/navigation.dart';
import 'package:workvn/res/app_color.dart';
import 'package:workvn/res/gaps.dart';
import 'package:workvn/ui/common_widgets/gradient_border.dart';
import 'package:workvn/ui/common_widgets/show_more.dart';
import 'package:intl/intl.dart';

class PostDetailColumn extends StatefulWidget {
  PostDetailColumn({required this.postDetail, required this.salary});

  final PostDetail postDetail;
  final String salary;

  static PostDetailColumn buildInstance(PostDetail postDetail, String salary) {
    return PostDetailColumn(postDetail: postDetail, salary: salary);
  }

  @override
  _PostDetailColumnState createState() => _PostDetailColumnState();
}

class _PostDetailColumnState extends State<PostDetailColumn> {
  final RecruitmentPostController _recruitmentPostController = Get.find();
  SimilarJobs _similarJobs = SimilarJobs();
  bool isLoadingSimilarJobs = true;

  final BenefitsController _benefitsController = Get.find();

  @override
  void initState() {
    // print({
    //   "listLocation":
    //       widget.postDetail.data!.hasLocations!.map((e) => e.id).toList(),
    //   "listJobDetail":
    //       widget.postDetail.data!.hasJobs!.map((e) => e.id).toList(),
    //   "listSkill": [],
    //   "salaryRange_Id": null,
    //   "jobLevelId": widget.postDetail.data!.jobLevel_Id,
    // });
    _recruitmentPostController.getSimilarJobs({
      "listLocation":
          widget.postDetail.data!.hasLocations!.map((e) => e.id).toList(),
      "listJobDetail":
          widget.postDetail.data!.hasJobs!.map((e) => e.id).toList(),
      "listSkill": [],
      "salaryRange_Id": null,
      "jobLevelId": widget.postDetail.data!.jobLevel_Id,
    }).then((value) {
      setState(() {
        _similarJobs = value;
        isLoadingSimilarJobs = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildBenefit() {
      Set<String> benefitNames = Set();
      Random ran = Random();
      int amount = 3 + ran.nextInt(6 - 3);
      while (benefitNames.length < amount) {
        benefitNames.add(
            _benefitsController.benefits.data![ran.nextInt(30)].benefitName!);
      }
      return Wrap(
        children: benefitNames
            .map((e) => GradientContainer(
                    e.text.size(16).color(AppColor.lightBlue).make().p(6))
                .p(8))
            .toList(),
      );
    }

    Widget _buildSimilarJobs() {
      return isLoadingSimilarJobs
          ? Gaps.empty
          : ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _similarJobs.data!.length,
              itemBuilder: (context, index) => Row(
                children: [
                  Image.network(_similarJobs.data![index].company_Id!
                          .optionalDetailCompany_Id!.logoUrl!)
                      .expand(flex: 1),
                  ListTile(
                    onTap: () => Get.toNamed(SiteNavigation.POSTDETAIL,
                        arguments: [
                          _similarJobs.data![index].id,
                          _similarJobs.data![index].salaryRange_Id!.salaryMin ==
                                      0 &&
                                  _similarJobs.data![index].salaryRange_Id!
                                          .salaryMax ==
                                      0
                              ? 'Thương lượng'
                              : '${_similarJobs.data![index].salaryRange_Id!.salaryMin}\$ - ${_similarJobs.data![index].salaryRange_Id!.salaryMax}\$'
                        ],
                        preventDuplicates: false),
                    visualDensity: VisualDensity.comfortable,
                    title: _similarJobs.data![index].jobTitle!.text.ellipsis
                        .size(18)
                        .make(),
                    subtitle: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        //element.id!.text.make(),
                        _similarJobs
                            .data![index].company_Id!.companyName!.text.ellipsis
                            .size(16)
                            .make()
                            .pOnly(bottom: 4),
                        _similarJobs.data![index].salaryRange_Id!.salaryMin ==
                                    0 &&
                                _similarJobs.data![index].salaryRange_Id!
                                        .salaryMax ==
                                    0
                            ? 'Thương lượng'
                                .text
                                .size(16)
                                .color(AppColor.lightBlue)
                                .make()
                            : '${_similarJobs.data![index].salaryRange_Id!.salaryMin}\$ - ${_similarJobs.data![index].salaryRange_Id!.salaryMax}\$'
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

    Widget _buildDates() {
      var publishedDate = DateTime.fromMicrosecondsSinceEpoch(
          widget.postDetail.data!.publishedDate!.toInt() * 1000000);
      var expiredDate = DateTime.fromMicrosecondsSinceEpoch(
          widget.postDetail.data!.expiredTime!.toInt() * 1000000);
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              'Ngày đăng:'
                  .text
                  .size(16)
                  .color(Colors.grey[700]!)
                  .semiBold
                  .make(),
              DateFormat('dd-MM-yyyy')
                  .format(publishedDate)
                  .toString()
                  .text
                  .size(16)
                  .make(),
            ],
          ),
          Container(height: 35, child: VerticalDivider(color: Colors.black)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              'Ngày hết hạn:'
                  .text
                  .size(16)
                  .color(Colors.grey[700]!)
                  .semiBold
                  .make(),
              DateFormat('dd-MM-yyyy')
                  .format(expiredDate)
                  .toString()
                  .text
                  .size(16)
                  .make(),
            ],
          ),
        ],
      ).pOnly(top: 10);
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Gaps.vGap8,
          Align(
            alignment: Alignment.centerLeft,
            child: widget.postDetail.data!.jobTitle!.text
                .size(28)
                .semiBold
                .make()
                .p(8),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // VxBox(
              //   child: widget.salary.text
              //       .size(18)
              //       .color(AppColor.lightBlue)
              //       .make()
              //       .p(8),
              // )
              //     .color(AppColor.lightBlue.withOpacity(0.1))
              //     .make()
              //     .pOnly(left: 8),
              GradientContainer(widget.salary.text
                      .size(18)
                      .color(AppColor.lightBlue)
                      .make()
                      .p(8))
                  .pOnly(left: 8),
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
            onTap: () => Get.toNamed(SiteNavigation.COMPANYDETAIL,
                arguments: widget.postDetail.data!.company_Id!.id),
            leading: Image.network(widget.postDetail.data!.company_Id!
                .optionalDetailCompany_Id!.logoUrl!),
            title: widget.postDetail.data!.company_Id!.companyName!.text
                .size(16)
                .make(),
            subtitle: Row(
              children: [
                Icon(Icons.people_outline, color: AppColor.textColor),
                Gaps.hGap4,
                widget.postDetail.data!.company_Id!.optionalDetailCompany_Id!
                    .companySize_Id!.companySize!.text
                    .make(),
              ],
            ).pSymmetric(v: 4),
          ),
          Gaps.vGap10,
          'Địa điểm làm việc:'
              .text
              .semiBold
              .size(18)
              .color(Colors.grey[700]!)
              .make()
              .pSymmetric(h: 8),
          widget.postDetail.data!.company_Id!.exactAddress!.text
              .size(16)
              .make()
              .pSymmetric(h: 8),
          _buildDates(),
          Divider(color: AppColor.dividerColor, height: 12, thickness: 14)
              .pSymmetric(v: 20),
          'Chế độ phúc lợi'
              .text
              .semiBold
              .color(Colors.grey[700]!)
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
                    .color(Colors.grey[700]!)
                    .make()
                    .pSymmetric(h: 8)
                    .pOnly(bottom: 4),
                widget.postDetail.data!.jobDescription!.text
                    .color(AppColor.textColor)
                    .size(16)
                    .make()
                    .pSymmetric(h: 8),
                Gaps.vGap8,
                'Yêu cầu công việc'
                    .text
                    .semiBold
                    .size(18)
                    .color(Colors.grey[700]!)
                    .make()
                    .pSymmetric(h: 8)
                    .pOnly(bottom: 4),
                widget.postDetail.data!.jobRequirement!.text
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
                    .color(Colors.grey[700]!)
                    .make()
                    .pSymmetric(h: 8)
                    .pOnly(bottom: 4),
                widget.postDetail.data!.jobDescription!.text
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
              .color(Colors.grey[700]!)
              .size(18)
              .make()
              .pSymmetric(h: 8)
              .pOnly(bottom: 4),
          _buildSimilarJobs(),
        ],
      ),
    );
  }
}
