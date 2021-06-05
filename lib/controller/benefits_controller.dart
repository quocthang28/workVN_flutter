import 'package:get/get.dart';
import 'package:workvn/api/benefits/benefits_service.dart';
import 'package:workvn/model/benefits/Benefits.dart';

class BenefitsController extends GetxController {
  BenefitsService benefitsService = Get.find();
  Benefits benefits = Benefits();

  @override
  void onInit() {
    getBenefits().then((value) => benefits = value);
    super.onInit();
  }

  Future<Benefits> getBenefits() {
    return benefitsService.getBenefits();
  }
}
