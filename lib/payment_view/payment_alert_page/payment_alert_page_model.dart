import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component_view/menu_toggle_view/menu_toggle_view_widget.dart';
import '/component_view/menu_view/menu_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'payment_alert_page_widget.dart' show PaymentAlertPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentAlertPageModel extends FlutterFlowModel<PaymentAlertPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in PaymentAlertPage widget.
  ProjectListRecord? projectResult;
  // Model for MenuToggleView component.
  late MenuToggleViewModel menuToggleViewModel;
  // Model for menuView component.
  late MenuViewModel menuViewModel;

  @override
  void initState(BuildContext context) {
    menuToggleViewModel = createModel(context, () => MenuToggleViewModel());
    menuViewModel = createModel(context, () => MenuViewModel());
  }

  @override
  void dispose() {
    menuToggleViewModel.dispose();
    menuViewModel.dispose();
  }
}
