import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:workvn/model/job_level/JobLevel.dart';
import 'package:workvn/model/job_type/JobType.dart';

part 'job_type_service.g.dart';

@RestApi()
abstract class JobTypeService {
  factory JobTypeService(Dio dio) = _JobTypeService;

  @GET("/job-type/all")
  Future<JobType> getJobTypes();

  @GET("/job-level/all")
  Future<JobLevel> getJobLevels();
}
