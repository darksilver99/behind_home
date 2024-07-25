import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/component_view/menu_toggle_view/menu_toggle_view_widget.dart';
import '/component_view/menu_view/menu_view_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import 'water_payment_setting_page_widget.dart'
    show WaterPaymentSettingPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
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

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

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
