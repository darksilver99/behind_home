// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StockStatusDataStruct extends FFFirebaseStruct {
  StockStatusDataStruct({
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

  static StockStatusDataStruct fromMap(Map<String, dynamic> data) =>
      StockStatusDataStruct(
        status: castToType<int>(data['status']),
        subject: data['subject'] as String?,
      );

  static StockStatusDataStruct? maybeFromMap(dynamic data) => data is Map
      ? StockStatusDataStruct.fromMap(data.cast<String, dynamic>())
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

  static StockStatusDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      StockStatusDataStruct(
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
  String toString() => 'StockStatusDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is StockStatusDataStruct &&
        status == other.status &&
        subject == other.subject;
  }

  @override
  int get hashCode => const ListEquality().hash([status, subject]);
}

StockStatusDataStruct createStockStatusDataStruct({
  int? status,
  String? subject,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    StockStatusDataStruct(
      status: status,
      subject: subject,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

StockStatusDataStruct? updateStockStatusDataStruct(
  StockStatusDataStruct? stockStatusData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    stockStatusData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addStockStatusDataStructData(
  Map<String, dynamic> firestoreData,
  StockStatusDataStruct? stockStatusData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (stockStatusData == null) {
    return;
  }
  if (stockStatusData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && stockStatusData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final stockStatusDataData =
      getStockStatusDataFirestoreData(stockStatusData, forFieldValue);
  final nestedData =
      stockStatusDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = stockStatusData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getStockStatusDataFirestoreData(
  StockStatusDataStruct? stockStatusData, [
  bool forFieldValue = false,
]) {
  if (stockStatusData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(stockStatusData.toMap());

  // Add any Firestore field values
  stockStatusData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getStockStatusDataListFirestoreData(
  List<StockStatusDataStruct>? stockStatusDatas,
) =>
    stockStatusDatas
        ?.map((e) => getStockStatusDataFirestoreData(e, true))
        .toList() ??
    [];
