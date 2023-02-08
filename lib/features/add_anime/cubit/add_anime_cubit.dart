import 'package:bloc/bloc.dart';
import 'package:bloc_sample/features/add_anime/model/add_anime_model.dart';
import 'package:bloc_sample/features/add_anime/repo/add_anime_repo.dart';

class AddAnimeCubit extends Cubit<List<AddAnimeModel>> implements AddAnimeRepo {
  AddAnimeCubit() : super([]); //<--- Initial State

  @override
  void addAnime(String name, String character) {
    //you need to emit the [state] to rebuild the UI
    List<AddAnimeModel> animeList = [...state];
    animeList.add(AddAnimeModel(anime: name, character: character));
    emit(animeList);
  }

  @override
  void removeAnime(AddAnimeModel animeModel) {
    List<AddAnimeModel> animeList = [...state];
    animeList.remove(animeModel);
    emit(animeList);
  }
}
