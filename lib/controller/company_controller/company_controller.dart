import 'package:get/get.dart';
import 'package:workvn/api/company/company_service.dart';
import 'package:workvn/model/company/company_detail/CompanyDetail.dart';
import 'package:workvn/model/company/featured_company/FeaturedCompany.dart';
import 'package:workvn/model/company_post/CompanyPost.dart';

class CompanyController extends GetxController {
  CompanyService companyService = Get.find();

  Future<FeaturedCompany> getFeaturedCompany() {
    return companyService.getFeaturedCompany();
  }

  Future<CompanyDetail> getCompanyDetail(String id) {
    return companyService.getCompanyDetail(id);
  }

  Future<CompanyPost> getCompanyPost(String id) {
    return companyService.getCompanyPost({"company_Id": id});
  }
}
