// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'netflix_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NetflixModel _$NetflixModelFromJson(Map<String, dynamic> json) => NetflixModel(
      title: json['title'] as String,
      image: json['poster_path'] as String,
      overview: json['overview'] as String,
      releaseDate: json['release_date'] as String,
    );

Map<String, dynamic> _$NetflixModelToJson(NetflixModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'poster_path': instance.image,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
    };
