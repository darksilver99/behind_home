import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component_view/remark_stock_view/remark_stock_view_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'stock_form_view_widget.dart' show StockFormViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class StockFormViewModel extends FlutterFlowModel<StockFormViewWidget> {
  ///  Local state fields for this component.

  List<String> imageList = [];
  void addToImageList(String item) => imageList.add(item);
  void removeFromImageList(String item) => imageList.remove(item);
  void removeAtIndexFromImageList(int index) => imageList.removeAt(index);
  void insertAtIndexInImageList(int index, String item) =>
      imageList.insert(index, item);
  void updateImageListAtIndex(int index, Function(String) updateFn) =>
      imageList[index] = updateFn(imageList[index]);

  List<FFUploadedFile> tmpImageList = [];
  void addToTmpImageList(FFUploadedFile item) => tmpImageList.add(item);
  void removeFromTmpImageList(FFUploadedFile item) => tmpImageList.remove(item);
  void removeAtIndexFromTmpImageList(int index) => tmpImageList.removeAt(index);
  void insertAtIndexInTmpImageList(int index, FFUploadedFile item) =>
      tmpImageList.insert(index, item);
  void updateTmpImageListAtIndex(
          int index, Function(FFUploadedFile) updateFn) =>
      tmpImageList[index] = updateFn(tmpImageList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for contactAddress widget.
  FocusNode? contactAddressFocusNode;
  TextEditingController? contactAddressTextController;
  String? Function(BuildContext, String?)?
      contactAddressTextControllerValidator;
  String? _contactAddressTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  // Stores action output result for [Action Block - deleteImageBlock] action in Icon widget.
  bool? isDelete;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));

  // Stores action output result for [Action Block - checkImageLimit] action in Button widget.
  bool? isNotlimit;
  // Stores action output result for [Action Block - validateFileSizeAndExt] action in Button widget.
  bool? isValid;
  // Stores action output result for [Custom Action - uploadImageToFirebase] action in Button widget.
  List<String>? urlList;
  // State field(s) for detail widget.
  FocusNode? detailFocusNode;
  TextEditingController? detailTextController;
  String? Function(BuildContext, String?)? detailTextControllerValidator;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? remarkText;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  StockListRecord? stockResult2;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  List<ResidentListRecord>? residentDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  StockListRecord? stockResult;

  @override
  void initState(BuildContext context) {
    contactAddressTextControllerValidator =
        _contactAddressTextControllerValidator;
  }

  @override
  void dispose() {
    contactAddressFocusNode?.dispose();
    contactAddressTextController?.dispose();

    detailFocusNode?.dispose();
    detailTextController?.dispose();
  }
}
