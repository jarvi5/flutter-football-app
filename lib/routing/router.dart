import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_football_app/blocs/areas/areas_bloc.dart';
import 'package:flutter_football_app/blocs/competitions/competitions_bloc.dart';
import 'package:flutter_football_app/blocs/standings/standings_bloc.dart';
import 'package:flutter_football_app/pages/competition_page.dart';
import 'package:flutter_football_app/pages/home_page.dart';
import 'package:flutter_football_app/routing/routes.dart';
import 'package:flutter_football_app/extensions.dart';
import 'package:flutter_football_app/services/football_repository.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var routingData = settings.name.getRoutingData;

  switch (routingData.route) {
    case homeRoute:
      return _getPageRoute(
          MultiBlocProvider(providers: [
            BlocProvider<AreasBloc>(
              create: (context) =>
                  AreasBloc(RepositoryProvider.of<FootballRepository>(context)),
            ),
            BlocProvider<CompetitionsBloc>(
              create: (context) => CompetitionsBloc(
                  RepositoryProvider.of<FootballRepository>(context)),
            ),
          ], child: HomePage()),
          settings);
    case competitionRoute:
      var id = int.tryParse(routingData['id']);
      return _getPageRoute(
          BlocProvider<StandingsBloc>(
              create: (BuildContext context) => StandingsBloc(
                  RepositoryProvider.of<FootballRepository>(context)),
              child: CompetitionPage(id: id)),
          settings);
    default:
      return _getPageRoute(
          Center(
            child: Text('Page not found'),
          ),
          settings);
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return MaterialPageRoute(
      settings: settings, builder: (BuildContext context) => child);
}
