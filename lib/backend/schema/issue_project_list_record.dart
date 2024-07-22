import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class IssueProjectListRecord extends FirestoreRecord {
  IssueProjectListRecord._(
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

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  bool hasDetail() => _detail != null;

  // "contact_name" field.
  String? _contactName;
  String get contactName => _contactName ?? '';
  bool hasContactName() => _contactName != null;

  // "contact_phone" field.
  String? _contactPhone;
  String get contactPhone => _contactPhone ?? '';
  bool hasContactPhone() => _contactPhone != null;

  // "contact_address" field.
  String? _contactAddress;
  String get contactAddress => _contactAddress ?? '';
  bool hasContactAddress() => _contactAddress != null;

  // "admin_detail" field.
  String? _adminDetail;
  String get adminDetail => _adminDetail ?? '';
  bool hasAdminDetail() => _adminDetail != null;

  // "remark_not_complete" field.
  String? _remarkNotComplete;
  String get remarkNotComplete => _remarkNotComplete ?? '';
  bool hasRemarkNotComplete() => _remarkNotComplete != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _subject = snapshotData['subject'] as String?;
    _detail = snapshotData['detail'] as String?;
    _contactName = snapshotData['contact_name'] as String?;
    _contactPhone = snapshotData['contact_phone'] as String?;
    _contactAddress = snapshotData['contact_address'] as String?;
    _adminDetail = snapshotData['admin_detail'] as String?;
    _remarkNotComplete = snapshotData['remark_not_complete'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('project_list/${FFAppState().projectData.projectDocID}/issue_project_list');

  static Stream<IssueProjectListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => IssueProjectListRecord.fromSnapshot(s));

  static Future<IssueProjectListRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => IssueProjectListRecord.fromSnapshot(s));

  static IssueProjectListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      IssueProjectListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static IssueProjectListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      IssueProjectListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'IssueProjectListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is IssueProjectListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createIssueProjectListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  int? status,
  String? subject,
  String? detail,
  String? contactName,
  String? contactPhone,
  String? contactAddress,
  String? adminDetail,
  String? remarkNotComplete,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'update_by': updateBy,
      'status': status,
      'subject': subject,
      'detail': detail,
      'contact_name': contactName,
      'contact_phone': contactPhone,
      'contact_address': contactAddress,
      'admin_detail': adminDetail,
      'remark_not_complete': remarkNotComplete,
    }.withoutNulls,
  );

  return firestoreData;
}

class IssueProjectListRecordDocumentEquality
    implements Equality<IssueProjectListRecord> {
  const IssueProjectListRecordDocumentEquality();

  @override
  bool equals(IssueProjectListRecord? e1, IssueProjectListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.status == e2?.status &&
        e1?.subject == e2?.subject &&
        e1?.detail == e2?.detail &&
        e1?.contactName == e2?.contactName &&
        e1?.contactPhone == e2?.contactPhone &&
        e1?.contactAddress == e2?.contactAddress &&
        e1?.adminDetail == e2?.adminDetail &&
        e1?.remarkNotComplete == e2?.remarkNotComplete;
  }

  @override
  int hash(IssueProjectListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.status,
        e?.subject,
        e?.detail,
        e?.contactName,
        e?.contactPhone,
        e?.contactAddress,
        e?.adminDetail,
        e?.remarkNotComplete
      ]);

  @override
  bool isValidKey(Object? o) => o is IssueProjectListRecord;
}
