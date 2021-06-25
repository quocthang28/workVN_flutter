import 'package:get/get.dart';
import 'package:workvn/api/job_type_service/job_type_service.dart';
import 'package:workvn/model/job_level/JobLevel.dart';
import 'package:workvn/model/job_type/JobType.dart';

class JobTypeController extends GetxController {
  JobTypeService _jobTypeService = Get.find();
  JobType jobType = JobType();
  JobLevel jobLevel = JobLevel();

  @override
  void onInit() {
    getJobTypes().then((value) => jobType = value);
    getJobLevels().then((value) => jobLevel = value);
    super.onInit();
  }

  Future<JobType> getJobTypes() {
    return _jobTypeService.getJobTypes();
  }

  Future<JobLevel> getJobLevels() {
    return _jobTypeService.getJobLevels();
  }
}
