abstract class StandingsEvent {}

class StandingsLoadStarted extends StandingsEvent {
  final int id;

  StandingsLoadStarted(this.id);
}