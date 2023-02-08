import 'package:bloc_sample/features/anime/model/response/anime_response.dart';

abstract class AnimeRepository {
  /// This is the repository pattern and
  /// it provides an abstraction of data
  Future<List<AnimeListResponse>> getAllAnime();

  Future<AnimeListResponse> getAnimeByCharacter(String character);

}

