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

Future<List<dynamic>> getDataList(
  dynamic lastDocument,
  String collectionName,
) async {
  // Add your function code here!
  print("getDataList");
  print("collectionName : $collectionName");

  DocumentSnapshot? lastDocumentSnapshot;
  if (lastDocument is DocumentSnapshot) {
    lastDocumentSnapshot = lastDocument;
  }
  Query query = FirebaseFirestore.instance
      .collection('project_list/${FFAppState().projectData.projectDocID}/$collectionName')
      .orderBy('create_date', descending: true)
      .limit(FFAppConstants.pageSize);

  if (lastDocumentSnapshot != null) {
    query = query.startAfterDocument(lastDocumentSnapshot);
  }

  QuerySnapshot querySnapshot = await query.get();
  if (querySnapshot.docs.isNotEmpty) {
    lastDocumentSnapshot = querySnapshot.docs.last;
  }

  print("querySnapshot.docs.length");
  print(querySnapshot.docs.length);
  print("lastDocumentSnapshot");
  print(lastDocumentSnapshot!.reference.path);

  return querySnapshot.docs;
}
