import 'dart:convert';

List<AnimeListResponse> animeListResponseFromJson(String str) => List<AnimeListResponse>.from(json.decode(str).map((x) => AnimeListResponse.fromJson(x)));

String animeListResponseToJson(List<AnimeListResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AnimeListResponse {
  AnimeListResponse({
    required this.anime,
    required this.character,
    required this.quote,
  });

  String anime;
  String character;
  String quote;

  factory AnimeListResponse.fromJson(Map<String, dynamic> json) => AnimeListResponse(
    anime: json["anime"],
    character: json["character"],
    quote: json["quote"],
  );

  Map<String, dynamic> toJson() => {
    "anime": anime,
    "character": character,
    "quote": quote,
  };
}
