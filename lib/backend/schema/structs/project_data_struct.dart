// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectDataStruct extends FFFirebaseStruct {
  ProjectDataStruct({
    String? projectDocID,
    String? projectName,
    List<String>? projectStampList,
    List<String>? projectObjectiveList,
    List<String>? projectCarList,
    String? projectType,
    String? stampField,
    DocumentReference? projectReference,
    bool? enableContactAddress,
    String? logo,
    int? backgroundImage,
    DateTime? expireDate,
    bool? enableMoreImage,
    bool? enableMoreDetail,
    String? moreDetailField,
    String? moreImageField,
    String? textInLastSlip,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _projectDocID = projectDocID,
        _projectName = projectName,
        _projectStampList = projectStampList,
        _projectObjectiveList = projectObjectiveList,
        _projectCarList = projectCarList,
        _projectType = projectType,
        _stampField = stampField,
        _projectReference = projectReference,
        _enableContactAddress = enableContactAddress,
        _logo = logo,
        _backgroundImage = backgroundImage,
        _expireDate = expireDate,
        _enableMoreImage = enableMoreImage,
        _enableMoreDetail = enableMoreDetail,
        _moreDetailField = moreDetailField,
        _moreImageField = moreImageField,
        _textInLastSlip = textInLastSlip,
        super(firestoreUtilData);

  // "projectDocID" field.
  String? _projectDocID;
  String get projectDocID => _projectDocID ?? '';
  set projectDocID(String? val) => _projectDocID = val;

  bool hasProjectDocID() => _projectDocID != null;

  // "projectName" field.
  String? _projectName;
  String get projectName => _projectName ?? '';
  set projectName(String? val) => _projectName = val;

  bool hasProjectName() => _projectName != null;

  // "projectStampList" field.
  List<String>? _projectStampList;
  List<String> get projectStampList => _projectStampList ?? const [];
  set projectStampList(List<String>? val) => _projectStampList = val;

  void updateProjectStampList(Function(List<String>) updateFn) {
    updateFn(_projectStampList ??= []);
  }

  bool hasProjectStampList() => _projectStampList != null;

  // "projectObjectiveList" field.
  List<String>? _projectObjectiveList;
  List<String> get projectObjectiveList => _projectObjectiveList ?? const [];
  set projectObjectiveList(List<String>? val) => _projectObjectiveList = val;

  void updateProjectObjectiveList(Function(List<String>) updateFn) {
    updateFn(_projectObjectiveList ??= []);
  }

  bool hasProjectObjectiveList() => _projectObjectiveList != null;

  // "projectCarList" field.
  List<String>? _projectCarList;
  List<String> get projectCarList => _projectCarList ?? const [];
  set projectCarList(List<String>? val) => _projectCarList = val;

  void updateProjectCarList(Function(List<String>) updateFn) {
    updateFn(_projectCarList ??= []);
  }

  bool hasProjectCarList() => _projectCarList != null;

  // "project_type" field.
  String? _projectType;
  String get projectType => _projectType ?? '';
  set projectType(String? val) => _projectType = val;

  bool hasProjectType() => _projectType != null;

  // "stamp_field" field.
  String? _stampField;
  String get stampField => _stampField ?? '';
  set stampField(String? val) => _stampField = val;

  bool hasStampField() => _stampField != null;

  // "projectReference" field.
  DocumentReference? _projectReference;
  DocumentReference? get projectReference => _projectReference;
  set projectReference(DocumentReference? val) => _projectReference = val;

  bool hasProjectReference() => _projectReference != null;

  // "enable_contact_address" field.
  bool? _enableContactAddress;
  bool get enableContactAddress => _enableContactAddress ?? false;
  set enableContactAddress(bool? val) => _enableContactAddress = val;

  bool hasEnableContactAddress() => _enableContactAddress != null;

  // "logo" field.
  String? _logo;
  String get logo => _logo ?? '';
  set logo(String? val) => _logo = val;

  bool hasLogo() => _logo != null;

  // "background_image" field.
  int? _backgroundImage;
  int get backgroundImage => _backgroundImage ?? 0;
  set backgroundImage(int? val) => _backgroundImage = val;

  void incrementBackgroundImage(int amount) =>
      backgroundImage = backgroundImage + amount;

  bool hasBackgroundImage() => _backgroundImage != null;

  // "expire_date" field.
  DateTime? _expireDate;
  DateTime? get expireDate => _expireDate;
  set expireDate(DateTime? val) => _expireDate = val;

  bool hasExpireDate() => _expireDate != null;

  // "enable_more_image" field.
  bool? _enableMoreImage;
  bool get enableMoreImage => _enableMoreImage ?? false;
  set enableMoreImage(bool? val) => _enableMoreImage = val;

  bool hasEnableMoreImage() => _enableMoreImage != null;

  // "enable_more_detail" field.
  bool? _enableMoreDetail;
  bool get enableMoreDetail => _enableMoreDetail ?? false;
  set enableMoreDetail(bool? val) => _enableMoreDetail = val;

  bool hasEnableMoreDetail() => _enableMoreDetail != null;

  // "more_detail_field" field.
  String? _moreDetailField;
  String get moreDetailField => _moreDetailField ?? '';
  set moreDetailField(String? val) => _moreDetailField = val;

  bool hasMoreDetailField() => _moreDetailField != null;

  // "more_image_field" field.
  String? _moreImageField;
  String get moreImageField => _moreImageField ?? '';
  set moreImageField(String? val) => _moreImageField = val;

  bool hasMoreImageField() => _moreImageField != null;

  // "text_in_last_slip" field.
  String? _textInLastSlip;
  String get textInLastSlip => _textInLastSlip ?? '';
  set textInLastSlip(String? val) => _textInLastSlip = val;

  bool hasTextInLastSlip() => _textInLastSlip != null;

  static ProjectDataStruct fromMap(Map<String, dynamic> data) =>
      ProjectDataStruct(
        projectDocID: data['projectDocID'] as String?,
        projectName: data['projectName'] as String?,
        projectStampList: getDataList(data['projectStampList']),
        projectObjectiveList: getDataList(data['projectObjectiveList']),
        projectCarList: getDataList(data['projectCarList']),
        projectType: data['project_type'] as String?,
        stampField: data['stamp_field'] as String?,
        projectReference: data['projectReference'] as DocumentReference?,
        enableContactAddress: data['enable_contact_address'] as bool?,
        logo: data['logo'] as String?,
        backgroundImage: castToType<int>(data['background_image']),
        expireDate: data['expire_date'] as DateTime?,
        enableMoreImage: data['enable_more_image'] as bool?,
        enableMoreDetail: data['enable_more_detail'] as bool?,
        moreDetailField: data['more_detail_field'] as String?,
        moreImageField: data['more_image_field'] as String?,
        textInLastSlip: data['text_in_last_slip'] as String?,
      );

  static ProjectDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ProjectDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'projectDocID': _projectDocID,
        'projectName': _projectName,
        'projectStampList': _projectStampList,
        'projectObjectiveList': _projectObjectiveList,
        'projectCarList': _projectCarList,
        'project_type': _projectType,
        'stamp_field': _stampField,
        'projectReference': _projectReference,
        'enable_contact_address': _enableContactAddress,
        'logo': _logo,
        'background_image': _backgroundImage,
        'expire_date': _expireDate,
        'enable_more_image': _enableMoreImage,
        'enable_more_detail': _enableMoreDetail,
        'more_detail_field': _moreDetailField,
        'more_image_field': _moreImageField,
        'text_in_last_slip': _textInLastSlip,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'projectDocID': serializeParam(
          _projectDocID,
          ParamType.String,
        ),
        'projectName': serializeParam(
          _projectName,
          ParamType.String,
        ),
        'projectStampList': serializeParam(
          _projectStampList,
          ParamType.String,
          isList: true,
        ),
        'projectObjectiveList': serializeParam(
          _projectObjectiveList,
          ParamType.String,
          isList: true,
        ),
        'projectCarList': serializeParam(
          _projectCarList,
          ParamType.String,
          isList: true,
        ),
        'project_type': serializeParam(
          _projectType,
          ParamType.String,
        ),
        'stamp_field': serializeParam(
          _stampField,
          ParamType.String,
        ),
        'projectReference': serializeParam(
          _projectReference,
          ParamType.DocumentReference,
        ),
        'enable_contact_address': serializeParam(
          _enableContactAddress,
          ParamType.bool,
        ),
        'logo': serializeParam(
          _logo,
          ParamType.String,
        ),
        'background_image': serializeParam(
          _backgroundImage,
          ParamType.int,
        ),
        'expire_date': serializeParam(
          _expireDate,
          ParamType.DateTime,
        ),
        'enable_more_image': serializeParam(
          _enableMoreImage,
          ParamType.bool,
        ),
        'enable_more_detail': serializeParam(
          _enableMoreDetail,
          ParamType.bool,
        ),
        'more_detail_field': serializeParam(
          _moreDetailField,
          ParamType.String,
        ),
        'more_image_field': serializeParam(
          _moreImageField,
          ParamType.String,
        ),
        'text_in_last_slip': serializeParam(
          _textInLastSlip,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProjectDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProjectDataStruct(
        projectDocID: deserializeParam(
          data['projectDocID'],
          ParamType.String,
          false,
        ),
        projectName: deserializeParam(
          data['projectName'],
          ParamType.String,
          false,
        ),
        projectStampList: deserializeParam<String>(
          data['projectStampList'],
          ParamType.String,
          true,
        ),
        projectObjectiveList: deserializeParam<String>(
          data['projectObjectiveList'],
          ParamType.String,
          true,
        ),
        projectCarList: deserializeParam<String>(
          data['projectCarList'],
          ParamType.String,
          true,
        ),
        projectType: deserializeParam(
          data['project_type'],
          ParamType.String,
          false,
        ),
        stampField: deserializeParam(
          data['stamp_field'],
          ParamType.String,
          false,
        ),
        projectReference: deserializeParam(
          data['projectReference'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['project_list'],
        ),
        enableContactAddress: deserializeParam(
          data['enable_contact_address'],
          ParamType.bool,
          false,
        ),
        logo: deserializeParam(
          data['logo'],
          ParamType.String,
          false,
        ),
        backgroundImage: deserializeParam(
          data['background_image'],
          ParamType.int,
          false,
        ),
        expireDate: deserializeParam(
          data['expire_date'],
          ParamType.DateTime,
          false,
        ),
        enableMoreImage: deserializeParam(
          data['enable_more_image'],
          ParamType.bool,
          false,
        ),
        enableMoreDetail: deserializeParam(
          data['enable_more_detail'],
          ParamType.bool,
          false,
        ),
        moreDetailField: deserializeParam(
          data['more_detail_field'],
          ParamType.String,
          false,
        ),
        moreImageField: deserializeParam(
          data['more_image_field'],
          ParamType.String,
          false,
        ),
        textInLastSlip: deserializeParam(
          data['text_in_last_slip'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProjectDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is ProjectDataStruct &&
        projectDocID == other.projectDocID &&
        projectName == other.projectName &&
        listEquality.equals(projectStampList, other.projectStampList) &&
        listEquality.equals(projectObjectiveList, other.projectObjectiveList) &&
        listEquality.equals(projectCarList, other.projectCarList) &&
        projectType == other.projectType &&
        stampField == other.stampField &&
        projectReference == other.projectReference &&
        enableContactAddress == other.enableContactAddress &&
        logo == other.logo &&
        backgroundImage == other.backgroundImage &&
        expireDate == other.expireDate &&
        enableMoreImage == other.enableMoreImage &&
        enableMoreDetail == other.enableMoreDetail &&
        moreDetailField == other.moreDetailField &&
        moreImageField == other.moreImageField &&
        textInLastSlip == other.textInLastSlip;
  }

  @override
  int get hashCode => const ListEquality().hash([
        projectDocID,
        projectName,
        projectStampList,
        projectObjectiveList,
        projectCarList,
        projectType,
        stampField,
        projectReference,
        enableContactAddress,
        logo,
        backgroundImage,
        expireDate,
        enableMoreImage,
        enableMoreDetail,
        moreDetailField,
        moreImageField,
        textInLastSlip
      ]);
}

ProjectDataStruct createProjectDataStruct({
  String? projectDocID,
  String? projectName,
  String? projectType,
  String? stampField,
  DocumentReference? projectReference,
  bool? enableContactAddress,
  String? logo,
  int? backgroundImage,
  DateTime? expireDate,
  bool? enableMoreImage,
  bool? enableMoreDetail,
  String? moreDetailField,
  String? moreImageField,
  String? textInLastSlip,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProjectDataStruct(
      projectDocID: projectDocID,
      projectName: projectName,
      projectType: projectType,
      stampField: stampField,
      projectReference: projectReference,
      enableContactAddress: enableContactAddress,
      logo: logo,
      backgroundImage: backgroundImage,
      expireDate: expireDate,
      enableMoreImage: enableMoreImage,
      enableMoreDetail: enableMoreDetail,
      moreDetailField: moreDetailField,
      moreImageField: moreImageField,
      textInLastSlip: textInLastSlip,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProjectDataStruct? updateProjectDataStruct(
  ProjectDataStruct? projectData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    projectData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProjectDataStructData(
  Map<String, dynamic> firestoreData,
  ProjectDataStruct? projectData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (projectData == null) {
    return;
  }
  if (projectData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && projectData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final projectDataData =
      getProjectDataFirestoreData(projectData, forFieldValue);
  final nestedData =
      projectDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = projectData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProjectDataFirestoreData(
  ProjectDataStruct? projectData, [
  bool forFieldValue = false,
]) {
  if (projectData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(projectData.toMap());

  // Add any Firestore field values
  projectData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProjectDataListFirestoreData(
  List<ProjectDataStruct>? projectDatas,
) =>
    projectDatas?.map((e) => getProjectDataFirestoreData(e, true)).toList() ??
    [];
