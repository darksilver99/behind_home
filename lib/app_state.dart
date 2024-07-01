import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      if (prefs.containsKey('ff_projectData')) {
        try {
          final serializedData = prefs.getString('ff_projectData') ?? '{}';
          _projectData =
              ProjectDataStruct.fromSerializableMap(jsonDecode(serializedData));
        } catch (e) {
          print("Can't decode persisted data type. Error: $e.");
        }
      }
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  ProjectDataStruct _projectData = ProjectDataStruct();
  ProjectDataStruct get projectData => _projectData;
  set projectData(ProjectDataStruct value) {
    _projectData = value;
    prefs.setString('ff_projectData', value.serialize());
  }

  void updateProjectDataStruct(Function(ProjectDataStruct) updateFn) {
    updateFn(_projectData);
    prefs.setString('ff_projectData', _projectData.serialize());
  }

  ConfigDataStruct _configData = ConfigDataStruct();
  ConfigDataStruct get configData => _configData;
  set configData(ConfigDataStruct value) {
    _configData = value;
  }

  void updateConfigDataStruct(Function(ConfigDataStruct) updateFn) {
    updateFn(_configData);
  }

  MenuDataStruct _menuData = MenuDataStruct();
  MenuDataStruct get menuData => _menuData;
  set menuData(MenuDataStruct value) {
    _menuData = value;
  }

  void updateMenuDataStruct(Function(MenuDataStruct) updateFn) {
    updateFn(_menuData);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
