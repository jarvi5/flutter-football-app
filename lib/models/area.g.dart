// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Area _$AreaFromJson(Map<String, dynamic> json) {
  return Area(
    json['id'] as int,
    json['name'] as String,
    json['countryCode'] as String,
    json['parentAreaId'] as int,
    json['parentArea'] as String,
    (json['childAreas'] as List)
        ?.map(
            (e) => e == null ? null : Area.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'countryCode': instance.countryCode,
      'parentAreaId': instance.parentAreaId,
      'parentArea': instance.parentArea,
      'childAreas': instance.childAreas?.map((e) => e?.toJson())?.toList(),
    };
