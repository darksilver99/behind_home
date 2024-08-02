import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PaymentListRecord extends FirestoreRecord {
  PaymentListRecord._(
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

  // "create_project" field.
  String? _createProject;
  String get createProject => _createProject ?? '';
  bool hasCreateProject() => _createProject != null;

  // "create_project_ref" field.
  DocumentReference? _createProjectRef;
  DocumentReference? get createProjectRef => _createProjectRef;
  bool hasCreateProjectRef() => _createProjectRef != null;

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "price" field.
  double? _price;
  double get price => _price ?? 0.0;
  bool hasPrice() => _price != null;

  // "slip_image" field.
  String? _slipImage;
  String get slipImage => _slipImage ?? '';
  bool hasSlipImage() => _slipImage != null;

  // "pay_from" field.
  String? _payFrom;
  String get payFrom => _payFrom ?? '';
  bool hasPayFrom() => _payFrom != null;

  // "update_date" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  bool hasUpdateDate() => _updateDate != null;

  // "update_by" field.
  DocumentReference? _updateBy;
  DocumentReference? get updateBy => _updateBy;
  bool hasUpdateBy() => _updateBy != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _createProject = snapshotData['create_project'] as String?;
    _createProjectRef =
        snapshotData['create_project_ref'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _price = castToType<double>(snapshotData['price']);
    _slipImage = snapshotData['slip_image'] as String?;
    _payFrom = snapshotData['pay_from'] as String?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('payment_list');

  static Stream<PaymentListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => PaymentListRecord.fromSnapshot(s));

  static Future<PaymentListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => PaymentListRecord.fromSnapshot(s));

  static PaymentListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      PaymentListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static PaymentListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      PaymentListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'PaymentListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is PaymentListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createPaymentListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  String? createProject,
  DocumentReference? createProjectRef,
  int? status,
  double? price,
  String? slipImage,
  String? payFrom,
  DateTime? updateDate,
  DocumentReference? updateBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'create_project': createProject,
      'create_project_ref': createProjectRef,
      'status': status,
      'price': price,
      'slip_image': slipImage,
      'pay_from': payFrom,
      'update_date': updateDate,
      'update_by': updateBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class PaymentListRecordDocumentEquality implements Equality<PaymentListRecord> {
  const PaymentListRecordDocumentEquality();

  @override
  bool equals(PaymentListRecord? e1, PaymentListRecord? e2) {
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.createProject == e2?.createProject &&
        e1?.createProjectRef == e2?.createProjectRef &&
        e1?.status == e2?.status &&
        e1?.price == e2?.price &&
        e1?.slipImage == e2?.slipImage &&
        e1?.payFrom == e2?.payFrom &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy;
  }

  @override
  int hash(PaymentListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.createProject,
        e?.createProjectRef,
        e?.status,
        e?.price,
        e?.slipImage,
        e?.payFrom,
        e?.updateDate,
        e?.updateBy
      ]);

  @override
  bool isValidKey(Object? o) => o is PaymentListRecord;
}
