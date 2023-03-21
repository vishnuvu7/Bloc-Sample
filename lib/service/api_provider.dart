import 'dart:async';
import 'dart:io';

import 'package:bloc_sample/data/model/enums/http_types.dart';
import 'package:bloc_sample/service/api_client.dart';
import 'package:bloc_sample/service/api_endpoints.dart';
import 'package:bloc_sample/service/network_exception.dart';
import 'package:bloc_sample/storage/hive_manager.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ApiHelper {
  late ApiClient apiClient;

  ApiHelper(this.apiClient);

  Future<dynamic> callApi(
      {required String service,
      required HttpRequestType requestType,
      required bool authRequired,
      CustomBaseUrls? url,
      Map<String, dynamic>? params,
      Map<String, dynamic>? data}) async {
    Options options = Options(contentType: Headers.jsonContentType, method: requestType.stringValue);
    Box box = Hive.box(HiveManager.blocBox);
    final dio = apiClient.getDioClient();

    if (authRequired) {
      final token = await box.get(HiveManager.accessToken);
      dio.options.headers["Authorization"] = "Bearer $token";
      //dio.options.headers["Authorization"] = "JWT " + token;
    }

    dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions reqOptions, RequestInterceptorHandler handler) async {
      if (authRequired) {
        String token = box.get(HiveManager.accessToken) ?? '';
        dio.options.headers["Authorization"] = "Bearer $token";
      }
      return handler.next(reqOptions);
    }, onError: (DioError error, ErrorInterceptorHandler handler) async {
      if (error.response == null) {
        return;
      }
      if (error.response!.statusCode == 401) {
        var res = await refreshToken();
        if (res) {
          var response = await callApi(
              service: service, requestType: requestType, authRequired: authRequired, data: data, params: params, url: url);
          return handler.resolve(response);
        }
      }
    }));
    if(url != null){
      dio.options.baseUrl = url.url;
    }
    try {
      final response = await dio.request(service, options: options, queryParameters: params, data: data);
      return _returnResponse(response);
    } on TimeoutException catch (_) {
      throw TimeOutException(null);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
  }

  dynamic _returnResponse(Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        return response.data;
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.toString());
      case 404:
        throw BadRequestException('Not found');
      case 500:
      default:
        throw FetchDataException('Error occurred while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }

  Future<dynamic> sendFile(String url, File file) async {
    Dio dio = apiClient.getDioClient();
    final fileName = file.path.split("/").last;
    FormData formData = FormData.fromMap({
      "file": await MultipartFile.fromFile(file.path, filename: fileName),
    });
    return await dio.post(ApiEndPoints.fileURL, data: formData);
  }

  Future<bool> refreshToken() async {
    try {
      final dio = apiClient.getDioClient();
      //TODO: Implement refresh Token API
      if (kDebugMode) {
        print("::Refresh Token Called");
      }
      return true;
    } on DioError catch (ex) {
      if (kDebugMode) {
        print(ex);
      }
      return false;
    }
  }
}
