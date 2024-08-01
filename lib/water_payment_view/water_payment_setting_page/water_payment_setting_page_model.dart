import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component_view/menu_toggle_view/menu_toggle_view_widget.dart';
import '/component_view/menu_view/menu_view_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import 'water_payment_setting_page_widget.dart'
    show WaterPaymentSettingPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class WaterPaymentSettingPageModel
    extends FlutterFlowModel<WaterPaymentSettingPageWidget> {
  ///  Local state fields for this page.

  List<String> imageWaterPaymentList = [];
  void addToImageWaterPaymentList(String item) =>
      imageWaterPaymentList.add(item);
  void removeFromImageWaterPaymentList(String item) =>
      imageWaterPaymentList.remove(item);
  void removeAtIndexFromImageWaterPaymentList(int index) =>
      imageWaterPaymentList.removeAt(index);
  void insertAtIndexInImageWaterPaymentList(int index, String item) =>
      imageWaterPaymentList.insert(index, item);
  void updateImageWaterPaymentListAtIndex(
          int index, Function(String) updateFn) =>
      imageWaterPaymentList[index] = updateFn(imageWaterPaymentList[index]);

  List<FFUploadedFile> tmpImageWaterPaymentList = [];
  void addToTmpImageWaterPaymentList(FFUploadedFile item) =>
      tmpImageWaterPaymentList.add(item);
  void removeFromTmpImageWaterPaymentList(FFUploadedFile item) =>
      tmpImageWaterPaymentList.remove(item);
  void removeAtIndexFromTmpImageWaterPaymentList(int index) =>
      tmpImageWaterPaymentList.removeAt(index);
  void insertAtIndexInTmpImageWaterPaymentList(
          int index, FFUploadedFile item) =>
      tmpImageWaterPaymentList.insert(index, item);
  void updateTmpImageWaterPaymentListAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      tmpImageWaterPaymentList[index] =
          updateFn(tmpImageWaterPaymentList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Stores action output result for [Action Block - deleteImageBlock] action in Icon widget.
  bool? isDelete;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Action Block - validateFileSizeAndExt] action in Button widget.
  bool? isValide;
  // Stores action output result for [Custom Action - uploadImageToFirebase] action in Button widget.
  List<String>? urlList;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
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
