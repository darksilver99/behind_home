import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BehindMenuListRecord extends FirestoreRecord {
  BehindMenuListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "path_name" field.
  String? _pathName;
  String get pathName => _pathName ?? '';
  bool hasPathName() => _pathName != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  // "seq" field.
  int? _seq;
  int get seq => _seq ?? 0;
  bool hasSeq() => _seq != null;

  void _initializeFields() {
    _status = castToType<int>(snapshotData['status']);
    _subject = snapshotData['subject'] as String?;
    _pathName = snapshotData['path_name'] as String?;
    _icon = snapshotData['icon'] as String?;
    _seq = castToType<int>(snapshotData['seq']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('behind_menu_list');

  static Stream<BehindMenuListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BehindMenuListRecord.fromSnapshot(s));

  static Future<BehindMenuListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BehindMenuListRecord.fromSnapshot(s));

  static BehindMenuListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      BehindMenuListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BehindMenuListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BehindMenuListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BehindMenuListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BehindMenuListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBehindMenuListRecordData({
  int? status,
  String? subject,
  String? pathName,
  String? icon,
  int? seq,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'subject': subject,
      'path_name': pathName,
      'icon': icon,
      'seq': seq,
    }.withoutNulls,
  );

  return firestoreData;
}

class BehindMenuListRecordDocumentEquality
    implements Equality<BehindMenuListRecord> {
  const BehindMenuListRecordDocumentEquality();

  @override
  bool equals(BehindMenuListRecord? e1, BehindMenuListRecord? e2) {
    return e1?.status == e2?.status &&
        e1?.subject == e2?.subject &&
        e1?.pathName == e2?.pathName &&
        e1?.icon == e2?.icon &&
        e1?.seq == e2?.seq;
  }

  @override
  int hash(BehindMenuListRecord? e) => const ListEquality()
      .hash([e?.status, e?.subject, e?.pathName, e?.icon, e?.seq]);

  @override
  bool isValidKey(Object? o) => o is BehindMenuListRecord;
}
