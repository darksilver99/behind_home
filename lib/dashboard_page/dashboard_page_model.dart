import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component_view/menu_toggle_view/menu_toggle_view_widget.dart';
import '/component_view/menu_view/menu_view_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'dashboard_page_widget.dart' show DashboardPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DashboardPageModel extends FlutterFlowModel<DashboardPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  List<String> dateList = [
    'วันที่ 1',
    'วันที่ 2',
    'วันที่ 3',
    'วันที่ 4',
    'วันที่ 5',
    'วันที่ 6',
    'วันที่ 7'
  ];
  void addToDateList(String item) => dateList.add(item);
  void removeFromDateList(String item) => dateList.remove(item);
  void removeAtIndexFromDateList(int index) => dateList.removeAt(index);
  void insertAtIndexInDateList(int index, String item) =>
      dateList.insert(index, item);
  void updateDateListAtIndex(int index, Function(String) updateFn) =>
      dateList[index] = updateFn(dateList[index]);

  List<int> valueList = [1, 3, 5, 7, 3, 2, 0];
  void addToValueList(int item) => valueList.add(item);
  void removeFromValueList(int item) => valueList.remove(item);
  void removeAtIndexFromValueList(int index) => valueList.removeAt(index);
  void insertAtIndexInValueList(int index, int item) =>
      valueList.insert(index, item);
  void updateValueListAtIndex(int index, Function(int) updateFn) =>
      valueList[index] = updateFn(valueList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in DashboardPage widget.
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
    unfocusNode.dispose();
    menuToggleViewModel.dispose();
    menuViewModel.dispose();
  }
}
