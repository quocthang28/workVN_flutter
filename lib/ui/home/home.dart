import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:workvn/controller/auth_controller.dart';
import 'package:workvn/controller/company_controller/company_controller.dart';
import 'package:workvn/controller/job_detail_controller/job_detail_controller.dart';
import 'package:workvn/controller/recruitment_post_controller/recruitment_post_controller.dart';
import 'package:workvn/model/company/featured_company/FeaturedCompany.dart';
import 'package:workvn/model/job_detail/HotCategories/HotCategories.dart';
import 'package:workvn/model/recruitment_post/recommended_post/RecommendedPost.dart';
import 'package:workvn/navigation.dart';
import 'package:workvn/res/app_color.dart';
import 'package:workvn/ui/common_widgets/post_tile.dart';

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
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    Widget _buildHotCategories() {
      List<Widget> categoryCards = [];
      _hotCategories.data!.forEach((element) {
        categoryCards.add(GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () => Get.toNamed(SiteNavigation.TOPVIEWPOSTS, arguments: [
            element.detail!.id,
            element.detail!.jobCategory_Id!.jobCategoryName!
          ]),
          // onTap: () => print(element.detail!.id),
          child: Container(
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
          ).pSymmetric(h: 8, v: 2),
        ));
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
        itemBuilder: (context, index) =>
            PostTile.buildInstance(_recommendedPost.data![index]),
        separatorBuilder: (context, index) => Divider(
          thickness: 1.0,
          color: Colors.grey[300],
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

      return CarouselSlider(
        options: CarouselOptions(
          height: 180,
          autoPlay: true,
        ),
        items: _featuredCompany.data!.map((e) {
          return Builder(
            builder: (BuildContext context) {
              return GestureDetector(
                onTap: () =>
                    Get.toNamed(SiteNavigation.COMPANYDETAIL, arguments: e.id),
                child: CachedNetworkImage(
                  height: 200,
                  imageUrl:
                      'https://images02.vietnamworks.com${e.optionalDetailCompany_Id!.logoUrl!}',
                  placeholder: (context, url) => Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: CircularProgressIndicator().centered()),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                  fit: BoxFit.fitWidth,
                ).pSymmetric(h: 40),
              );
            },
          );
        }).toList(),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: 'jobSeeker'
            .text
            .extraBold
            .textStyle(TextStyle(
                foreground: Paint()..shader = AppColor.linearGradient))
            .make(),
        //todo: add search here
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TextField(
              onSubmitted: (value) {
                Get.toNamed(SiteNavigation.HOMESEARCH, arguments: value);
              },
              onChanged: (value) {},
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColor.lightBlue,
                ),
                isDense: true,
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                hintText: 'Nhập từ khóa',
                border: InputBorder.none,
                filled: true,
                fillColor: AppColor.textFieldColor,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ).pSymmetric(h: 8, v: 4),
            Align(
              alignment: Alignment.centerLeft,
              child: 'Nhà tuyển dụng hàng đầu'
                  .text
                  .size(20.0)
                  .bold
                  .color(Colors.grey[700]!)
                  .make(),
            ).p(8.0),
            !_isLoadingFeaturedCompany
                ? _buildFeaturedCompanies()
                : SizedBox(height: 180),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                'Danh mục hot'
                    .text
                    .size(20.0)
                    .bold
                    .color(Colors.grey[700]!)
                    .make(),
                GestureDetector(
                  onTap: () => Get.toNamed(SiteNavigation.ALLCATEGORIES),
                  child: 'Xem tất cả'
                      .text
                      .size(18)
                      .color(AppColor.lightBlue)
                      .make(),
                )
              ],
            ).p(8),
            !_isLoadingCategories
                ? _buildHotCategories()
                : SizedBox(
                    width: double.infinity,
                    height: 150,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.white,
                      child: ListView.builder(
                        itemBuilder: (_, __) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Container(
                            width: double.infinity,
                            height: 20.0,
                            color: Colors.white,
                          ),
                        ).pSymmetric(h: 8, v: 10),
                        itemCount: 3,
                      ),
                    ),
                  ),
            Align(
              alignment: Alignment.centerLeft,
              child: 'Gợi ý việc làm cho bạn'
                  .text
                  .size(20.0)
                  .bold
                  .color(Colors.grey[700]!)
                  .make(),
            ).p(8.0),
            !_isLoadingRecommended
                ? _buildRecommendedJobs()
                : SizedBox(
                    width: double.infinity,
                    height: 100.0,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.white,
                      child: ListView.builder(
                        itemBuilder: (_, __) => Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 48.0,
                                height: 48.0,
                                color: Colors.white,
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      width: double.infinity,
                                      height: 8.0,
                                      color: Colors.white,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      height: 8.0,
                                      color: Colors.white,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 2.0),
                                    ),
                                    Container(
                                      width: 40.0,
                                      height: 8.0,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        itemCount: 6,
                      ),
                    ),
                  ).pSymmetric(h: 8),
          ],
        ),
      ),
    );
  }
}

//company pic https://images02.vietnamworks.com
