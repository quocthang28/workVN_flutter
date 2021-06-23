import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:workvn/model/location/LocationModel.dart';

part 'location_service.g.dart';

const kBaseUrl = "https://api.openweathermap.org";

@RestApi(baseUrl: kBaseUrl)
abstract class LocationService {
  factory LocationService(Dio _dio, {String baseUrl}) = _LocationService;

  @GET("/data/2.5/weather")
  Future<LocationModel> getLocation(
      @Query("lat") String lat,
      @Query("lon") String lon,
      @Query("appid") String apiKey,
      @Query("units") String metric);
}
