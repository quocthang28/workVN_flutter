import 'package:get/get.dart';
import 'package:workvn/api/location/location_service.dart';
import 'package:workvn/model/location/LocationModel.dart';

const kApiKey = 'f8fbd9a7ea1b15aa0ee743c9ecd994f2';

class LocationController extends GetxController {
  LocationService _locationService = Get.find();

  Future<LocationModel> getLocation(String lat, String lon) {
    return _locationService.getLocation(lat, lon, kApiKey, 'metric');
  }
}
