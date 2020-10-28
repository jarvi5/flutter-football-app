// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_standing.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamStanding _$TeamStandingFromJson(Map<String, dynamic> json) {
  return TeamStanding(
    json['position'] as int,
    json['playedGames'] as int,
    json['form'] as String,
    json['won'] as int,
    json['draw'] as int,
    json['lost'] as int,
    json['points'] as int,
    json['goalsFor'] as int,
    json['goalsAgainst'] as int,
    json['goalDifference'] as int,
    json['team'] == null
        ? null
        : Team.fromJson(json['team'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$TeamStandingToJson(TeamStanding instance) =>
    <String, dynamic>{
      'position': instance.position,
      'playedGames': instance.playedGames,
      'form': instance.form,
      'won': instance.won,
      'draw': instance.draw,
      'lost': instance.lost,
      'points': instance.points,
      'goalsFor': instance.goalsFor,
      'goalsAgainst': instance.goalsAgainst,
      'goalDifference': instance.goalDifference,
      'team': instance.team?.toJson(),
    };
