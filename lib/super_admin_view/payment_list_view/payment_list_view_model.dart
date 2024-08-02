import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component_view/drop_down_payment_status_view/drop_down_payment_status_view_widget.dart';
import '/component_view/no_data_view/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'payment_list_view_widget.dart' show PaymentListViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PaymentListViewModel extends FlutterFlowModel<PaymentListViewWidget> {
  ///  Local state fields for this component.

  List<PaymentListRecord> paymentList = [];
  void addToPaymentList(PaymentListRecord item) => paymentList.add(item);
  void removeFromPaymentList(PaymentListRecord item) =>
      paymentList.remove(item);
  void removeAtIndexFromPaymentList(int index) => paymentList.removeAt(index);
  void insertAtIndexInPaymentList(int index, PaymentListRecord item) =>
      paymentList.insert(index, item);
  void updatePaymentListAtIndex(
          int index, Function(PaymentListRecord) updateFn) =>
      paymentList[index] = updateFn(paymentList[index]);

  bool isLoading = true;

  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Firestore Query - Query a collection] action in PaymentListView widget.
  List<PaymentListRecord>? paymetListResult;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<PaymentListRecord>();
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Text widget.
  int? isUpdate;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
