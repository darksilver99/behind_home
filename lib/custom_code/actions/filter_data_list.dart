// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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
  List<TransactionListRecord> transactionSearchedList = dataList.where((doc) {
    return doc.carRegistration.contains(keyword) ||
        doc.carRegistrationProvince.contains(keyword) ||
        doc.carType.contains(keyword) ||
        doc.firstName.contains(keyword) ||
        doc.lastName.contains(keyword);
  }).toList();
  return transactionSearchedList;
}