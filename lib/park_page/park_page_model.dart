import '/component_view/menu_toggle_view/menu_toggle_view_widget.dart';
import '/component_view/menu_view/menu_view_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'park_page_widget.dart' show ParkPageWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ParkPageModel extends FlutterFlowModel<ParkPageWidget> {
  ///  Local state fields for this page.

  List<dynamic> dataList = [];
  void addToDataList(dynamic item) => dataList.add(item);
  void removeFromDataList(dynamic item) => dataList.remove(item);
  void removeAtIndexFromDataList(int index) => dataList.removeAt(index);
  void insertAtIndexInDataList(int index, dynamic item) =>
      dataList.insert(index, item);
  void updateDataListAtIndex(int index, Function(dynamic) updateFn) =>
      dataList[index] = updateFn(dataList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Custom Action - getDataList] action in ParkPage widget.
  List<dynamic>? dataResult;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<dynamic>();
  // Stores action output result for [Custom Action - getDataList] action in PaginatedDataTable widget.
  List<dynamic>? nextDataList;
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
