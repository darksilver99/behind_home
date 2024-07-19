import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'count_alert_view_model.dart';
export 'count_alert_view_model.dart';

class CountAlertViewWidget extends StatefulWidget {
  const CountAlertViewWidget({
    super.key,
    required this.pathName,
  });

  final String? pathName;

  @override
  State<CountAlertViewWidget> createState() => _CountAlertViewWidgetState();
}

class _CountAlertViewWidgetState extends State<CountAlertViewWidget> {
  late CountAlertViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CountAlertViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (widget!.pathName == 'IssueProjectPage') {
        _model.total = await queryIssueProjectListRecordCount(
          queryBuilder: (issueProjectListRecord) =>
              issueProjectListRecord.where(
            'status',
            isEqualTo: 0,
          ),
        );
        _model.totalAlert = _model.total!;
        setState(() {});
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _model.totalAlert > 0,
      child: Container(
        width: 24.0,
        height: 24.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).error,
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Align(
                alignment: AlignmentDirectional(0.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(2.0, 0.0, 2.0, 0.0),
                  child: Text(
                    '99',
                    maxLines: 1,
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Manrope',
                          color: FlutterFlowTheme.of(context).info,
                          fontSize: 12.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
