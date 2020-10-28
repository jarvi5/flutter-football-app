import 'package:flutter_football_app/models/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team.g.dart';

@JsonSerializable()
class Team extends BaseModel {
  String crestUrl;

  Team(int id, String name, this.crestUrl) : super(id, name);
  factory Team.fromJson(Map<String, dynamic> json) => _$TeamFromJson(json);

  Map<String, dynamic> toJson() => _$TeamToJson(this);
}
