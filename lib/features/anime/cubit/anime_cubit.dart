import 'package:bloc/bloc.dart';
import 'package:bloc_sample/features/anime/repo/anime_repo.dart';
import 'package:bloc_sample/service/api_state.dart';
import 'package:dio/dio.dart';


class AnimeCubit extends Cubit<APIState> {
  late AnimeRepo _repo;

  AnimeCubit(AnimeRepo repo) : super(AppEventInitial()) {
    _repo = repo;
    _getAllAnime();
  }

  void _getAllAnime() async {
    try {
      emit(APILoading());
      final response = await _repo.getAllAnime();
      emit(APILoaded(response));
    } on DioError catch (ex) {
      emit(APIStateFailure(ex.toString()));
    }
  }

  refreshApi(){
    _getAllAnime();
  }
}
