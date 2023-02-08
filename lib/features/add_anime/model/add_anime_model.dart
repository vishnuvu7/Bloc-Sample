import 'dart:convert';

List<AddAnimeModel> addAnimeModelFromJson(String str) => List<AddAnimeModel>.from(json.decode(str).map((x) => AddAnimeModel.fromJson(x)));

String addAnimeModelToJson(List<AddAnimeModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class AddAnimeModel {
  AddAnimeModel({
    required this.anime,
    required this.character,
  });

  String anime;
  String character;

  factory AddAnimeModel.fromJson(Map<String, dynamic> json) => AddAnimeModel(
    anime: json["anime"],
    character: json["character"],
  );

  Map<String, dynamic> toJson() => {
    "anime": anime,
    "character": character,
  };
}
