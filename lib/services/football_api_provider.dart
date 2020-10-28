import 'dart:convert';
import 'package:flutter_football_app/models/area.dart';
import 'package:flutter_football_app/models/competition.dart';
import 'package:flutter_football_app/models/standing.dart';
import 'package:http/http.dart' as http;

class FootballApiProvider {
  final String baseUrl = 'https://api.football-data.org/v2';
  final Map<String, String> headers = {
    'X-Auth-Token': 'a2d9ec78e2ab471f8047739032568cc0'
  };

  Future<List<Area>> getWorldAreas() async {
    var response = await http.get('$baseUrl/areas/2267', headers: headers);
    var json = jsonDecode(response.body);
    return Area.fromJson(json).childAreas;
  }

  Future<List<Competition>> getCompetitionsByArea(int areaId) async {
    var response =
        await http.get('$baseUrl/competitions?areas=$areaId', headers: headers);
    var json = jsonDecode(response.body);
    List<dynamic> competitionsJsonList = json['competitions'];
    return competitionsJsonList
        .map((competitionJson) => competitionJson == null
            ? null
            : Competition.fromJson(competitionJson))
        .toList();
  }

  Future<Map<String, List<Standing>>> getCompetitionStandings(int id) async {
    var response = await http.get(
        '$baseUrl/competitions/$id/standings?standingType=TOTAL',
        headers: headers);
    var json = jsonDecode(response.body);
    List<dynamic> standingsJsonList = json['standings'];
    var competition = Competition.fromJson(json['competition']);
    var standings = standingsJsonList
        .map((standingJson) =>
            standingJson == null ? null : Standing.fromJson(standingJson))
        .toList();
    return {competition.name: standings};
  }
}
