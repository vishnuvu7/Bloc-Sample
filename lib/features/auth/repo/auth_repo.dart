import 'dart:convert';

import 'package:bloc_sample/data/model/enums/http_types.dart';
import 'package:bloc_sample/features/auth/model/request/auth_request.dart';
import 'package:bloc_sample/features/auth/model/response/auth_response.dart';
import 'package:bloc_sample/features/auth/repo/IAuth_repo.dart';
import 'package:bloc_sample/service/api_endpoints.dart';
import 'package:bloc_sample/service/api_provider.dart';

class AuthRepo extends IAuthRepo{
  final ApiHelper _apiHelper;
  AuthRepo(this._apiHelper);

  @override
  Future<AuthResponse> login(AuthRequest request)async {
    final response = await _apiHelper.callApi(
      url: CustomBaseUrls.authUrl,
      service: ApiEndPoints.login,
      requestType: HttpRequestType.post,
      authRequired: false,
      data: request.toJson()
    );
    return authResponseFromJson(json.encode(response));
  }

  @override
  void forgotPassword(String username) {
    // TODO: implement forgotPassword
  }

  @override
  void register(String name, String username, String password) {
    // TODO: implement register
  }

}