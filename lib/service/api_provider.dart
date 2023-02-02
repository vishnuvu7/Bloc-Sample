import 'dart:async';
import 'dart:io';

import 'package:bloc_sample/data/endpoint/api_endpoints.dart';
import 'package:bloc_sample/data/model/enums/http_types.dart';
import 'package:bloc_sample/service/api_client.dart';
import 'package:bloc_sample/service/hive_manager.dart';
import 'package:bloc_sample/service/network_exception.dart';
import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ApiHelper {
  late ApiClient apiClient;

  ApiHelper(this.apiClient);

  Future<dynamic> callApi(
      {required String service,
      required HttpRequestType requestType,
      required bool authRequired,
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
}
