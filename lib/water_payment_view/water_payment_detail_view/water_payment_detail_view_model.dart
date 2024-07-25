import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'water_payment_detail_view_widget.dart'
    show WaterPaymentDetailViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class WaterPaymentDetailViewModel
    extends FlutterFlowModel<WaterPaymentDetailViewWidget> {
  ///  Local state fields for this component.

  List<DataStatusStruct> tmpWaterPaymentStatusList = [];
  void addToTmpWaterPaymentStatusList(DataStatusStruct item) =>
      tmpWaterPaymentStatusList.add(item);
  void removeFromTmpWaterPaymentStatusList(DataStatusStruct item) =>
      tmpWaterPaymentStatusList.remove(item);
  void removeAtIndexFromTmpWaterPaymentStatusList(int index) =>
      tmpWaterPaymentStatusList.removeAt(index);
  void insertAtIndexInTmpWaterPaymentStatusList(
          int index, DataStatusStruct item) =>
      tmpWaterPaymentStatusList.insert(index, item);
  void updateTmpWaterPaymentStatusListAtIndex(
          int index, Function(DataStatusStruct) updateFn) =>
      tmpWaterPaymentStatusList[index] =
          updateFn(tmpWaterPaymentStatusList[index]);

  bool showRemarkNotComplete = false;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for remark widget.
  FocusNode? remarkFocusNode;
  TextEditingController? remarkTextController;
  String? Function(BuildContext, String?)? remarkTextControllerValidator;
  String? _remarkTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;

  @override
  void initState(BuildContext context) {
    remarkTextControllerValidator = _remarkTextControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    remarkFocusNode?.dispose();
    remarkTextController?.dispose();
  }
}