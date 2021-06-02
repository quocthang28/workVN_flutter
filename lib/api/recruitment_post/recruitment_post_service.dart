import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:workvn/model/job_detail/HotCategories/HotCategories.dart';
import 'package:workvn/model/recruitment_post/recommended_post/RecommendedPost.dart';

part 'recruitment_post_service.g.dart';

@RestApi()
abstract class RecruitmentPostService {
  factory RecruitmentPostService(Dio dio) = _RecruitmentPostService;

  @GET("/recruitment-post/recommended-post")
  Future<RecommendedPost> getRecommendedPost();
}
