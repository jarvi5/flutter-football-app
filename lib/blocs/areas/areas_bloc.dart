import 'package:bloc/bloc.dart';
import 'package:flutter_football_app/blocs/areas/areas_events.dart';
import 'package:flutter_football_app/blocs/areas/areas_states.dart';
import 'package:flutter_football_app/services/football_repository.dart';

class AreasBloc extends Bloc<AreasEvent, AreasState> {
  final FootballRepository footballRepository;

  AreasBloc(this.footballRepository) : super(AreasInitial());

  @override
  Stream<AreasState> mapEventToState(AreasEvent event) async* {
    if (event is AreasLoadStarted) {
      yield AreasLoadInProgress();
      try {
        var areas = await footballRepository.getWorldAreas();
        yield AreasLoadSuccess(areas);
      } catch (exception) {
        yield AreasLoadFailure();
      }
    }
  }
}
