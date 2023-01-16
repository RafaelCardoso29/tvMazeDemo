// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowModel _$ShowModelFromJson(Map<String, dynamic> json) => ShowModel(
      json['id'] as int?,
      json['url'] as String?,
      json['name'] as String?,
      (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
      ImageModelMapper.convertModelToString(
          json['image'] as Map<String, dynamic>),
      json['summary'] as String?,
      EpisodeModelMapper.convertToEpisodeList(
          json['_embedded'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShowModelToJson(ShowModel instance) => <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'name': instance.name,
      'genres': instance.genres,
      'image': instance.image,
      'summary': instance.summary,
      '_embedded': instance.episodes,
    };
