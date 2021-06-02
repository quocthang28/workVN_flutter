import 'package:get/get.dart';
import 'package:workvn/api/job_detail/job_detail_service.dart';
import 'package:workvn/model/job_detail/HotCategories/HotCategories.dart';

class JobDetailController extends GetxController {
  JobDetailService jobDetailService = Get.find();

  Future<HotCategories> getHotCategories() {
    return jobDetailService.getHotCategories();
  }
}
