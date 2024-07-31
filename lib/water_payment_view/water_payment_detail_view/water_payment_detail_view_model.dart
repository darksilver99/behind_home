import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
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

  List<FFUploadedFile> tmpFileList = [];
  void addToTmpFileList(FFUploadedFile item) => tmpFileList.add(item);
  void removeFromTmpFileList(FFUploadedFile item) => tmpFileList.remove(item);
  void removeAtIndexFromTmpFileList(int index) => tmpFileList.removeAt(index);
  void insertAtIndexInTmpFileList(int index, FFUploadedFile item) =>
      tmpFileList.insert(index, item);
  void updateTmpFileListAtIndex(int index, Function(FFUploadedFile) updateFn) =>
      tmpFileList[index] = updateFn(tmpFileList[index]);

  int tmpDropDownValue = 1;

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for DropDown widget.
  int? dropDownValue;
  FormFieldController<int>? dropDownValueController;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

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

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  // Stores action output result for [Custom Action - uploadFileToFirebase] action in Button widget.
  List<String>? urlList;

  @override
  void initState(BuildContext context) {
    remarkTextControllerValidator = _remarkTextControllerValidator;
  }

  @override
  void dispose() {
    remarkFocusNode?.dispose();
    remarkTextController?.dispose();

    textFieldFocusNode?.dispose();
    textController2?.dispose();
  }
}
