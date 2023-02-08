import 'package:bloc_sample/features/add_anime/model/add_anime_model.dart';

abstract class AddAnimeRepo {
  void addAnime(String name, String character);

  void removeAnime(AddAnimeModel anime);
}
