// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MenuDataStruct extends FFFirebaseStruct {
  MenuDataStruct({
    String? subject,
    String? collectionName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _subject = subject,
        _collectionName = collectionName,
        super(firestoreUtilData);

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  set subject(String? val) => _subject = val;

  bool hasSubject() => _subject != null;

  // "collection_name" field.
  String? _collectionName;
  String get collectionName => _collectionName ?? '';
  set collectionName(String? val) => _collectionName = val;

  bool hasCollectionName() => _collectionName != null;

  static MenuDataStruct fromMap(Map<String, dynamic> data) => MenuDataStruct(
        subject: data['subject'] as String?,
        collectionName: data['collection_name'] as String?,
      );

  static MenuDataStruct? maybeFromMap(dynamic data) =>
      data is Map ? MenuDataStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'subject': _subject,
        'collection_name': _collectionName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
        'collection_name': serializeParam(
          _collectionName,
          ParamType.String,
        ),
      }.withoutNulls;

  static MenuDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      MenuDataStruct(
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
        collectionName: deserializeParam(
          data['collection_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'MenuDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is MenuDataStruct &&
        subject == other.subject &&
        collectionName == other.collectionName;
  }

  @override
  int get hashCode => const ListEquality().hash([subject, collectionName]);
}

MenuDataStruct createMenuDataStruct({
  String? subject,
  String? collectionName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    MenuDataStruct(
      subject: subject,
      collectionName: collectionName,
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
