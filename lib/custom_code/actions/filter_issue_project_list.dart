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

Future<List<IssueProjectListRecord>> filterIssueProjectList(
  String keyword,
  List<IssueProjectListRecord> dataList,
) async {
  // Add your function code here!
  String lowerCaseKeyword = keyword.toLowerCase();
  List<IssueProjectListRecord> issueSearchedList = dataList.where((doc) {
    return doc.subject.contains(lowerCaseKeyword) ||
        doc.detail.toLowerCase().contains(lowerCaseKeyword) ||
        doc.contactAddress.toLowerCase().contains(lowerCaseKeyword);
  }).toList();
  return issueSearchedList;
}
