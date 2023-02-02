import 'dart:convert';

List<AnimeListDto> animeListDtoFromJson(String str) =>
    List<AnimeListDto>.from(json.decode(str).map((x) => AnimeListDto.fromJson(x)));

String animeListDtoToJson(List<AnimeListDto> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AnimeListDto {
  AnimeListDto({
    required this.anime,
    required this.character,
  });

  String anime;
  String character;

  AnimeListDto copyWith({
    required String anime,
    required String character,
  }) =>
      AnimeListDto(
        anime: anime,
        character: character,
      );

  factory AnimeListDto.fromJson(Map<String, dynamic> json) => AnimeListDto(
        anime: json["anime"],
        character: json["character"],
      );

  Map<String, dynamic> toJson() => {
        "anime": anime,
        "character": character,
      };
}
