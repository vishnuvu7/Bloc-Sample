import 'package:bloc_sample/features/auth/model/request/auth_request.dart';
import 'package:bloc_sample/features/auth/model/response/auth_response.dart';

abstract class IAuthRepo{

  Future<AuthResponse> login(AuthRequest request);

  void register(String name,String username, String password);

  void forgotPassword(String username);
}