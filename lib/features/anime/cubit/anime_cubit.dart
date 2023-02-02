import 'package:bloc/bloc.dart';
import 'package:bloc_sample/features/anime/repo/anime_repo.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

part 'anime_state.dart';

class AnimeCubit extends Cubit<AnimeState> {
  late AnimeRepo _repo;

  AnimeCubit(AnimeRepo repo) : super(AnimeInitial()) {
    _repo = repo;
    _getAllAnime();
  }

  void _getAllAnime() async {
    try {
      emit(AnimeLoading());
      final response = await _repo.getAllAnime();
      emit(AnimeLoaded(response));
    } on DioError catch (ex) {
      emit(AnimeStateFailure(ex.toString()));
    }
  }

  refreshApi(){
    _getAllAnime();
  }
}
