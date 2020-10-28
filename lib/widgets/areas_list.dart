import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_football_app/blocs/areas/areas_bloc.dart';
import 'package:flutter_football_app/blocs/areas/areas_states.dart';
import 'package:flutter_football_app/blocs/competitions/competitions_bloc.dart';
import 'package:flutter_football_app/blocs/competitions/competitions_events.dart';
import 'package:flutter_football_app/localization/app_localizations.dart';
import 'package:flutter_football_app/models/area.dart';

class AreasList extends StatelessWidget {
  final Function(Area) onAreaSelected;

  const AreasList({this.onAreaSelected});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AreasBloc, AreasState>(
      builder: (context, state) {
        if (state is AreasLoadInProgress) {
          return Center(child: CircularProgressIndicator());
        } else if (state is AreasLoadSuccess) {
          return Container(
              height: 50,
              child: ListView.separated(
                addAutomaticKeepAlives: false,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    onAreaSelected(state.areas[index]);
                    BlocProvider.of<CompetitionsBloc>(context).add(
                      CompetitionsLoadStarted(state.areas[index].id),
                    );
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(state.areas[index].name),
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => SizedBox(width: 2),
                itemCount: state.areas.length,
              ));
        } else if (state is AreasLoadFailure) {
          return Center(
            child: Text(
                '${AppLocalizations.of(context).translate('error_loading')} ${AppLocalizations.of(context).translate('areas_label')}'),
          );
        }
        return Container();
      },
    );
  }
}
