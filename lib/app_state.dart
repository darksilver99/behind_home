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

  List<ResidentStatusDataStruct> _residentStatusList = [
    ResidentStatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"0\",\"subject\":\"รออนุมัติ\"}')),
    ResidentStatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"1\",\"subject\":\"อนุมัติแล้ว\"}')),
    ResidentStatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"3\",\"subject\":\"ไม่อนุมัติ\"}'))
  ];
  List<ResidentStatusDataStruct> get residentStatusList => _residentStatusList;
  set residentStatusList(List<ResidentStatusDataStruct> value) {
    _residentStatusList = value;
  }

  void addToResidentStatusList(ResidentStatusDataStruct value) {
    residentStatusList.add(value);
  }

  void removeFromResidentStatusList(ResidentStatusDataStruct value) {
    residentStatusList.remove(value);
  }

  void removeAtIndexFromResidentStatusList(int index) {
    residentStatusList.removeAt(index);
  }

  void updateResidentStatusListAtIndex(
    int index,
    ResidentStatusDataStruct Function(ResidentStatusDataStruct) updateFn,
  ) {
    residentStatusList[index] = updateFn(_residentStatusList[index]);
  }

  void insertAtIndexInResidentStatusList(
      int index, ResidentStatusDataStruct value) {
    residentStatusList.insert(index, value);
  }

  List<DataStatusStruct> _dataStatusList = [
    DataStatusStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"0\",\"subject\":\"ไม่แสดงข้อมูล\"}')),
    DataStatusStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"1\",\"subject\":\"แสดงข้อมูล\"}'))
  ];
  List<DataStatusStruct> get dataStatusList => _dataStatusList;
  set dataStatusList(List<DataStatusStruct> value) {
    _dataStatusList = value;
  }

  void addToDataStatusList(DataStatusStruct value) {
    dataStatusList.add(value);
  }

  void removeFromDataStatusList(DataStatusStruct value) {
    dataStatusList.remove(value);
  }

  void removeAtIndexFromDataStatusList(int index) {
    dataStatusList.removeAt(index);
  }

  void updateDataStatusListAtIndex(
    int index,
    DataStatusStruct Function(DataStatusStruct) updateFn,
  ) {
    dataStatusList[index] = updateFn(_dataStatusList[index]);
  }

  void insertAtIndexInDataStatusList(int index, DataStatusStruct value) {
    dataStatusList.insert(index, value);
  }

  List<IssueStatusDataStruct> _issueStatusList = [
    IssueStatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"0\",\"subject\":\"ยังไม่อ่าน\"}')),
    IssueStatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"1\",\"subject\":\"อ่านแล้ว\"}')),
    IssueStatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"3\",\"subject\":\"กำลังดำเนินการ\"}')),
    IssueStatusDataStruct.fromSerializableMap(jsonDecode(
        '{\"status\":\"4\",\"subject\":\"ดำเนินการเรียบร้อยแล้ว\"}')),
    IssueStatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"5\",\"subject\":\"ไม่สามารถดำเนินการได้\"}'))
  ];
  List<IssueStatusDataStruct> get issueStatusList => _issueStatusList;
  set issueStatusList(List<IssueStatusDataStruct> value) {
    _issueStatusList = value;
  }

  void addToIssueStatusList(IssueStatusDataStruct value) {
    issueStatusList.add(value);
  }

  void removeFromIssueStatusList(IssueStatusDataStruct value) {
    issueStatusList.remove(value);
  }

  void removeAtIndexFromIssueStatusList(int index) {
    issueStatusList.removeAt(index);
  }

  void updateIssueStatusListAtIndex(
    int index,
    IssueStatusDataStruct Function(IssueStatusDataStruct) updateFn,
  ) {
    issueStatusList[index] = updateFn(_issueStatusList[index]);
  }

  void insertAtIndexInIssueStatusList(int index, IssueStatusDataStruct value) {
    issueStatusList.insert(index, value);
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
