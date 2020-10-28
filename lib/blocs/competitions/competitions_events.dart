abstract class CompetitionsEvent {}

class CompetitionsLoadStarted extends CompetitionsEvent {
  final int areaId;

  CompetitionsLoadStarted(this.areaId);
}