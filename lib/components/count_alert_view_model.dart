import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'count_alert_view_widget.dart' show CountAlertViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CountAlertViewModel extends FlutterFlowModel<CountAlertViewWidget> {
  ///  Local state fields for this component.

  int totalAlert = 0;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in CountAlertView widget.
  int? total;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
