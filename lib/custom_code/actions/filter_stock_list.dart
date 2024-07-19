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

Future<List<StockListRecord>> filterStockList(
  String keyword,
  List<StockListRecord> dataList,
) async {
  // Add your function code here!
  List<StockListRecord> stockSearchedList = dataList.where((doc) {
    return doc.contactAddress.contains(keyword) ||
        doc.stockNumber.contains(keyword);
  }).toList();
  return stockSearchedList;
}
