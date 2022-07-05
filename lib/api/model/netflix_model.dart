import 'package:json_annotation/json_annotation.dart';

part 'netflix_model.g.dart';

@JsonSerializable()
class NetflixModel {
  @JsonKey(name: "title")
  String title;

  @JsonKey(name: "poster_path")
  String image;

  @JsonKey(name: "overview")
  String overview;

  @JsonKey(name: "release_date")
  String releaseDate;

  NetflixModel({
    required this.title,
    required this.image,
    required this.overview,
    required this.releaseDate,
  });
}
