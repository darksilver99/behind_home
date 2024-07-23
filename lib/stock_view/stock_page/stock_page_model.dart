import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component_view/loading_view/loading_view_widget.dart';
import '/component_view/menu_toggle_view/menu_toggle_view_widget.dart';
import '/component_view/menu_view/menu_view_widget.dart';
import '/component_view/no_data_view/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/stock_view/stock_form_view/stock_form_view_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'stock_page_widget.dart' show StockPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class StockPageModel extends FlutterFlowModel<StockPageWidget> {
  ///  Local state fields for this page.

  List<StockListRecord> dataList = [];
  void addToDataList(StockListRecord item) => dataList.add(item);
  void removeFromDataList(StockListRecord item) => dataList.remove(item);
  void removeAtIndexFromDataList(int index) => dataList.removeAt(index);
  void insertAtIndexInDataList(int index, StockListRecord item) =>
      dataList.insert(index, item);
  void updateDataListAtIndex(int index, Function(StockListRecord) updateFn) =>
      dataList[index] = updateFn(dataList[index]);

  DateTime? startDate;

  DateTime? endDate;

  List<StockListRecord> tmpDataList = [];
  void addToTmpDataList(StockListRecord item) => tmpDataList.add(item);
  void removeFromTmpDataList(StockListRecord item) => tmpDataList.remove(item);
  void removeAtIndexFromTmpDataList(int index) => tmpDataList.removeAt(index);
  void insertAtIndexInTmpDataList(int index, StockListRecord item) =>
      tmpDataList.insert(index, item);
  void updateTmpDataListAtIndex(
          int index, Function(StockListRecord) updateFn) =>
      tmpDataList[index] = updateFn(tmpDataList[index]);

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in StockPage widget.
  List<StockListRecord>? dataResult;
  // State field(s) for DropDown widget.
  String? dropDownValue1;
  FormFieldController<String>? dropDownValueController1;
  // State field(s) for DropDown widget.
  String? dropDownValue2;
  FormFieldController<String>? dropDownValueController2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<StockListRecord>? dataResult2;
  // Stores action output result for [Bottom Sheet - StockFormView] action in Button widget.
  String? isUpdate2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<StockListRecord>? dataResult5;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - filterDataList] action in TextField widget.
  List<StockListRecord>? dataResult3;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<StockListRecord>();
  // Model for MenuToggleView component.
  late MenuToggleViewModel menuToggleViewModel;
  // Model for LoadingView component.
  late LoadingViewModel loadingViewModel;
  // Model for menuView component.
  late MenuViewModel menuViewModel;

  @override
  void initState(BuildContext context) {
    menuToggleViewModel = createModel(context, () => MenuToggleViewModel());
    loadingViewModel = createModel(context, () => LoadingViewModel());
    menuViewModel = createModel(context, () => MenuViewModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();

    menuToggleViewModel.dispose();
    loadingViewModel.dispose();
    menuViewModel.dispose();
  }
}
