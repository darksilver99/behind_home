import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component_view/loading_view/loading_view_widget.dart';
import '/component_view/menu_toggle_view/menu_toggle_view_widget.dart';
import '/component_view/menu_view/menu_view_widget.dart';
import '/component_view/no_data_view/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/phone_project_view/phone_project_form_view/phone_project_form_view_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'phone_project_page_widget.dart' show PhoneProjectPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PhoneProjectPageModel extends FlutterFlowModel<PhoneProjectPageWidget> {
  ///  Local state fields for this page.

  List<PhoneProjectListRecord> dataList = [];
  void addToDataList(PhoneProjectListRecord item) => dataList.add(item);
  void removeFromDataList(PhoneProjectListRecord item) => dataList.remove(item);
  void removeAtIndexFromDataList(int index) => dataList.removeAt(index);
  void insertAtIndexInDataList(int index, PhoneProjectListRecord item) =>
      dataList.insert(index, item);
  void updateDataListAtIndex(
          int index, Function(PhoneProjectListRecord) updateFn) =>
      dataList[index] = updateFn(dataList[index]);

  List<PhoneProjectListRecord> tmpDataList = [];
  void addToTmpDataList(PhoneProjectListRecord item) => tmpDataList.add(item);
  void removeFromTmpDataList(PhoneProjectListRecord item) =>
      tmpDataList.remove(item);
  void removeAtIndexFromTmpDataList(int index) => tmpDataList.removeAt(index);
  void insertAtIndexInTmpDataList(int index, PhoneProjectListRecord item) =>
      tmpDataList.insert(index, item);
  void updateTmpDataListAtIndex(
          int index, Function(PhoneProjectListRecord) updateFn) =>
      tmpDataList[index] = updateFn(tmpDataList[index]);

  bool isLoading = true;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in PhoneProjectPage widget.
  List<PhoneProjectListRecord>? dataResult;
  // Stores action output result for [Bottom Sheet - PhoneProjectFormView] action in Button widget.
  String? isUpdate2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<PhoneProjectListRecord>? dataResult5;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - filterPhoneProjecetList] action in TextField widget.
  List<PhoneProjectListRecord>? dataResult3;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<PhoneProjectListRecord>();
  // Stores action output result for [Bottom Sheet - PhoneProjectFormView] action in Column widget.
  String? isUpdate;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<PhoneProjectListRecord>? dataResult4;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<PhoneProjectListRecord>? dataResult6;
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
