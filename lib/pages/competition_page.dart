import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_football_app/blocs/standings/standings_bloc.dart';
import 'package:flutter_football_app/blocs/standings/standings_events.dart';
import 'package:flutter_football_app/blocs/standings/standings_states.dart';
import 'package:flutter_football_app/localization/app_localizations.dart';
import 'package:flutter_football_app/models/standing.dart';

class CompetitionPage extends StatefulWidget {
  final int id;

  const CompetitionPage({this.id});

  @override
  _CompetitionPageState createState() => _CompetitionPageState();
}

class _CompetitionPageState extends State<CompetitionPage> {
  void initState() {
    BlocProvider.of<StandingsBloc>(context)
        .add(StandingsLoadStarted(widget.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('competition_label')),
      ),
      body: BlocBuilder<StandingsBloc, StandingsState>(
        builder: (context, state) {
          if (state is StandingsLoadInProgress) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is StandingsLoadSuccess) {
            return Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      state.competition != null ? state.competition : '',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Expanded(child: _getStandingsList(state.standings)),
              ],
            );
          }
          if (state is StandingsLoadFailure) {
            return Center(child: Text('${AppLocalizations.of(context).translate('error_loading')} ${AppLocalizations.of(context).translate('standings_label')}'));
          }
          return Container();
        },
      ),
    );
  }

  ListView _getStandingsList(List<Standing> standings) {
    if (standings[0].group == null) {
      return ListView.separated(
        itemBuilder: (context, index) => ListTile(
          leading: Image.network(standings[0].table[index].team.crestUrl),
          title: Text(
              '${standings[0].table[index].position}. ${standings[0].table[index].team.name}'),
          subtitle: Text(
              'PT: ${standings[0].table[index].points} W: ${standings[0].table[index].won} L: ${standings[0].table[index].lost} D: ${standings[0].table[index].draw}'),
          onTap: () {},
        ),
        separatorBuilder: (context, index) => Divider(),
        itemCount: standings[0].table.length,
      );
    } else {
      return ListView(
        children: _generateGroupedList(standings),
      );
    }
  }

  List<Widget> _generateGroupedList(List<Standing> standings) {
    List<Widget> list = [];
    standings.forEach((standing) {
      list.add(Text(
        '${standing.group}',
        style: TextStyle(fontWeight: FontWeight.bold),
      ));
      standing.table.forEach((teamStanding) {
        list.add(ListTile(
          leading: Image.network(teamStanding.team.crestUrl),
          title: Text('${teamStanding.position}. ${teamStanding.team.name}'),
          subtitle: Text(
              'PT: ${teamStanding.points} W: ${teamStanding.won} L: ${teamStanding.lost} D: ${teamStanding.draw}'),
          onTap: () {},
        ));
      });
    });
    return list;
  }
}
