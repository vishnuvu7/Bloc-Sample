import 'package:bloc_sample/features/anime/model/resposne/anime_response.dart';

abstract class AnimeRepository {

  Future<List<AnimeListResponse>> getAllAnime();

  Future<AnimeListResponse> getAnimeByCharacter(String character);
}
