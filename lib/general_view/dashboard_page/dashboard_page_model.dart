import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component_view/menu_toggle_view/menu_toggle_view_widget.dart';
import '/component_view/menu_view/menu_view_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
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

  List<String> dateList = ['1/7', '2/7', '3/7', '4/7', '5/7', '6/7', '7/7'];
  void addToDateList(String item) => dateList.add(item);
  void removeFromDateList(String item) => dateList.remove(item);
  void removeAtIndexFromDateList(int index) => dateList.removeAt(index);
  void insertAtIndexInDateList(int index, String item) =>
      dateList.insert(index, item);
  void updateDateListAtIndex(int index, Function(String) updateFn) =>
      dateList[index] = updateFn(dateList[index]);

  List<int> valueList = [120, 150, 200, 250, 100, 80, 90];
  void addToValueList(int item) => valueList.add(item);
  void removeFromValueList(int item) => valueList.remove(item);
  void removeAtIndexFromValueList(int index) => valueList.removeAt(index);
  void insertAtIndexInValueList(int index, int item) =>
      valueList.insert(index, item);
  void updateValueListAtIndex(int index, Function(int) updateFn) =>
      valueList[index] = updateFn(valueList[index]);

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Firestore Query - Query a collection] action in DashboardPage widget.
  ProjectListRecord? projectResult;
  // Stores action output result for [Custom Action - getParkChartDataList] action in DashboardPage widget.
  List<String>? parkChartDataList;
  // Stores action output result for [Custom Action - getParkChartValueList] action in DashboardPage widget.
  List<int>? parkChartValueList;
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
