import 'package:bloc_sample/data/endpoint/api_endpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:dio/dio.dart';


class ApiClient {
  Dio getDioClient() {
    late String baseUrl;
    if (kDebugMode) {
      baseUrl = ApiEndPoints.baseURL;
    } else {
      baseUrl = ApiEndPoints.baseURL;
    }
    var options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 20000,
      receiveTimeout: 20000,
    );

    final dio = Dio(options);
    dio.options.contentType = Headers.jsonContentType;
    dio.options.responseType = ResponseType.json;
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        error: true,
        request: true,
        responseBody: true,
        responseHeader: true
      ));
    }
    return dio;
  }
}
