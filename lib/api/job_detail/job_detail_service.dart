import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:workvn/model/job_detail/HotCategories/HotCategories.dart';
import 'package:workvn/model/job_detail/all_categories/AllCategories.dart';

part 'job_detail_service.g.dart';

@RestApi()
abstract class JobDetailService {
  factory JobDetailService(Dio dio) = _JobDetailService;

  @GET("/job-detail/hot-category/job-post")
  Future<HotCategories> getHotCategories();

  @GET("/job-detail/all")
  Future<AllCategories> getAllCategories();
}
