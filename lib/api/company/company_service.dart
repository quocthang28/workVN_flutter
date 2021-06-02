import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:workvn/model/company/featured_company/FeaturedCompany.dart';

part 'company_service.g.dart';

@RestApi()
abstract class CompanyService {
  factory CompanyService(Dio dio) = _CompanyService;

  @GET("/company/featured-company")
  Future<FeaturedCompany> getFeaturedCompany();
}