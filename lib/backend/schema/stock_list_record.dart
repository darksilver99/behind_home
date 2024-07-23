import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class StockListRecord extends FirestoreRecord {
  StockListRecord._(
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

  // "stock_number" field.
  String? _stockNumber;
  String get stockNumber => _stockNumber ?? '';
  bool hasStockNumber() => _stockNumber != null;

  // "detail" field.
  String? _detail;
  String get detail => _detail ?? '';
  bool hasDetail() => _detail != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  bool hasImages() => _images != null;

  // "resident_ref" field.
  DocumentReference? _residentRef;
  DocumentReference? get residentRef => _residentRef;
  bool hasResidentRef() => _residentRef != null;

  // "receiver" field.
  DocumentReference? _receiver;
  DocumentReference? get receiver => _receiver;
  bool hasReceiver() => _receiver != null;

  // "contact_address" field.
  String? _contactAddress;
  String get contactAddress => _contactAddress ?? '';
  bool hasContactAddress() => _contactAddress != null;

  // "receive_date" field.
  DateTime? _receiveDate;
  DateTime? get receiveDate => _receiveDate;
  bool hasReceiveDate() => _receiveDate != null;

  // "receive_remark" field.
  String? _receiveRemark;
  String get receiveRemark => _receiveRemark ?? '';
  bool hasReceiveRemark() => _receiveRemark != null;

  // "receive_by" field.
  String? _receiveBy;
  String get receiveBy => _receiveBy ?? '';
  bool hasReceiveBy() => _receiveBy != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _stockNumber = snapshotData['stock_number'] as String?;
    _detail = snapshotData['detail'] as String?;
    _images = getDataList(snapshotData['images']);
    _residentRef = snapshotData['resident_ref'] as DocumentReference?;
    _receiver = snapshotData['receiver'] as DocumentReference?;
    _contactAddress = snapshotData['contact_address'] as String?;
    _receiveDate = snapshotData['receive_date'] as DateTime?;
    _receiveRemark = snapshotData['receive_remark'] as String?;
    _receiveBy = snapshotData['receive_by'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('stock_list');

  static Stream<StockListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => StockListRecord.fromSnapshot(s));

  static Future<StockListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => StockListRecord.fromSnapshot(s));

  static StockListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      StockListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static StockListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      StockListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'StockListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is StockListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createStockListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  int? status,
  String? stockNumber,
  String? detail,
  DocumentReference? residentRef,
  DocumentReference? receiver,
  String? contactAddress,
  DateTime? receiveDate,
  String? receiveRemark,
  String? receiveBy,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'update_by': updateBy,
      'status': status,
      'stock_number': stockNumber,
      'detail': detail,
      'resident_ref': residentRef,
      'receiver': receiver,
      'contact_address': contactAddress,
      'receive_date': receiveDate,
      'receive_remark': receiveRemark,
      'receive_by': receiveBy,
    }.withoutNulls,
  );

  return firestoreData;
}

class StockListRecordDocumentEquality implements Equality<StockListRecord> {
  const StockListRecordDocumentEquality();

  @override
  bool equals(StockListRecord? e1, StockListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.status == e2?.status &&
        e1?.stockNumber == e2?.stockNumber &&
        e1?.detail == e2?.detail &&
        listEquality.equals(e1?.images, e2?.images) &&
        e1?.residentRef == e2?.residentRef &&
        e1?.receiver == e2?.receiver &&
        e1?.contactAddress == e2?.contactAddress &&
        e1?.receiveDate == e2?.receiveDate &&
        e1?.receiveRemark == e2?.receiveRemark &&
        e1?.receiveBy == e2?.receiveBy;
  }

  @override
  int hash(StockListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.status,
        e?.stockNumber,
        e?.detail,
        e?.images,
        e?.residentRef,
        e?.receiver,
        e?.contactAddress,
        e?.receiveDate,
        e?.receiveRemark,
        e?.receiveBy
      ]);

  @override
  bool isValidKey(Object? o) => o is StockListRecord;
}
