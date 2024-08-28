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

Future<List<TransactionListRecord>> filterDataList(
  String keyword,
  List<TransactionListRecord> dataList,
) async {
  // Add your function code here!
  String lowerCaseKeyword = keyword.toLowerCase();
  List<TransactionListRecord> transactionSearchedList = dataList.where((doc) {
    return doc.carRegistration.toLowerCase().contains(lowerCaseKeyword) ||
        doc.carRegistrationProvince.toLowerCase().contains(lowerCaseKeyword) ||
        doc.carType.toLowerCase().contains(lowerCaseKeyword) ||
        doc.objective.toLowerCase().contains(lowerCaseKeyword) ||
        doc.stamp.toLowerCase().contains(lowerCaseKeyword) ||
        doc.transactionNumber.toLowerCase().contains(lowerCaseKeyword) ||
        doc.firstName.toLowerCase().contains(lowerCaseKeyword) ||
        doc.lastName.toLowerCase().contains(lowerCaseKeyword);
  }).toList();
  return transactionSearchedList;
}
