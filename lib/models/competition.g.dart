// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'competition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Competition _$CompetitionFromJson(Map<String, dynamic> json) {
  return Competition(
    json['id'] as int,
    json['name'] as String,
    json['plan'] as String,
    json['code'] as String,
    json['lastUpdated'] as String,
    json['area'] == null
        ? null
        : Area.fromJson(json['area'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CompetitionToJson(Competition instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'plan': instance.plan,
      'code': instance.code,
      'lastUpdated': instance.lastUpdated,
      'area': instance.area?.toJson(),
    };
