import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:workvn/model/benefits/Benefits.dart';
import 'package:workvn/model/salary_range/SalaryRange.dart';

part 'salary_range_service.g.dart';

@RestApi()
abstract class SalaryRangeService {
  factory SalaryRangeService(Dio dio) = _SalaryRangeService;

  @GET("/salary-range/all")
  Future<SalaryRange> getSalaryRange();
}
