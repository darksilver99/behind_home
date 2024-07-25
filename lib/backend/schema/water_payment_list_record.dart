import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class WaterPaymentListRecord extends FirestoreRecord {
  WaterPaymentListRecord._(
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

  // "resident_ref" field.
  DocumentReference? _residentRef;
  DocumentReference? get residentRef => _residentRef;
  bool hasResidentRef() => _residentRef != null;

  // "images_bill" field.
  List<String>? _imagesBill;
  List<String> get imagesBill => _imagesBill ?? const [];
  bool hasImagesBill() => _imagesBill != null;

  // "images_slip" field.
  List<String>? _imagesSlip;
  List<String> get imagesSlip => _imagesSlip ?? const [];
  bool hasImagesSlip() => _imagesSlip != null;

  // "admin_detail" field.
  String? _adminDetail;
  String get adminDetail => _adminDetail ?? '';
  bool hasAdminDetail() => _adminDetail != null;

  // "remark" field.
  String? _remark;
  String get remark => _remark ?? '';
  bool hasRemark() => _remark != null;

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

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _updateBy = snapshotData['update_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _residentRef = snapshotData['resident_ref'] as DocumentReference?;
    _imagesBill = getDataList(snapshotData['images_bill']);
    _imagesSlip = getDataList(snapshotData['images_slip']);
    _adminDetail = snapshotData['admin_detail'] as String?;
    _remark = snapshotData['remark'] as String?;
    _contactName = snapshotData['contact_name'] as String?;
    _contactPhone = snapshotData['contact_phone'] as String?;
    _contactAddress = snapshotData['contact_address'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('project_list/${FFAppState().projectData.projectDocID}/water_payment_list');

  static Stream<WaterPaymentListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WaterPaymentListRecord.fromSnapshot(s));

  static Future<WaterPaymentListRecord> getDocumentOnce(
          DocumentReference ref) =>
      ref.get().then((s) => WaterPaymentListRecord.fromSnapshot(s));

  static WaterPaymentListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WaterPaymentListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WaterPaymentListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WaterPaymentListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WaterPaymentListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WaterPaymentListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWaterPaymentListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  DateTime? updateDate,
  DocumentReference? updateBy,
  int? status,
  DocumentReference? residentRef,
  String? adminDetail,
  String? remark,
  String? contactName,
  String? contactPhone,
  String? contactAddress,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'update_date': updateDate,
      'update_by': updateBy,
      'status': status,
      'resident_ref': residentRef,
      'admin_detail': adminDetail,
      'remark': remark,
      'contact_name': contactName,
      'contact_phone': contactPhone,
      'contact_address': contactAddress,
    }.withoutNulls,
  );

  return firestoreData;
}

class WaterPaymentListRecordDocumentEquality
    implements Equality<WaterPaymentListRecord> {
  const WaterPaymentListRecordDocumentEquality();

  @override
  bool equals(WaterPaymentListRecord? e1, WaterPaymentListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.updateDate == e2?.updateDate &&
        e1?.updateBy == e2?.updateBy &&
        e1?.status == e2?.status &&
        e1?.residentRef == e2?.residentRef &&
        listEquality.equals(e1?.imagesBill, e2?.imagesBill) &&
        listEquality.equals(e1?.imagesSlip, e2?.imagesSlip) &&
        e1?.adminDetail == e2?.adminDetail &&
        e1?.remark == e2?.remark &&
        e1?.contactName == e2?.contactName &&
        e1?.contactPhone == e2?.contactPhone &&
        e1?.contactAddress == e2?.contactAddress;
  }

  @override
  int hash(WaterPaymentListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.updateDate,
        e?.updateBy,
        e?.status,
        e?.residentRef,
        e?.imagesBill,
        e?.imagesSlip,
        e?.adminDetail,
        e?.remark,
        e?.contactName,
        e?.contactPhone,
        e?.contactAddress
      ]);

  @override
  bool isValidKey(Object? o) => o is WaterPaymentListRecord;
}
