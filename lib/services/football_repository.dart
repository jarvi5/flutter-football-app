import 'package:flutter_football_app/models/area.dart';
import 'package:flutter_football_app/models/competition.dart';
import 'package:flutter_football_app/models/standing.dart';
import 'football_api_provider.dart';

class FootballRepository {
  final FootballApiProvider _footballApiProvider = FootballApiProvider();

  Future<List<Area>> getWorldAreas() => _footballApiProvider.getWorldAreas();

  Future<List<Competition>> getCompetitionsByArea(int areaId) => _footballApiProvider.getCompetitionsByArea(areaId);

  Future<Map<String, List<Standing>>> getCompetitionStandings(int id) => _footballApiProvider.getCompetitionStandings(id);
}