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

Future<List<int>> getParkChartValueList() async {
  // Add your function code here!

  // get day before
  DateTime now = DateTime.now();
  List<DateTime> days = [];
  for (int i = 7; i >= 1; i--) {
    DateTime day = now.subtract(Duration(days: i));
    days.add(day);
  }

  //get value
  List<int> value = [];
  for (DateTime day in days) {
    DateTime startOfDay = DateTime(day.year, day.month, day.day);
    DateTime endOfDay = startOfDay.add(Duration(days: 1));

    QuerySnapshot snapshot = await FirebaseFirestore.instance
        .collection(
            'project_list/${FFAppState().projectData.projectDocID}/transaction_list')
        .where('date_in', isGreaterThanOrEqualTo: startOfDay)
        .where('date_in', isLessThan: endOfDay)
        .get();
    value.add(snapshot.docs.length);
  }

  return value;
}
