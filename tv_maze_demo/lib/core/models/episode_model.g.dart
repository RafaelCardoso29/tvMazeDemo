// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episode_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EpisodeModel _$EpisodeModelFromJson(Map<String, dynamic> json) => EpisodeModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: ApiConverter.convertModelToString(
          json['image'] as Map<String, dynamic>?),
      summary: json['summary'] as String?,
      season: json['season'] as int?,
      number: json['number'] as int?,
      runtime: json['runtime'] as int?,
    );

Map<String, dynamic> _$EpisodeModelToJson(EpisodeModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('image', instance.image);
  val['summary'] = instance.summary;
  val['season'] = instance.season;
  val['number'] = instance.number;
  val['runtime'] = instance.runtime;
  return val;
}
