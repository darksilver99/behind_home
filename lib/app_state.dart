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
    _safeInit(() {
      _currentDate = prefs.containsKey('ff_currentDate')
          ? DateTime.fromMillisecondsSinceEpoch(prefs.getInt('ff_currentDate')!)
          : _currentDate;
    });
    _safeInit(() {
      _isSkipExpireAlert =
          prefs.getBool('ff_isSkipExpireAlert') ?? _isSkipExpireAlert;
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

  DateTime? _currentDate = DateTime.fromMillisecondsSinceEpoch(1720501200000);
  DateTime? get currentDate => _currentDate;
  set currentDate(DateTime? value) {
    _currentDate = value;
    value != null
        ? prefs.setInt('ff_currentDate', value.millisecondsSinceEpoch)
        : prefs.remove('ff_currentDate');
  }

  bool _isSkipExpireAlert = false;
  bool get isSkipExpireAlert => _isSkipExpireAlert;
  set isSkipExpireAlert(bool value) {
    _isSkipExpireAlert = value;
    prefs.setBool('ff_isSkipExpireAlert', value);
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
