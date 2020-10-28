import 'package:flutter_football_app/models/team_standing.dart';
import 'package:json_annotation/json_annotation.dart';

part 'standing.g.dart';

@JsonSerializable(explicitToJson: true)
class Standing {
  String stage;
  String type;
  String group;
  List<TeamStanding> table;


  Standing(this.stage, this.type, this.group, this.table);

  factory Standing.fromJson(Map<String, dynamic> json) =>
      _$StandingFromJson(json);

  Map<String, dynamic> toJson() => _$StandingToJson(this);
}