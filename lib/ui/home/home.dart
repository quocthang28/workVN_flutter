import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:workvn/controller/auth_controller.dart';
import 'package:workvn/controller/company_controller/company_controller.dart';
import 'package:workvn/controller/job_detail_controller/job_detail_controller.dart';
import 'package:workvn/controller/recruitment_post_controller/recruitment_post_controller.dart';
import 'package:workvn/model/company/featured_company/FeaturedCompany.dart';
import 'package:workvn/model/job_detail/HotCategories/HotCategories.dart';
import 'package:workvn/model/recruitment_post/recommended_post/RecommendedPost.dart';
import 'package:workvn/res/app_color.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin<HomeScreen> {
  AuthController _authController = Get.find();
  JobDetailController _jobDetailController = Get.find();
  RecruitmentPostController _recruitmentPostController = Get.find();
  CompanyController _companyController = Get.find();
  HotCategories _hotCategories = HotCategories();
  RecommendedPost _recommendedPost = RecommendedPost();
  FeaturedCompany _featuredCompany = FeaturedCompany();
  bool _isLoadingCategories = true;
  bool _isLoadingRecommended = true;
  bool _isLoadingFeaturedCompany = true;

  @override
  bool get wantKeepAlive => true;

  void getData() {
    _jobDetailController.getHotCategories().then((value) {
      setState(() {
        _hotCategories = value;
        _isLoadingCategories = false;
      });
    });

    _recruitmentPostController.getRecommendedPost().then((value) {
      setState(() {
        _recommendedPost = value;
        _isLoadingRecommended = false;
      });
    });

    _companyController.getFeaturedCompany().then((value) {
      setState(() {
        _featuredCompany = value;
        _isLoadingFeaturedCompany = false;
      });
    });
  }

  @override
  void initState() {
    getData();
    print(_featuredCompany.data);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    Widget _buildHotCategories() {
      List<Widget> categoryCards = [];
      _hotCategories.data!.forEach((element) {
        categoryCards.add(Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              '${element.detail!.jobCategory_Id!.jobCategoryName!} (${element.countTotal!})'
                  .text
                  .color(AppColor.lightBlue)
                  .size(18.0)
                  .make(),
              Icon(
                Icons.chevron_right,
                color: AppColor.lightBlue,
                size: 35,
              ),
            ],
          ),
        ).p(8));
      });

      return Column(
        children: categoryCards,
      );
    }

    Widget _buildRecommendedJobs() {
      return ListView.separated(
        shrinkWrap: true,
        itemCount: _recommendedPost.data!.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Row(
          children: [
            // CachedNetworkImage(
            //   imageUrl: element.company_Id!.optionalDetailCompany_Id!.logoUrl!,
            //   progressIndicatorBuilder: (context, url, downloadProgress) =>
            //       CircularProgressIndicator(value: downloadProgress.progress),
            //   errorWidget: (context, url, error) => Text('No image'),
            // ).expand(flex: 1),
            Image.network(_recommendedPost.data![index].company_Id!
                    .optionalDetailCompany_Id!.logoUrl!)
                .expand(flex: 1),
            ListTile(
              visualDensity: VisualDensity.comfortable,
              title: _recommendedPost.data![index].jobTitle!.text.ellipsis
                  .size(18)
                  .make(),
              subtitle: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //element.id!.text.make(),
                  //TODO: ADD COMPANY PIC
                  _recommendedPost
                      .data![index].company_Id!.companyName!.text.ellipsis
                      .size(16)
                      .make()
                      .pOnly(bottom: 4),
                  _recommendedPost.data![index].salaryRange_Id!.salaryMin ==
                              0 &&
                          _recommendedPost
                                  .data![index].salaryRange_Id!.salaryMax ==
                              0
                      ? 'Thương lượng'
                          .text
                          .size(16)
                          .color(AppColor.lightBlue)
                          .make()
                      : '${_recommendedPost.data![index].salaryRange_Id!.salaryMin}\$ - ${_recommendedPost.data![index].salaryRange_Id!.salaryMax}\$'
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
          color: Colors.grey,
        ).pSymmetric(h: 16),
      );
    }

    Widget _buildFeaturedCompanies() {
      List<Widget> companies = [];
      _featuredCompany.data!.forEach((element) {
        companies.add(Container(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColor.lightBlue),
            ),
            child: element.companyName!.text.size(30).make(),
          ),
        ));
      });

      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: companies,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: 'workVN'.text.color(Colors.white).make(),
        //todo: add search here
        actions: [
          IconButton(
              onPressed: () => _authController.signOut(),
              icon: Icon(
                Icons.logout,
                color: Colors.white,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: 'Nhà tuyển dụng hàng đầu'
                  .text
                  .size(20.0)
                  .bold
                  .color(AppColor.lightBlue)
                  .make(),
            ).p(8.0),
            !_isLoadingFeaturedCompany
                ? _buildFeaturedCompanies()
                : CircularProgressIndicator().centered(),
            Align(
              alignment: Alignment.centerLeft,
              child: 'Danh mục hot'
                  .text
                  .size(20.0)
                  .bold
                  .color(AppColor.lightBlue)
                  .make(),
            ).p(8.0),
            !_isLoadingCategories
                ? _buildHotCategories()
                : CircularProgressIndicator().centered(),
            Align(
              alignment: Alignment.centerLeft,
              child: 'Gợi ý việc làm cho bạn'
                  .text
                  .size(20.0)
                  .bold
                  .color(AppColor.lightBlue)
                  .make(),
            ).p(8.0),
            !_isLoadingRecommended
                ? _buildRecommendedJobs()
                : CircularProgressIndicator().centered(),
          ],
        ),
      ),
    );
  }
}

//company pic https://images02.vietnamworks.com/
