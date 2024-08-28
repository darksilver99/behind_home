import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/super_admin_view/payment_list_view/payment_list_view_widget.dart';
import '/super_admin_view/project_detail_view/project_detail_view_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'select_project_page_widget.dart' show SelectProjectPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SelectProjectPageModel extends FlutterFlowModel<SelectProjectPageWidget> {
  ///  Local state fields for this page.

  bool isLoading = true;

  List<ProjectListRecord> projectList = [];
  void addToProjectList(ProjectListRecord item) => projectList.add(item);
  void removeFromProjectList(ProjectListRecord item) =>
      projectList.remove(item);
  void removeAtIndexFromProjectList(int index) => projectList.removeAt(index);
  void insertAtIndexInProjectList(int index, ProjectListRecord item) =>
      projectList.insert(index, item);
  void updateProjectListAtIndex(
          int index, Function(ProjectListRecord) updateFn) =>
      projectList[index] = updateFn(projectList[index]);

  List<ProjectListRecord> tmpProjectList = [];
  void addToTmpProjectList(ProjectListRecord item) => tmpProjectList.add(item);
  void removeFromTmpProjectList(ProjectListRecord item) =>
      tmpProjectList.remove(item);
  void removeAtIndexFromTmpProjectList(int index) =>
      tmpProjectList.removeAt(index);
  void insertAtIndexInTmpProjectList(int index, ProjectListRecord item) =>
      tmpProjectList.insert(index, item);
  void updateTmpProjectListAtIndex(
          int index, Function(ProjectListRecord) updateFn) =>
      tmpProjectList[index] = updateFn(tmpProjectList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Firestore Query - Query a collection] action in SelectProjectPage widget.
  List<ProjectListRecord>? projectListResult;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // Stores action output result for [Custom Action - filterProjectList] action in TextField widget.
  List<ProjectListRecord>? projectListResult3;
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController =
      FlutterFlowDataTableController<ProjectListRecord>();
  // Stores action output result for [Bottom Sheet - ProjectDetailView] action in Column widget.
  String? isUpdate;
  // Stores action output result for [Firestore Query - Query a collection] action in Column widget.
  List<ProjectListRecord>? projectListResult2;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();

    paginatedDataTableController.dispose();
  }
}
