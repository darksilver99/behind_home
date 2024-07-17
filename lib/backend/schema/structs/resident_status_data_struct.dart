// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ResidentStatusDataStruct extends FFFirebaseStruct {
  ResidentStatusDataStruct({
    int? status,
    String? subject,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _status = status,
        _subject = subject,
        super(firestoreUtilData);

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  set status(int? val) => _status = val;

  void incrementStatus(int amount) => status = status + amount;

  bool hasStatus() => _status != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  set subject(String? val) => _subject = val;

  bool hasSubject() => _subject != null;

  static ResidentStatusDataStruct fromMap(Map<String, dynamic> data) =>
      ResidentStatusDataStruct(
        status: castToType<int>(data['status']),
        subject: data['subject'] as String?,
      );

  static ResidentStatusDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ResidentStatusDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'status': _status,
        'subject': _subject,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'status': serializeParam(
          _status,
          ParamType.int,
        ),
        'subject': serializeParam(
          _subject,
          ParamType.String,
        ),
      }.withoutNulls;

  static ResidentStatusDataStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      ResidentStatusDataStruct(
        status: deserializeParam(
          data['status'],
          ParamType.int,
          false,
        ),
        subject: deserializeParam(
          data['subject'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ResidentStatusDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ResidentStatusDataStruct &&
        status == other.status &&
        subject == other.subject;
  }

  @override
  int get hashCode => const ListEquality().hash([status, subject]);
}

ResidentStatusDataStruct createResidentStatusDataStruct({
  int? status,
  String? subject,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ResidentStatusDataStruct(
      status: status,
      subject: subject,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ResidentStatusDataStruct? updateResidentStatusDataStruct(
  ResidentStatusDataStruct? residentStatusData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    residentStatusData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addResidentStatusDataStructData(
  Map<String, dynamic> firestoreData,
  ResidentStatusDataStruct? residentStatusData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (residentStatusData == null) {
    return;
  }
  if (residentStatusData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && residentStatusData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final residentStatusDataData =
      getResidentStatusDataFirestoreData(residentStatusData, forFieldValue);
  final nestedData =
      residentStatusDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields =
      residentStatusData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getResidentStatusDataFirestoreData(
  ResidentStatusDataStruct? residentStatusData, [
  bool forFieldValue = false,
]) {
  if (residentStatusData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(residentStatusData.toMap());

  // Add any Firestore field values
  residentStatusData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getResidentStatusDataListFirestoreData(
  List<ResidentStatusDataStruct>? residentStatusDatas,
) =>
    residentStatusDatas
        ?.map((e) => getResidentStatusDataFirestoreData(e, true))
        .toList() ??
    [];
