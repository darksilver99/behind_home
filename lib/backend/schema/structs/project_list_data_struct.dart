// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProjectListDataStruct extends FFFirebaseStruct {
  ProjectListDataStruct({
    DocumentReference? projectRef,
    String? projectName,
    String? projectDocId,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _projectRef = projectRef,
        _projectName = projectName,
        _projectDocId = projectDocId,
        super(firestoreUtilData);

  // "project_ref" field.
  DocumentReference? _projectRef;
  DocumentReference? get projectRef => _projectRef;
  set projectRef(DocumentReference? val) => _projectRef = val;

  bool hasProjectRef() => _projectRef != null;

  // "project_name" field.
  String? _projectName;
  String get projectName => _projectName ?? '';
  set projectName(String? val) => _projectName = val;

  bool hasProjectName() => _projectName != null;

  // "project_doc_id" field.
  String? _projectDocId;
  String get projectDocId => _projectDocId ?? '';
  set projectDocId(String? val) => _projectDocId = val;

  bool hasProjectDocId() => _projectDocId != null;

  static ProjectListDataStruct fromMap(Map<String, dynamic> data) =>
      ProjectListDataStruct(
        projectRef: data['project_ref'] as DocumentReference?,
        projectName: data['project_name'] as String?,
        projectDocId: data['project_doc_id'] as String?,
      );

  static ProjectListDataStruct? maybeFromMap(dynamic data) => data is Map
      ? ProjectListDataStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'project_ref': _projectRef,
        'project_name': _projectName,
        'project_doc_id': _projectDocId,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'project_ref': serializeParam(
          _projectRef,
          ParamType.DocumentReference,
        ),
        'project_name': serializeParam(
          _projectName,
          ParamType.String,
        ),
        'project_doc_id': serializeParam(
          _projectDocId,
          ParamType.String,
        ),
      }.withoutNulls;

  static ProjectListDataStruct fromSerializableMap(Map<String, dynamic> data) =>
      ProjectListDataStruct(
        projectRef: deserializeParam(
          data['project_ref'],
          ParamType.DocumentReference,
          false,
          collectionNamePath: ['project_list'],
        ),
        projectName: deserializeParam(
          data['project_name'],
          ParamType.String,
          false,
        ),
        projectDocId: deserializeParam(
          data['project_doc_id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'ProjectListDataStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is ProjectListDataStruct &&
        projectRef == other.projectRef &&
        projectName == other.projectName &&
        projectDocId == other.projectDocId;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([projectRef, projectName, projectDocId]);
}

ProjectListDataStruct createProjectListDataStruct({
  DocumentReference? projectRef,
  String? projectName,
  String? projectDocId,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    ProjectListDataStruct(
      projectRef: projectRef,
      projectName: projectName,
      projectDocId: projectDocId,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

ProjectListDataStruct? updateProjectListDataStruct(
  ProjectListDataStruct? projectListData, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    projectListData
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addProjectListDataStructData(
  Map<String, dynamic> firestoreData,
  ProjectListDataStruct? projectListData,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (projectListData == null) {
    return;
  }
  if (projectListData.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && projectListData.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final projectListDataData =
      getProjectListDataFirestoreData(projectListData, forFieldValue);
  final nestedData =
      projectListDataData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = projectListData.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getProjectListDataFirestoreData(
  ProjectListDataStruct? projectListData, [
  bool forFieldValue = false,
]) {
  if (projectListData == null) {
    return {};
  }
  final firestoreData = mapToFirestore(projectListData.toMap());

  // Add any Firestore field values
  projectListData.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getProjectListDataListFirestoreData(
  List<ProjectListDataStruct>? projectListDatas,
) =>
    projectListDatas
        ?.map((e) => getProjectListDataFirestoreData(e, true))
        .toList() ??
    [];
