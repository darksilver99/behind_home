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

import '/backend/firebase_storage/storage.dart';
import 'package:flutter/services.dart';

Future<List<String>> uploadFileToFirebase(
  List<FFUploadedFile>? fileList,
  String path,
) async {
  // Add your function code here!
  List<String> urlList = [];
  if (fileList == null) {
    return urlList;
  }
  for (var i = 0; i < fileList.length; i++) {
    String tmpPath = '$path/${fileList[i].name}';
    var url = await uploadData(tmpPath, fileList[i].bytes!);
    if (url != null) {
      urlList.add(url);
    }
  }
  return urlList;
}
