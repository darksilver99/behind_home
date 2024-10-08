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

  List<StockStatusDataStruct> _stockStatusList = [
    StockStatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"0\",\"subject\":\"รอลูกบ้านรับพัสดุ\"}')),
    StockStatusDataStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"1\",\"subject\":\"รับพัสดุแล้ว\"}')),
    StockStatusDataStruct.fromSerializableMap(jsonDecode(
        '{\"status\":\"3\",\"subject\":\"ตีกลับ/ที่อยู่ผิด/ไม่มีผู้รับ\"}'))
  ];
  List<StockStatusDataStruct> get stockStatusList => _stockStatusList;
  set stockStatusList(List<StockStatusDataStruct> value) {
    _stockStatusList = value;
  }

  void addToStockStatusList(StockStatusDataStruct value) {
    stockStatusList.add(value);
  }

  void removeFromStockStatusList(StockStatusDataStruct value) {
    stockStatusList.remove(value);
  }

  void removeAtIndexFromStockStatusList(int index) {
    stockStatusList.removeAt(index);
  }

  void updateStockStatusListAtIndex(
    int index,
    StockStatusDataStruct Function(StockStatusDataStruct) updateFn,
  ) {
    stockStatusList[index] = updateFn(_stockStatusList[index]);
  }

  void insertAtIndexInStockStatusList(int index, StockStatusDataStruct value) {
    stockStatusList.insert(index, value);
  }

  List<DataStatusStruct> _waterPaymentStatusList = [
    DataStatusStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"0\",\"subject\":\"ยังไม่อ่าน\"}')),
    DataStatusStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"1\",\"subject\":\"อ่านแล้ว\"}')),
    DataStatusStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"3\",\"subject\":\"กำลังตรวจสอบ\"}')),
    DataStatusStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"4\",\"subject\":\"ชำระเรียบร้อยแล้ว\"}')),
    DataStatusStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"5\",\"subject\":\"ไม่สามารถตรวจสอบได้\"}'))
  ];
  List<DataStatusStruct> get waterPaymentStatusList => _waterPaymentStatusList;
  set waterPaymentStatusList(List<DataStatusStruct> value) {
    _waterPaymentStatusList = value;
  }

  void addToWaterPaymentStatusList(DataStatusStruct value) {
    waterPaymentStatusList.add(value);
  }

  void removeFromWaterPaymentStatusList(DataStatusStruct value) {
    waterPaymentStatusList.remove(value);
  }

  void removeAtIndexFromWaterPaymentStatusList(int index) {
    waterPaymentStatusList.removeAt(index);
  }

  void updateWaterPaymentStatusListAtIndex(
    int index,
    DataStatusStruct Function(DataStatusStruct) updateFn,
  ) {
    waterPaymentStatusList[index] = updateFn(_waterPaymentStatusList[index]);
  }

  void insertAtIndexInWaterPaymentStatusList(
      int index, DataStatusStruct value) {
    waterPaymentStatusList.insert(index, value);
  }

  List<DataStatusStruct> _paymentStatusList = [
    DataStatusStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"0\",\"subject\":\"รอตรวจสอบ\"}')),
    DataStatusStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"1\",\"subject\":\"ชำระเงินเรียบร้อยแล้ว\"}')),
    DataStatusStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"3\",\"subject\":\"ตรวจสอบไม่ได้\"}')),
    DataStatusStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"4\",\"subject\":\"คืนเงินแล้ว\"}')),
    DataStatusStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"5\",\"subject\":\"ยังโอนไม่ครบ\"}'))
  ];
  List<DataStatusStruct> get paymentStatusList => _paymentStatusList;
  set paymentStatusList(List<DataStatusStruct> value) {
    _paymentStatusList = value;
  }

  void addToPaymentStatusList(DataStatusStruct value) {
    paymentStatusList.add(value);
  }

  void removeFromPaymentStatusList(DataStatusStruct value) {
    paymentStatusList.remove(value);
  }

  void removeAtIndexFromPaymentStatusList(int index) {
    paymentStatusList.removeAt(index);
  }

  void updatePaymentStatusListAtIndex(
    int index,
    DataStatusStruct Function(DataStatusStruct) updateFn,
  ) {
    paymentStatusList[index] = updateFn(_paymentStatusList[index]);
  }

  void insertAtIndexInPaymentStatusList(int index, DataStatusStruct value) {
    paymentStatusList.insert(index, value);
  }

  List<DataStatusStruct> _helpStatusList = [
    DataStatusStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"0\",\"subject\":\"รอตรวจสอบ\"}')),
    DataStatusStruct.fromSerializableMap(jsonDecode(
        '{\"status\":\"1\",\"subject\":\"ดำเนินการเรียบร้อยแล้ว\"}')),
    DataStatusStruct.fromSerializableMap(
        jsonDecode('{\"status\":\"3\",\"subject\":\"ไม่สามารถดำเนินการได้\"}'))
  ];
  List<DataStatusStruct> get helpStatusList => _helpStatusList;
  set helpStatusList(List<DataStatusStruct> value) {
    _helpStatusList = value;
  }

  void addToHelpStatusList(DataStatusStruct value) {
    helpStatusList.add(value);
  }

  void removeFromHelpStatusList(DataStatusStruct value) {
    helpStatusList.remove(value);
  }

  void removeAtIndexFromHelpStatusList(int index) {
    helpStatusList.removeAt(index);
  }

  void updateHelpStatusListAtIndex(
    int index,
    DataStatusStruct Function(DataStatusStruct) updateFn,
  ) {
    helpStatusList[index] = updateFn(_helpStatusList[index]);
  }

  void insertAtIndexInHelpStatusList(int index, DataStatusStruct value) {
    helpStatusList.insert(index, value);
  }

  List<MenuDataStruct> _menuDataList = [];
  List<MenuDataStruct> get menuDataList => _menuDataList;
  set menuDataList(List<MenuDataStruct> value) {
    _menuDataList = value;
  }

  void addToMenuDataList(MenuDataStruct value) {
    menuDataList.add(value);
  }

  void removeFromMenuDataList(MenuDataStruct value) {
    menuDataList.remove(value);
  }

  void removeAtIndexFromMenuDataList(int index) {
    menuDataList.removeAt(index);
  }

  void updateMenuDataListAtIndex(
    int index,
    MenuDataStruct Function(MenuDataStruct) updateFn,
  ) {
    menuDataList[index] = updateFn(_menuDataList[index]);
  }

  void insertAtIndexInMenuDataList(int index, MenuDataStruct value) {
    menuDataList.insert(index, value);
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
