import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_football_app/blocs/competitions/competitions_bloc.dart';
import 'package:flutter_football_app/blocs/competitions/competitions_states.dart';
import 'package:flutter_football_app/localization/app_localizations.dart';
import 'package:flutter_football_app/locator.dart';
import 'package:flutter_football_app/routing/routes.dart';
import 'package:flutter_football_app/services/navigation_service.dart';

class CompetitionsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CompetitionsBloc, CompetitionsState>(
      builder: (context, state) {
        if (state is CompetitionsLoadInProgress) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CompetitionsLoadSuccess) {
          return ListView.separated(
            itemBuilder: (context, index) => ListTile(
              title: Text(state.competitions[index].name),
              subtitle: Text(state.competitions[index].area.name),
              onTap: () {
                locator<NavigationService>().navigateTo(competitionRoute,
                    queryParameters: {
                      'id': state.competitions[index].id.toString()
                    });
              },
            ),
            separatorBuilder: (context, index) => Divider(),
            itemCount: state.competitions.length,
          );
        }
        if (state is CompetitionsLoadFailure) {
          return Center(child: Text('${AppLocalizations.of(context).translate('error_loading')} ${AppLocalizations.of(context).translate('competitions_label')}'));
        }
        return Center(child: Text(AppLocalizations.of(context).translate('select_area_message')));
      },
    );
  }
}
