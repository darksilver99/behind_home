// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenuDataStruct extends FFFirebaseStruct {
  MenuDataStruct({
    String? pathName,
    int? status,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _pathName = pathName,
        _status = status,
        super(firestoreUtilData);

  // "path_name" field.
  String? _pathName;
  String get pathName => _pathName ?? '';
  set pathName(String? val) => _pathName = val;

  bool hasPathName() => _pathName != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;

  void incrementStatus(int amount) => status = status + amount;

  bool hasStatus() => _status != null;

  static MenuDataStruct fromMap(Map<String, dynamic> data) => MenuDataStruct(
        pathName: data['path_name'] as String?,
        status: castToType<int>(data['status']),
      );

  static MenuDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? MenuDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'path_name': _pathName,
        'status': _status,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'path_name': serializeParam(
          _pathName,
          ParamType.String,
        ),
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
      }.withoutNulls;

  static MenuDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      MenuDataStruct(
        pathName: deserializeParam(
          data['path_name'],
          ParamType.String,
          false,
        ),
        status: deserializeParam(
          data['status'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'MenuDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MenuDataStruct &&
        pathName == other.pathName &&
        status == other.status;
  }

  @override
  int get hashCode => const ListEquality().hash([pathName, status]);
}

MenuDataStruct createMenuDataStruct({
  String? pathName,
  int? status,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MenuDataStruct(
      pathName: pathName,
      status: status,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

MenuDataStruct? updateMenuDataStruct(
  MenuDataStruct? menuData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    menuData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addMenuDataStructData(
  Map<String, dynamic> firestoreData,
  MenuDataStruct? menuData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (menuData == null) {
    return;
  }
  if (menuData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && menuData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final menuDataData = getMenuDataFirestoreData(menuData, forFieldValue);
  final nestedData = menuDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = menuData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getMenuDataFirestoreData(
  MenuDataStruct? menuData, [
  bool forFieldValue = false,
]) {
  if (menuData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(menuData.toMap());

  // Add any Firestore field values
  menuData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getMenuDataListFirestoreData(
  List<MenuDataStruct>? menuDatas,
) =>
    menuDatas?.map((e) => getMenuDataFirestoreData(e, true)).toList() ?? [];
