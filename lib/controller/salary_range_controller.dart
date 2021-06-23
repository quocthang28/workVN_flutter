import 'package:get/get.dart';
import 'package:workvn/api/salary_range/salary_range_service.dart';
import 'package:workvn/model/salary_range/SalaryRange.dart';

class SalaryRangeController extends GetxController {
  SalaryRangeService _salaryRangeService = Get.find();
  SalaryRange salaryRange = SalaryRange();

  @override
  void onInit() {
    getSalaryRange().then((value) => salaryRange = value);
    super.onInit();
  }

  Future<SalaryRange> getSalaryRange() {
    return _salaryRangeService.getSalaryRange();
  }
}
