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

Future<List<NewsListRecord>> filterNewsList(
  String keyword,
  List<NewsListRecord> dataList,
) async {
  // Add your function code here!
  String lowerCaseKeyword = keyword.toLowerCase();
  List<NewsListRecord> newsSearchedList = dataList.where((doc) {
    return doc.subject.toLowerCase().contains(lowerCaseKeyword) ||
        doc.detail.toLowerCase().contains(lowerCaseKeyword);
  }).toList();
  return newsSearchedList;
}
