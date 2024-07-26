import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PhoneProjectListRecord extends FirestoreRecord {
  PhoneProjectListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "create_date" field.
  DateTime? _createDate;
  DateTime? get createDate => _createDate;
  bool hasCreateDate() => _createDate != null;

  // "create_by" field.
  DocumentReference? _createBy;
  DocumentReference? get createBy => _createBy;
  bool hasCreateBy() => _createBy != null;

  // "update_date" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  bool hasUpdateDate() => _updateDate != null;

  // "update_by" field.
  DocumentReference? _updateBy;
  DocumentReference? get updateBy => _updateBy;
  bool hasUpdateBy() => _updateBy != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "phone" field.
  String? _phone;
  String get phone => _phone ?? '';
  bool hasPhone() => _phone != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _subject = snapshotData['subject'] as String?;
    _phone = snapshotData['phone'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('phone_project_list');

  static Stream<PhoneProjectListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PhoneProjectListRecord.fromSnapshot(s));

  static Future<PhoneProjectListRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => PhoneProjectListRecord.fromSnapshot(s));

  static PhoneProjectListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PhoneProjectListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PhoneProjectListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PhoneProjectListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PhoneProjectListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PhoneProjectListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPhoneProjectListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  int? status,
  String? subject,
  String? phone,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'update_by': updateBy,
      'status': status,
      'subject': subject,
      'phone': phone,
    }.withoutNulls,
  );

  return firestoreData;
}

class PhoneProjectListRecordDocumentEquality
    implements Equality<PhoneProjectListRecord> {
  const PhoneProjectListRecordDocumentEquality();

  @override
  bool equals(PhoneProjectListRecord? e1, PhoneProjectListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.status == e2?.status &&
        e1?.subject == e2?.subject &&
        e1?.phone == e2?.phone;
  }

  @override
  int hash(PhoneProjectListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.status,
        e?.subject,
        e?.phone
      ]);

  @override
  bool isValidKey(Object? o) => o is PhoneProjectListRecord;
}
