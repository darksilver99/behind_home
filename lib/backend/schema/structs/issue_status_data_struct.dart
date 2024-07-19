// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IssueStatusDataStruct extends FFFirebaseStruct {
  IssueStatusDataStruct({
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

  static IssueStatusDataStruct fromMap(Map<String, dynamic> data) =>
      IssueStatusDataStruct(
        status: castToType<int>(data['status']),
        subject: data['subject'] as String?,
      );

  static IssueStatusDataStruct? maybeFromMap(dynamic data) => data is Map
      ? IssueStatusDataStruct.fromMap(data.cast<String, dynamic>())
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

  static IssueStatusDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      IssueStatusDataStruct(
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
  String toString() => 'IssueStatusDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is IssueStatusDataStruct &&
        status == other.status &&
        subject == other.subject;
  }

  @override
  int get hashCode => const ListEquality().hash([status, subject]);
}

IssueStatusDataStruct createIssueStatusDataStruct({
  int? status,
  String? subject,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    IssueStatusDataStruct(
      status: status,
      subject: subject,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

IssueStatusDataStruct? updateIssueStatusDataStruct(
  IssueStatusDataStruct? issueStatusData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    issueStatusData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addIssueStatusDataStructData(
  Map<String, dynamic> firestoreData,
  IssueStatusDataStruct? issueStatusData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (issueStatusData == null) {
    return;
  }
  if (issueStatusData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && issueStatusData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final issueStatusDataData =
      getIssueStatusDataFirestoreData(issueStatusData, forFieldValue);
  final nestedData =
      issueStatusDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = issueStatusData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getIssueStatusDataFirestoreData(
  IssueStatusDataStruct? issueStatusData, [
  bool forFieldValue = false,
]) {
  if (issueStatusData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(issueStatusData.toMap());

  // Add any Firestore field values
  issueStatusData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getIssueStatusDataListFirestoreData(
  List<IssueStatusDataStruct>? issueStatusDatas,
) =>
    issueStatusDatas
        ?.map((e) => getIssueStatusDataFirestoreData(e, true))
        .toList() ??
    [];
