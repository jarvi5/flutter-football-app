import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_football_app/blocs/areas/areas_bloc.dart';
import 'package:flutter_football_app/blocs/areas/areas_events.dart';
import 'package:flutter_football_app/localization/app_localizations.dart';
import 'package:flutter_football_app/models/area.dart';
import 'package:flutter_football_app/widgets/areas_list.dart';
import 'package:flutter_football_app/widgets/competitions_list.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  Area selectedArea;

  @override
  void initState() {
    BlocProvider.of<AreasBloc>(context).add(AreasLoadStarted());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).translate('app_title')),
      ),
      body: Column(
        children: [
          AreasList(onAreaSelected: (area) {
            setState(() {
              selectedArea = area;
            });
          }),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                selectedArea != null ? selectedArea.name : '',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Expanded(
              child: CompetitionsList()
          ),
        ],
      ),
    );
  }
}
