import 'package:bloc_sample/service/api_endpoints.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';
import 'package:flutter_pretty_dio_logger/flutter_pretty_dio_logger.dart';


class ApiClient {
  Dio getDioClient() {
    late String baseUrl;
    if (kDebugMode) {
      baseUrl = CustomBaseUrls.animeUrl.url;
    } else {
      baseUrl = CustomBaseUrls.animeUrl.url;
    }
    var options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    );

    final dio = Dio(options);
    dio.options.contentType = Headers.jsonContentType;
    dio.options.responseType = ResponseType.json;
    if (kDebugMode) {
      dio.interceptors.add(PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        error: true,
        canShowLog: true,
        convertFormData: false,
        showProcessingTime: true,
        showCUrl: false,
        responseBody: true,
        responseHeader: true
      ));
    }
    return dio;
  }
}
