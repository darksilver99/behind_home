// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

Future<List<String>> getParkChartDataList() async {
  // Add your function code here!

  DateTime now = DateTime.now();
  List<String> dates = [];
  DateFormat formatter = DateFormat('d/M');
  for (int i = 7; i >= 1; i--) {
    DateTime day = now.subtract(Duration(days: i));
    dates.add(formatter.format(day));
  }
  return dates;
}
