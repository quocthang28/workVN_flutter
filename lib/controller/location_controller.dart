import 'package:get/get.dart';
import 'package:location/location.dart';
import 'package:workvn/api/location/location_service.dart';
import 'package:workvn/model/location/LocationModel.dart';

const kApiKey = 'f8fbd9a7ea1b15aa0ee743c9ecd994f2';

class LocationController extends GetxController {
  LocationService _locationService = Get.find();
  Location _location = Location();
  late LocationData locationData;
  String locationName = '';

  @override
  void onInit() {
    getLocation().then((value) => getLocationName(
            locationData.latitude.toString(), locationData.longitude.toString())
        .then((value) => locationName = value.name!));
    super.onInit();
  }

  Future getLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    locationData = await _location.getLocation();
  }

  Future<LocationModel> getLocationName(String lat, String lon) {
    return _locationService.getLocation(lat, lon, kApiKey, 'metric');
  }
}
