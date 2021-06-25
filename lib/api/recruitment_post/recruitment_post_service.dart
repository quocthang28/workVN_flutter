import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:workvn/model/home_search/HomeSearchPost.dart';
import 'package:workvn/model/nearby_post/NearbyPost.dart';
import 'package:workvn/model/post_detail/PostDetail.dart';
import 'package:workvn/model/recruitment_post/recommended_post/RecommendedPost.dart';
import 'package:workvn/model/recruitment_post/similar_jobs/SimilarJobs.dart';
import 'package:workvn/model/recruitment_post/top_view_post/TopViewPosts.dart';

part 'recruitment_post_service.g.dart';

@RestApi()
abstract class RecruitmentPostService {
  factory RecruitmentPostService(Dio dio) = _RecruitmentPostService;

  @GET("/recruitment-post/recommended-post")
  Future<RecommendedPost> getRecommendedPost();

  @GET("/recruitment-post/detail")
  Future<PostDetail> getPostDetail(@Query("post_id") String postID);

  @POST("/recruitment-post/similar-jobs")
  Future<SimilarJobs> getSimilarJobs(@Body() Map<String, dynamic> map);

  @POST("/recruitment-post/relevant-jobs")
  Future<TopViewPosts> getTopViewPosts(@Body() Map<String, dynamic> map);

  @POST("/recruitment-post/nearby")
  Future<NearbyPost> getNearbyPost(
      @Query("lng") String lng,
      @Query("lat") String lat,
      @Query("text_search") String textSearch,
      @Body() Map<String, dynamic> map);

  @POST("/recruitment-post/search")
  Future<HomeSearchPost> getHomeSearchPost(
      @Query("text_search") String textSearch,
      @Body() Map<String, dynamic> map);
}
