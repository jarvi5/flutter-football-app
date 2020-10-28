import 'package:flutter_football_app/models/competition.dart';
import 'package:flutter_football_app/models/standing.dart';
import 'package:flutter_football_app/models/team_standing.dart';

abstract class StandingsState {}

class StandingsInitial extends StandingsState {}

class StandingsLoadInProgress extends StandingsState {}

class StandingsLoadSuccess extends StandingsState {
  final String competition;
  final List<Standing> standings;

  StandingsLoadSuccess(this.competition, this.standings);
}

class StandingsLoadFailure extends StandingsState {
  final String errorMessage;

  StandingsLoadFailure(this.errorMessage);
}