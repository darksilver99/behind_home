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
import 'payment_page_widget.dart' show PaymentPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class PaymentPageModel extends FlutterFlowModel<PaymentPageWidget> {
  ///  Local state fields for this page.

  List<FFUploadedFile> tmpSlipImage = [];
  void addToTmpSlipImage(FFUploadedFile item) => tmpSlipImage.add(item);
  void removeFromTmpSlipImage(FFUploadedFile item) => tmpSlipImage.remove(item);
  void removeAtIndexFromTmpSlipImage(int index) => tmpSlipImage.removeAt(index);
  void insertAtIndexInTmpSlipImage(int index, FFUploadedFile item) =>
      tmpSlipImage.insert(index, item);
  void updateTmpSlipImageAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      tmpSlipImage[index] = updateFn(tmpSlipImage[index]);

  List<String> urlImageList = [];
  void addToUrlImageList(String item) => urlImageList.add(item);
  void removeFromUrlImageList(String item) => urlImageList.remove(item);
  void removeAtIndexFromUrlImageList(int index) => urlImageList.removeAt(index);
  void insertAtIndexInUrlImageList(int index, String item) =>
      urlImageList.insert(index, item);
  void updateUrlImageListAtIndex(int index, Function(String) updateFn) =>
      urlImageList[index] = updateFn(urlImageList[index]);

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Action Block - validateFileSizeAndExt] action in Button widget.
  bool? isValide;
  // Stores action output result for [Custom Action - uploadImageToFirebase] action in Button widget.
  List<String>? urlList;
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
