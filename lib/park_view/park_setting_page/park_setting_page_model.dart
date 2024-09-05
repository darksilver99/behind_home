import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/component_view/edit_text_view/edit_text_view_widget.dart';
import '/component_view/menu_toggle_view/menu_toggle_view_widget.dart';
import '/component_view/menu_view/menu_view_widget.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/upload_data.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'park_setting_page_widget.dart' show ParkSettingPageWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ParkSettingPageModel extends FlutterFlowModel<ParkSettingPageWidget> {
  ///  Local state fields for this page.

  List<String> carList = [];
  void addToCarList(String item) => carList.add(item);
  void removeFromCarList(String item) => carList.remove(item);
  void removeAtIndexFromCarList(int index) => carList.removeAt(index);
  void insertAtIndexInCarList(int index, String item) =>
      carList.insert(index, item);
  void updateCarListAtIndex(int index, Function(String) updateFn) =>
      carList[index] = updateFn(carList[index]);

  List<String> objectiveList = [];
  void addToObjectiveList(String item) => objectiveList.add(item);
  void removeFromObjectiveList(String item) => objectiveList.remove(item);
  void removeAtIndexFromObjectiveList(int index) =>
      objectiveList.removeAt(index);
  void insertAtIndexInObjectiveList(int index, String item) =>
      objectiveList.insert(index, item);
  void updateObjectiveListAtIndex(int index, Function(String) updateFn) =>
      objectiveList[index] = updateFn(objectiveList[index]);

  List<String> stampList = [];
  void addToStampList(String item) => stampList.add(item);
  void removeFromStampList(String item) => stampList.remove(item);
  void removeAtIndexFromStampList(int index) => stampList.removeAt(index);
  void insertAtIndexInStampList(int index, String item) =>
      stampList.insert(index, item);
  void updateStampListAtIndex(int index, Function(String) updateFn) =>
      stampList[index] = updateFn(stampList[index]);

  String? stampFieldName;

  String? logo;

  String? moreDetailField;

  String? moreImageField;

  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for Switch widget.
  bool? switchValue;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Text widget.
  String? moreDetailFieldResult;
  // State field(s) for moreDetailSwitch widget.
  bool? moreDetailSwitchValue;
  // Stores action output result for [Alert Dialog - Custom Dialog] action in Text widget.
  String? moreImageFieldResult;
  // State field(s) for moreImageSwitch widget.
  bool? moreImageSwitchValue;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for carTypeValue widget.
  FocusNode? carTypeValueFocusNode;
  TextEditingController? carTypeValueTextController;
  String? Function(BuildContext, String?)? carTypeValueTextControllerValidator;
  // State field(s) for carList widget.
  FormFieldController<List<String>>? carListValueController;
  String? get carListValue => carListValueController?.value?.firstOrNull;
  set carListValue(String? val) =>
      carListValueController?.value = val != null ? [val] : [];
  // State field(s) for objectiveValue widget.
  FocusNode? objectiveValueFocusNode;
  TextEditingController? objectiveValueTextController;
  String? Function(BuildContext, String?)?
      objectiveValueTextControllerValidator;
  // State field(s) for objectiveList widget.
  FormFieldController<List<String>>? objectiveListValueController;
  String? get objectiveListValue =>
      objectiveListValueController?.value?.firstOrNull;
  set objectiveListValue(String? val) =>
      objectiveListValueController?.value = val != null ? [val] : [];
  // State field(s) for stampValue widget.
  FocusNode? stampValueFocusNode;
  TextEditingController? stampValueTextController;
  String? Function(BuildContext, String?)? stampValueTextControllerValidator;
  // State field(s) for stampList widget.
  FormFieldController<List<String>>? stampListValueController;
  String? get stampListValue => stampListValueController?.value?.firstOrNull;
  set stampListValue(String? val) =>
      stampListValueController?.value = val != null ? [val] : [];
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
    textFieldFocusNode?.dispose();
    textController1?.dispose();

    carTypeValueFocusNode?.dispose();
    carTypeValueTextController?.dispose();

    objectiveValueFocusNode?.dispose();
    objectiveValueTextController?.dispose();

    stampValueFocusNode?.dispose();
    stampValueTextController?.dispose();

    menuToggleViewModel.dispose();
    menuViewModel.dispose();
  }
}
