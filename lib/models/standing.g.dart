// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'standing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Standing _$StandingFromJson(Map<String, dynamic> json) {
  return Standing(
    json['stage'] as String,
    json['type'] as String,
    json['group'] as String,
    (json['table'] as List)
        ?.map((e) =>
            e == null ? null : TeamStanding.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$StandingToJson(Standing instance) => <String, dynamic>{
      'stage': instance.stage,
      'type': instance.type,
      'group': instance.group,
      'table': instance.table?.map((e) => e?.toJson())?.toList(),
    };
