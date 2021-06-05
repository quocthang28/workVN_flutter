import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:workvn/model/benefits/Benefits.dart';

part 'benefits_service.g.dart';

@RestApi()
abstract class BenefitsService {
  factory BenefitsService(Dio dio) = _BenefitsService;

  @GET("/benefits/all")
  Future<Benefits> getBenefits();
}
