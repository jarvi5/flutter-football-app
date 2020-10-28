import 'package:flutter_football_app/models/competition.dart';

abstract class CompetitionsState {}

class CompetitionsInitial extends CompetitionsState {}

class CompetitionsLoadInProgress extends CompetitionsState {}

class CompetitionsLoadSuccess extends CompetitionsState {
  final List<Competition> competitions;

  CompetitionsLoadSuccess(this.competitions);
}

class CompetitionsLoadFailure extends CompetitionsState {
  final String errorMessage;

  CompetitionsLoadFailure(this.errorMessage);
}