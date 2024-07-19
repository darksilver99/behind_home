import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'issue_detail_view_widget.dart' show IssueDetailViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class IssueDetailViewModel extends FlutterFlowModel<IssueDetailViewWidget> {
  ///  Local state fields for this component.

  List<IssueStatusDataStruct> tmpIssueStatusList = [];
  void addToTmpIssueStatusList(IssueStatusDataStruct item) =>
      tmpIssueStatusList.add(item);
  void removeFromTmpIssueStatusList(IssueStatusDataStruct item) =>
      tmpIssueStatusList.remove(item);
  void removeAtIndexFromTmpIssueStatusList(int index) =>
      tmpIssueStatusList.removeAt(index);
  void insertAtIndexInTmpIssueStatusList(
          int index, IssueStatusDataStruct item) =>
      tmpIssueStatusList.insert(index, item);
  void updateTmpIssueStatusListAtIndex(
          int index, Function(IssueStatusDataStruct) updateFn) =>
      tmpIssueStatusList[index] = updateFn(tmpIssueStatusList[index]);

  ///  State fields for stateful widgets in this component.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
