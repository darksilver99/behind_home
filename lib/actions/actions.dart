import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/component_view/expire_alert_view/expire_alert_view_widget.dart';
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

Future checkExpireDate(BuildContext context) async {
  if (functions.getStartDayTime(getCurrentTimestamp) !=
      functions.getStartDayTime(FFAppState().currentDate!)) {
    FFAppState().currentDate = functions.getStartDayTime(getCurrentTimestamp);
    FFAppState().isSkipExpireAlert = false;
  }
  if (getCurrentTimestamp > FFAppState().projectData.expireDate!) {
    if (Navigator.of(context).canPop()) {
      context.pop();
    }
    context.pushNamed('PaymentAlertPage');
  } else {
    if (getCurrentTimestamp >
        functions.getBeforeDay(5, FFAppState().projectData.expireDate!)) {
      if (!FFAppState().isSkipExpireAlert) {
        await showDialog(
          context: context,
          builder: (dialogContext) {
            return Dialog(
              elevation: 0,
              insetPadding: EdgeInsets.zero,
              backgroundColor: Colors.transparent,
              alignment: AlignmentDirectional(0.0, 0.0)
                  .resolve(Directionality.of(context)),
              child: ExpireAlertViewWidget(),
            );
          },
        );
      }
    }
  }
}
