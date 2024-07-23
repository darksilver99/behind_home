import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/component_view/remark_stock_view/remark_stock_view_widget.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'stock_form_view_widget.dart' show StockFormViewWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:firebase_storage/firebase_storage.dart';
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

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for detail widget.
  FocusNode? detailFocusNode;
  TextEditingController? detailTextController;
  String? Function(BuildContext, String?)? detailTextControllerValidator;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  ResidentListRecord? residentDoc;
  // Stores action output result for [Firestore Query - Query a collection] action in Button widget.
  StockListRecord? stockResult;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Button widget.
  String? remarkText;

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
