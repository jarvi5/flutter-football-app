import 'package:bloc/bloc.dart';
import 'package:flutter_football_app/blocs/competitions/competitions_events.dart';
import 'package:flutter_football_app/blocs/competitions/competitions_states.dart';
import 'package:flutter_football_app/services/football_repository.dart';

class CompetitionsBloc extends Bloc<CompetitionsEvent, CompetitionsState> {
  final FootballRepository _footballRepository;

  CompetitionsBloc(this._footballRepository) : super(CompetitionsInitial());

  @override
  Stream<CompetitionsState> mapEventToState(CompetitionsEvent event) async* {
    if (event is CompetitionsLoadStarted) {
      yield CompetitionsLoadInProgress();
      try {
        var competitions =
            await _footballRepository.getCompetitionsByArea(event.areaId);
        yield CompetitionsLoadSuccess(competitions);
      } catch (exception) {
        yield CompetitionsLoadFailure(exception.toString());
      }
    }
  }
}
