import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component_view/menu_toggle_view/menu_toggle_view_widget.dart';
import '/component_view/menu_view/menu_view_widget.dart';
import '/component_view/no_data_view/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'park_page_widget.dart' show ParkPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ParkPageModel extends FlutterFlowModel<ParkPageWidget> {
  ///  Local state fields for this page.

  List<TransactionListRecord> dataList = [];
  void addToDataList(TransactionListRecord item) => dataList.add(item);
  void removeFromDataList(TransactionListRecord item) => dataList.remove(item);
  void removeAtIndexFromDataList(int index) => dataList.removeAt(index);
  void insertAtIndexInDataList(int index, TransactionListRecord item) =>
      dataList.insert(index, item);
  void updateDataListAtIndex(
          int index, Function(TransactionListRecord) updateFn) =>
      dataList[index] = updateFn(dataList[index]);

  DateTime? startDate;

  DateTime? endDate;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in ParkPage widget.
  List<TransactionListRecord>? dataResult;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<TransactionListRecord>? dataResult2;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<TransactionListRecord>();
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
    unfocusNode.dispose();
    menuToggleViewModel.dispose();
    menuViewModel.dispose();
  }
}
