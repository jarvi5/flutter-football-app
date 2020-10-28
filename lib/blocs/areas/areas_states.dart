import 'package:flutter_football_app/models/area.dart';

abstract class AreasState {}

class AreasInitial extends AreasState {}

class AreasLoadInProgress extends AreasState {}

class AreasLoadSuccess extends AreasState {
  final List<Area> areas;

  AreasLoadSuccess(this.areas);
}

class AreasLoadFailure extends AreasState {}
