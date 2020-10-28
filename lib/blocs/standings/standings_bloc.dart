import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_football_app/blocs/standings/standings_events.dart';
import 'package:flutter_football_app/blocs/standings/standings_states.dart';
import 'package:flutter_football_app/services/football_repository.dart';

class StandingsBloc extends Bloc<StandingsEvent, StandingsState> {
  final FootballRepository _footballRepository;

  StandingsBloc(this._footballRepository) : super(StandingsInitial());

  @override
  Stream<StandingsState> mapEventToState(StandingsEvent event) async* {
    if (event is StandingsLoadStarted) {
      yield StandingsLoadInProgress();
      try {
        var standings = await _footballRepository.getCompetitionStandings(event.id);
        yield StandingsLoadSuccess(standings.keys.first, standings.values.first);
      } catch (exception) {
        yield StandingsLoadFailure(exception.toString());
      }
    }
  }
}