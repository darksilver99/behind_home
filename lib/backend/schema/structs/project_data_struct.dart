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
        backgroundImage == other.backgroundImage;
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
        backgroundImage
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
