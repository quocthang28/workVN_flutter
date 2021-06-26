import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:workvn/controller/company_controller/company_controller.dart';
import 'package:workvn/model/company/company_detail/CompanyDetail.dart';
import 'package:workvn/model/company_post/CompanyPost.dart';
import 'package:workvn/navigation.dart';
import 'package:workvn/res/gaps.dart';

class CompanyDetailScreen extends StatefulWidget {
  @override
  _CompanyDetailScreenState createState() => _CompanyDetailScreenState();
}

class _CompanyDetailScreenState extends State<CompanyDetailScreen> {
  final CompanyController _companyController = Get.find();
  final String _companyID = Get.arguments;
  CompanyDetail _companyDetail = CompanyDetail();
  CompanyPost companyPost = CompanyPost();
  bool _isLoading = true;
  bool _isLoadingPosts = true;

  @override
  void initState() {
    _companyController.getCompanyDetail(_companyID).then((value) {
      setState(() {
        _companyDetail = value;
        _isLoading = false;
      });
    });
    _companyController.getCompanyPost(_companyID).then((value) {
      setState(() {
        companyPost = value;
        _isLoadingPosts = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildCompanyPosts() {
      return ListView.separated(
          shrinkWrap: true,
          itemBuilder: (context, index) => ListTile(
                onTap: () => Get.toNamed(SiteNavigation.POSTDETAIL,
                    arguments: [companyPost.data![index].id, 'Thương lượng']),
                title: companyPost.data![index].jobTitle!.text.make(),
              ),
          separatorBuilder: (context, index) => Divider(
                thickness: 1.0,
                color: Colors.grey[300],
              ).pSymmetric(h: 16),
          itemCount: companyPost.data!.length);
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: _isLoading
          ? CircularProgressIndicator().centered()
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Stack(
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: CachedNetworkImage(
                          height: 200,
                          imageUrl: (_companyDetail
                                      .data!.optionalDetailCompany_Id!.logoUrl!)
                                  .contains('http')
                              ? _companyDetail
                                  .data!.optionalDetailCompany_Id!.bannerUrl!
                              : 'https://images02.vietnamworks.com${_companyDetail.data!.optionalDetailCompany_Id!.bannerUrl!}',
                          placeholder: (context, url) => Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: CircularProgressIndicator().centered()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: Colors.grey.withOpacity(0.3), width: 2)),
                        child: CachedNetworkImage(
                          height: 100,
                          width: 100,
                          imageUrl: (_companyDetail
                                      .data!.optionalDetailCompany_Id!.logoUrl!)
                                  .contains('http')
                              ? _companyDetail
                                  .data!.optionalDetailCompany_Id!.logoUrl!
                              : 'https://images02.vietnamworks.com${_companyDetail.data!.optionalDetailCompany_Id!.logoUrl!}',
                          placeholder: (context, url) => Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              child: CircularProgressIndicator().centered()),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                          fit: BoxFit.contain,
                        ),
                      ).pOnly(top: 150).centered(),
                    ],
                  ),
                  _companyDetail.data!.companyName!.text
                      .size(18)
                      .semiBold
                      .align(TextAlign.center)
                      .make()
                      .p(10),
                  _companyDetail.data!.exactAddress != null
                      ? _companyDetail.data!.exactAddress!.text
                          .align(TextAlign.center)
                          .size(16)
                          .make()
                      : Gaps.empty,
                  Align(
                          alignment: Alignment.centerLeft,
                          child: 'Việc làm đang tuyển'
                              .text
                              .size(16)
                              .semiBold
                              .make())
                      .pOnly(left: 8, top: 16),
                  _isLoadingPosts
                      ? SizedBox(
                          width: double.infinity,
                          height: 350.0,
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: double.infinity,
                                            height: 8.0,
                                            color: Colors.white,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            height: 8.0,
                                            color: Colors.white,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 2.0),
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
                        ).pSymmetric(h: 8, v: 20)
                      : companyPost.data!.length == 0
                          ? 'Công ty này chưa đăng việc làm'
                              .text
                              .make()
                              .p(25)
                              .centered()
                          : _buildCompanyPosts()
                ],
              ),
            ),
    );
  }
}
