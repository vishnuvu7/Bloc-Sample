import 'dart:convert';

import 'package:bloc_sample/data/endpoint/api_endpoints.dart';
import 'package:bloc_sample/data/model/enums/http_types.dart';
import 'package:bloc_sample/features/anime/model/resposne/anime_response.dart';
import 'package:bloc_sample/features/anime/repo/anime_repository.dart';
import 'package:bloc_sample/service/api_provider.dart';

class AnimeRepo implements AnimeRepository {
  late ApiHelper _apiHelper;

  AnimeRepo(ApiHelper apiHelper) {
    _apiHelper = apiHelper;
  }

  @override
  Future<List<AnimeListResponse>> getAllAnime() async {
    final response = await _apiHelper.callApi(
      service: ApiEndPoints.getAnime,
      requestType: HttpRequestType.get,
      authRequired: false,
    );
    return animeListResponseFromJson(json.encode(response));
  }

  @override
  Future<AnimeListResponse> getAnimeByCharacter(String character) async {
    // TODO: implement getAnimeByCharacter
    throw UnimplementedError();
  }
}
