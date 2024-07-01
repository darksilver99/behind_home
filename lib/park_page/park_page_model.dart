import '/component_view/menu_toggle_view/menu_toggle_view_widget.dart';
import '/component_view/menu_view/menu_view_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'park_page_widget.dart' show ParkPageWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ParkPageModel extends FlutterFlowModel<ParkPageWidget> {
  ///  Local state fields for this page.

  List<String> testList = ['Hello World', 'Hello World', 'Hello World'];
  void addToTestList(String item) => testList.add(item);
  void removeFromTestList(String item) => testList.remove(item);
  void removeAtIndexFromTestList(int index) => testList.removeAt(index);
  void insertAtIndexInTestList(int index, String item) =>
      testList.insert(index, item);
  void updateTestListAtIndex(int index, Function(String) updateFn) =>
      testList[index] = updateFn(testList[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for PaginatedDataTable widget.
  final paginatedDataTableController = FlutterFlowDataTableController<String>();
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
