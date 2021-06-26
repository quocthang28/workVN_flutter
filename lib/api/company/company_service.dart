import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:workvn/model/company/company_detail/CompanyDetail.dart';
import 'package:workvn/model/company/featured_company/FeaturedCompany.dart';
import 'package:workvn/model/company_post/CompanyPost.dart';

part 'company_service.g.dart';

@RestApi()
abstract class CompanyService {
  factory CompanyService(Dio dio) = _CompanyService;

  @GET("/company/featured-company")
  Future<FeaturedCompany> getFeaturedCompany();

  @GET("/company/detail")
  Future<CompanyDetail> getCompanyDetail(@Query("company_id") String companyID);

  @POST("/company/job-posts")
  Future<CompanyPost> getCompanyPost(@Body() Map<String, dynamic> map);
}
