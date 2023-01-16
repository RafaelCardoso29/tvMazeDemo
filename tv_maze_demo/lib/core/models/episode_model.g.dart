// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) => EpisodeModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: ApiConverter.convertModelToString(
          json['image'] as Map<String, dynamic>),
      summary: json['summary'] as String?,
      season: json['season'] as int?,
      number: json['number'] as int?,
      runtime: json['runtime'] as int?,
    );

Map<String, dynamic> _$EpisodeModelToJson(EpisodeModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'summary': instance.summary,
      'season': instance.season,
      'number': instance.number,
      'runtime': instance.runtime,
    };
