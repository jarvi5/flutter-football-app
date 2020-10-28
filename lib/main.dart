import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_football_app/localization/app_localizations.dart';
import 'package:flutter_football_app/locator.dart';
import 'package:flutter_football_app/routing/router.dart';
import 'package:flutter_football_app/routing/routes.dart';
import 'package:flutter_football_app/services/football_repository.dart';
import 'package:flutter_football_app/services/navigation_service.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => FootballRepository(),
      child: MaterialApp(
        title: 'Football App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        supportedLocales: [Locale('en', 'US'), Locale('es', 'BO')],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        navigatorKey: locator<NavigationService>().navigatorKey,
        onGenerateRoute: generateRoute,
        initialRoute: homeRoute,
      ),
    );
  }
}
