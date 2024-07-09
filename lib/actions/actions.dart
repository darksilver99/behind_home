import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
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
    promotionImage: projectResult?.promotionImage,
    paymentDetailImage: projectResult?.paymentDetailImage,
    paymentAlertText: projectResult?.paymentAlertText,
  );
}

Future getConfigData(BuildContext context) async {
  ConfigRecord? configResult;

  configResult =
      await ConfigRecord.getDocumentOnce(functions.configReference());
  FFAppState().configData = ConfigDataStruct(
    ocrApi: configResult?.ocrApi,
    defaultStampField: configResult?.defaultStampField,
    defaultCarList: configResult?.defaultCarList,
    defaultStampList: configResult?.defaultStampList,
    defaultObjectiveList: configResult?.defaultObjectiveList,
    projectType: configResult?.projectType,
    ocrAlertText: configResult?.ocrAlertText,
    ocrErrorText: configResult?.ocrErrorText,
    provinceList: configResult?.provinceList,
    defaultBackgroundImage: configResult?.defaultBackgroundImage,
    guideImagePath: configResult?.guideImagePath,
    promotionDefaultImage: configResult?.promotionDefaultImage,
  );
}
