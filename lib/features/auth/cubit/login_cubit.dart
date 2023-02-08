import 'package:bloc/bloc.dart';
import 'package:bloc_sample/features/auth/model/request/auth_request.dart';
import 'package:bloc_sample/features/auth/repo/auth_repo.dart';
import 'package:bloc_sample/service/api_state.dart';
import 'package:dio/dio.dart';

class LoginCubit extends Cubit<APIState> {
  final AuthRepo _repo;

  LoginCubit(this._repo) : super(AppEventInitial());

  void login(AuthRequest request) async {
    try {
      emit(APILoading());
      final response = await _repo.login(request);
      emit(APILoaded(response));
    } on DioError catch (ex) {
      emit(APIStateFailure(ex.toString()));
    }
  }
}
