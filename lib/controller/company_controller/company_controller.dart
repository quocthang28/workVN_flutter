import 'package:get/get.dart';
import 'package:workvn/api/company/company_service.dart';
import 'package:workvn/model/company/featured_company/FeaturedCompany.dart';

class CompanyController extends GetxController {
  CompanyService companyService = Get.find();

  Future<FeaturedCompany> getFeaturedCompany() {
    return companyService.getFeaturedCompany();
  }
}
