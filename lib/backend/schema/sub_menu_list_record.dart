import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubMenuListRecord extends FirestoreRecord {
  SubMenuListRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "seq" field.
  int? _seq;
  int get seq => _seq ?? 0;
  bool hasSeq() => _seq != null;

  // "subject" field.
  String? _subject;
  String get subject => _subject ?? '';
  bool hasSubject() => _subject != null;

  // "path_name" field.
  String? _pathName;
  String get pathName => _pathName ?? '';
  bool hasPathName() => _pathName != null;

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  DocumentReference get parentReference => reference.parent.parent!;

  void _initializeFields() {
    _status = castToType<int>(snapshotData['status']);
    _seq = castToType<int>(snapshotData['seq']);
    _subject = snapshotData['subject'] as String?;
    _pathName = snapshotData['path_name'] as String?;
    _type = snapshotData['type'] as String?;
  }

  static Query<Map<String, dynamic>> collection([DocumentReference? parent]) =>
      parent != null
          ? parent.collection('sub_menu_list')
          : FirebaseFirestore.instance.collectionGroup('sub_menu_list');

  static DocumentReference createDoc(DocumentReference parent, {String? id}) =>
      parent.collection('sub_menu_list').doc(id);

  static Stream<SubMenuListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubMenuListRecord.fromSnapshot(s));

  static Future<SubMenuListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubMenuListRecord.fromSnapshot(s));

  static SubMenuListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubMenuListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubMenuListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubMenuListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubMenuListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubMenuListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubMenuListRecordData({
  int? status,
  int? seq,
  String? subject,
  String? pathName,
  String? type,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'seq': seq,
      'subject': subject,
      'path_name': pathName,
      'type': type,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubMenuListRecordDocumentEquality implements Equality<SubMenuListRecord> {
  const SubMenuListRecordDocumentEquality();

  @override
  bool equals(SubMenuListRecord? e1, SubMenuListRecord? e2) {
    return e1?.status == e2?.status &&
        e1?.seq == e2?.seq &&
        e1?.subject == e2?.subject &&
        e1?.pathName == e2?.pathName &&
        e1?.type == e2?.type;
  }

  @override
  int hash(SubMenuListRecord? e) => const ListEquality()
      .hash([e?.status, e?.seq, e?.subject, e?.pathName, e?.type]);

  @override
  bool isValidKey(Object? o) => o is SubMenuListRecord;
}
