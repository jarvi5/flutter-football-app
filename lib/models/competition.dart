import 'package:flutter_football_app/models/area.dart';
import 'package:json_annotation/json_annotation.dart';
import 'base_model.dart';

part 'competition.g.dart';

@JsonSerializable(explicitToJson: true)
class Competition extends BaseModel {
  String plan;
  String code;
  String lastUpdated;
  Area area;

  Competition(
      int id, String name, this.plan, this.code, this.lastUpdated, this.area)
      : super(id, name);

  factory Competition.fromJson(Map<String, dynamic> json) =>
      _$CompetitionFromJson(json);

  Map<String, dynamic> toJson() => _$CompetitionToJson(this);
}
