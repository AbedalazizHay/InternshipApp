import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class Dioclient {
  Dio getInstamsce(){
  Dio dio = Dio (
    BaseOptions(
      baseUrl: 'https://registrationpage-production-6978.up.railway.app/api/',
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 3),
      contentType: Headers.jsonContentType,
      responseType: ResponseType.json,
    ),
    );
    dio.interceptors.add(PrettyDioLogger(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
      compact: true,
      maxWidth: 90,
    ));
    return dio;
}
}