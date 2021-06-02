import 'package:get/get.dart';
import 'package:workvn/api/recruitment_post/recruitment_post_service.dart';
import 'package:workvn/model/recruitment_post/recommended_post/RecommendedPost.dart';

class RecruitmentPostController extends GetxController {
  RecruitmentPostService recruitmentPostService = Get.find();

  Future<RecommendedPost> getRecommendedPost() {
    return recruitmentPostService.getRecommendedPost();
  }
}
