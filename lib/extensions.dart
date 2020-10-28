import 'package:flutter_football_app/models/routing_data.dart';

extension StringExtension on String {
  RoutingData get getRoutingData {
    var uriData = Uri.parse(this);
    return  RoutingData(route: uriData.path, queryParameters: uriData.queryParameters);
  }
}