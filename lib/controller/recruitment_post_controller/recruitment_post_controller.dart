import 'package:get/get.dart';
import 'package:workvn/api/recruitment_post/recruitment_post_service.dart';
import 'package:workvn/model/nearby_post/NearbyPost.dart';
import 'package:workvn/model/post_detail/PostDetail.dart';
import 'package:workvn/model/recruitment_post/recommended_post/RecommendedPost.dart';
import 'package:workvn/model/recruitment_post/similar_jobs/SimilarJobs.dart';
import 'package:workvn/model/recruitment_post/top_view_post/TopViewPosts.dart';

class RecruitmentPostController extends GetxController {
  RecruitmentPostService recruitmentPostService = Get.find();

  Future<RecommendedPost> getRecommendedPost() {
    return recruitmentPostService.getRecommendedPost();
  }

  Future<PostDetail> getPostDetail(String postID) {
    return recruitmentPostService.getPostDetail(postID);
  }

  Future<SimilarJobs> getSimilarJobs(Map<String, dynamic> map) {
    return recruitmentPostService.getSimilarJobs(map);
  }

  Future<TopViewPosts> getTopViewPosts(Map<String, dynamic> map) {
    return recruitmentPostService.getTopViewPosts(map);
  }

  Future<NearbyPost> getNearbyPosts(
      String lng, String lat, String text, Map<String, dynamic> map) {
    return recruitmentPostService.getNearbyPost(lng, lat, text, map);
  }
}
