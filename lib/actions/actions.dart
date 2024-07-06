import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';

Future createProjectData(
  BuildContext context, {
  required ProjectListRecord? projectResult,
}) async {
  FFAppState().projectData = ProjectDataStruct(
    projectDocID: projectResult?.reference.id,
    projectName: projectResult?.name,
    projectStampList: projectResult?.stampList,
    projectObjectiveList: projectResult?.objectiveList,
    projectCarList: projectResult?.carList,
    projectType: projectResult?.projectType,
    stampField: projectResult?.stampField,
    projectReference: projectResult?.reference,
    enableContactAddress: projectResult?.enableContactAddress,
    logo: projectResult?.logo,
    backgroundImage: projectResult?.backgroundImage,
    expireDate: projectResult?.expireDate,
    enableMoreImage: projectResult?.enableMoreImage,
    enableMoreDetail: projectResult?.enableMoreDetail,
    moreDetailField: projectResult?.moreDetailField,
    moreImageField: projectResult?.moreImageField,
    textInLastSlip: projectResult?.textInLastSlip,
  );
}
