import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:get/get.dart';
import 'package:workvn/controller/company_controller/company_controller.dart';
import 'package:workvn/model/company/company_detail/CompanyDetail.dart';

class CompanyDetailScreen extends StatefulWidget {
  @override
  _CompanyDetailScreenState createState() => _CompanyDetailScreenState();
}

class _CompanyDetailScreenState extends State<CompanyDetailScreen> {
  final CompanyController _companyController = Get.find();
  final String _companyID = Get.arguments;
  CompanyDetail _companyDetail = CompanyDetail();
  bool _isLoading = true;

  @override
  void initState() {
    _companyController.getCompanyDetail(_companyID).then((value) {
      _companyDetail = value;
      _isLoading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: !_isLoading
          ? CircularProgressIndicator().centered()
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  _companyDetail.data!.id!.text.make(),
                  // CachedNetworkImage(
                  //   height: 200,
                  //   imageUrl:
                  //       'https://images02.vietnamworks.com${_companyDetail.data!.optionalDetailCompany_Id!.logoUrl!}',
                  //   placeholder: (context, url) => Container(
                  //       decoration: BoxDecoration(
                  //         color: Colors.white,
                  //       ),
                  //       child: CircularProgressIndicator().centered()),
                  //   errorWidget: (context, url, error) => Icon(Icons.error),
                  //   fit: BoxFit.fitWidth,
                  // )
                  // _companyDetail.data!.optionalDetailCompany_Id!.logoUrl!.text
                  //     .make(),
                ],
              ),
            ),
    );
  }
}
