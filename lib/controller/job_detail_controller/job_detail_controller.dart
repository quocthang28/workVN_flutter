import 'package:get/get.dart';
import 'package:workvn/api/job_detail/job_detail_service.dart';
import 'package:workvn/model/job_detail/HotCategories/HotCategories.dart';
import 'package:workvn/model/job_detail/all_categories/AllCategories.dart';

class JobDetailController extends GetxController {
  JobDetailService jobDetailService = Get.find();
  AllCategories allCategories = AllCategories();

  @override
  void onInit() {
    getAllCategories().then((value) => allCategories = value);
    super.onInit();
  }

  Future<HotCategories> getHotCategories() {
    return jobDetailService.getHotCategories();
  }

  Future<AllCategories> getAllCategories() {
    return jobDetailService.getAllCategories();
  }
}
