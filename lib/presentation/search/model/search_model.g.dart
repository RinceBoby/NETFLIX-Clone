// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchModel _$SearchModelFromJson(Map<String, dynamic> json) => SearchModel(
      title: json['title'] as String?,
      image: json['poster_path'] as String?,
      overview: json['overview'] as String?,
      releaseDate: json['release_date'] as String?,
    );

Map<String, dynamic> _$SearchModelToJson(SearchModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'poster_path': instance.image,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
    };
