import 'package:flutter_football_app/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'area.g.dart';

@JsonSerializable(explicitToJson: true)
class Area extends BaseModel{
  String countryCode;
  int parentAreaId;
  String parentArea;
  List<Area> childAreas;

  Area(int id, String name, this.countryCode, this.parentAreaId, this.parentArea, this.childAreas) : super(id, name);

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);

  Map<String, dynamic> toJson() => _$AreaToJson(this);
}
