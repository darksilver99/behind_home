import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectListRecord extends FirestoreRecord {
  ProjectListRecord._(
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

  // "status" field.
  int? _status;
  int get status => _status ?? 0;
  bool hasStatus() => _status != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "objective_list" field.
  List<String>? _objectiveList;
  List<String> get objectiveList => _objectiveList ?? const [];
  bool hasObjectiveList() => _objectiveList != null;

  // "stamp_list" field.
  List<String>? _stampList;
  List<String> get stampList => _stampList ?? const [];
  bool hasStampList() => _stampList != null;

  // "car_list" field.
  List<String>? _carList;
  List<String> get carList => _carList ?? const [];
  bool hasCarList() => _carList != null;

  // "stamp_field" field.
  String? _stampField;
  String get stampField => _stampField ?? '';
  bool hasStampField() => _stampField != null;

  // "project_type" field.
  String? _projectType;
  String get projectType => _projectType ?? '';
  bool hasProjectType() => _projectType != null;

  // "update_date" field.
  DateTime? _updateDate;
  DateTime? get updateDate => _updateDate;
  bool hasUpdateDate() => _updateDate != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  bool hasLogo() => _logo != null;

  // "background_image" field.
  int? _backgroundImage;
  int get backgroundImage => _backgroundImage ?? 0;
  bool hasBackgroundImage() => _backgroundImage != null;

  // "enable_contact_address" field.
  bool? _enableContactAddress;
  bool get enableContactAddress => _enableContactAddress ?? false;
  bool hasEnableContactAddress() => _enableContactAddress != null;

  void _initializeFields() {
    _createDate = snapshotData['create_date'] as DateTime?;
    _createBy = snapshotData['create_by'] as DocumentReference?;
    _status = castToType<int>(snapshotData['status']);
    _name = snapshotData['name'] as String?;
    _objectiveList = getDataList(snapshotData['objective_list']);
    _stampList = getDataList(snapshotData['stamp_list']);
    _carList = getDataList(snapshotData['car_list']);
    _stampField = snapshotData['stamp_field'] as String?;
    _projectType = snapshotData['project_type'] as String?;
    _updateDate = snapshotData['update_date'] as DateTime?;
    _logo = snapshotData['logo'] as String?;
    _backgroundImage = castToType<int>(snapshotData['background_image']);
    _enableContactAddress = snapshotData['enable_contact_address'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('project_list');

  static Stream<ProjectListRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProjectListRecord.fromSnapshot(s));

  static Future<ProjectListRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProjectListRecord.fromSnapshot(s));

  static ProjectListRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProjectListRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProjectListRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProjectListRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProjectListRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProjectListRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProjectListRecordData({
  DateTime? createDate,
  DocumentReference? createBy,
  int? status,
  String? name,
  String? stampField,
  String? projectType,
  DateTime? updateDate,
  String? logo,
  int? backgroundImage,
  bool? enableContactAddress,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'create_date': createDate,
      'create_by': createBy,
      'status': status,
      'name': name,
      'stamp_field': stampField,
      'project_type': projectType,
      'update_date': updateDate,
      'logo': logo,
      'background_image': backgroundImage,
      'enable_contact_address': enableContactAddress,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProjectListRecordDocumentEquality implements Equality<ProjectListRecord> {
  const ProjectListRecordDocumentEquality();

  @override
  bool equals(ProjectListRecord? e1, ProjectListRecord? e2) {
    const listEquality = ListEquality();
    return e1?.createDate == e2?.createDate &&
        e1?.createBy == e2?.createBy &&
        e1?.status == e2?.status &&
        e1?.name == e2?.name &&
        listEquality.equals(e1?.objectiveList, e2?.objectiveList) &&
        listEquality.equals(e1?.stampList, e2?.stampList) &&
        listEquality.equals(e1?.carList, e2?.carList) &&
        e1?.stampField == e2?.stampField &&
        e1?.projectType == e2?.projectType &&
        e1?.updateDate == e2?.updateDate &&
        e1?.logo == e2?.logo &&
        e1?.backgroundImage == e2?.backgroundImage &&
        e1?.enableContactAddress == e2?.enableContactAddress;
  }

  @override
  int hash(ProjectListRecord? e) => const ListEquality().hash([
        e?.createDate,
        e?.createBy,
        e?.status,
        e?.name,
        e?.objectiveList,
        e?.stampList,
        e?.carList,
        e?.stampField,
        e?.projectType,
        e?.updateDate,
        e?.logo,
        e?.backgroundImage,
        e?.enableContactAddress
      ]);

  @override
  bool isValidKey(Object? o) => o is ProjectListRecord;
}
