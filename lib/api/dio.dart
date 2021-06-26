import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioModule {
  DioModule();

  Dio? _dio;

  Dio get dio {
    if (_dio != null) {
      return _dio!;
    }

    print('**** Dio created');
    BaseOptions options = new BaseOptions(
      //baseUrl: 'http://10.0.2.2:1337/',
      //baseUrl: 'http://192.168.1.101:1337' // local address
      //baseUrl: 'https://testingservices321.azurewebsites.net' //cloud
      baseUrl: 'https://workrecruitment.azurewebsites.net',
    );

    _dio = Dio(options);

    _dio!.interceptors.add(PrettyDioLogger(
        request: true,
        requestBody: false,
        responseBody: false,
        requestHeader: false));

    return _dio!;
  }
}
