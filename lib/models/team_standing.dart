import 'package:flutter_football_app/models/team.dart';
import 'package:json_annotation/json_annotation.dart';

part 'team_standing.g.dart';

@JsonSerializable(explicitToJson: true)
class TeamStanding {
  int position;
  int playedGames;
  String form;
  int won;
  int draw;
  int lost;
  int points;
  int goalsFor;
  int goalsAgainst;
  int goalDifference;
  Team team;

  TeamStanding(
      this.position,
      this.playedGames,
      this.form,
      this.won,
      this.draw,
      this.lost,
      this.points,
      this.goalsFor,
      this.goalsAgainst,
      this.goalDifference,
      this.team);

  factory TeamStanding.fromJson(Map<String, dynamic> json) =>
      _$TeamStandingFromJson(json);

  Map<String, dynamic> toJson() => _$TeamStandingToJson(this);
}