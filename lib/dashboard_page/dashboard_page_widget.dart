import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component_view/menu_toggle_view/menu_toggle_view_widget.dart';
import '/component_view/menu_view/menu_view_widget.dart';
import '/flutter_flow/flutter_flow_charts.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'dashboard_page_model.dart';
export 'dashboard_page_model.dart';

class DashboardPageWidget extends StatefulWidget {
  const DashboardPageWidget({super.key});

  @override
  State<DashboardPageWidget> createState() => _DashboardPageWidgetState();
}

class _DashboardPageWidgetState extends State<DashboardPageWidget> {
  late DashboardPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => DashboardPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      Function() _navigate = () {};
      _model.projectResult = await queryProjectListRecordOnce(
        queryBuilder: (projectListRecord) => projectListRecord.where(
          'create_by',
          isEqualTo: currentUserReference,
        ),
        singleRecord: true,
      ).then((s) => s.firstOrNull);
      if (_model.projectResult?.reference != null) {
        await action_blocks.createProjectData(
          context,
          projectResult: _model.projectResult,
        );
        _model.isLoading = false;
        setState(() {});
      } else {
        await showDialog(
          context: context,
          builder: (alertDialogContext) {
            return AlertDialog(
              title: Text('ขออภัย ยังไม่มีโครงการ'),
              content: Text('กรุณาสร้างโครงการผ่านแอปก่อน'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(alertDialogContext),
                  child: Text('ตกลง'),
                ),
              ],
            );
          },
        );
        GoRouter.of(context).prepareAuthEvent();
        await authManager.signOut();
        GoRouter.of(context).clearRedirectLocation();

        _navigate = () => context.goNamedAuth('LoginPage', context.mounted);
      }

      _navigate();
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        drawer: Drawer(
          elevation: 16.0,
          child: wrapWithModel(
            model: _model.menuViewModel,
            updateCallback: () => setState(() {}),
            child: MenuViewWidget(),
          ),
        ),
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Text(
            'Dashboard',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Urbanist',
                  color: Colors.white,
                  fontSize: 22.0,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (!_model.isLoading)
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16.0, 0.0, 16.0, 8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 8.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Text(
                                          'ข้อมูลรถเข้า-ออก',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Manrope',
                                                fontSize: 22.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                              ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          child: Wrap(
                                            spacing: 32.0,
                                            runSpacing: 32.0,
                                            alignment: WrapAlignment.start,
                                            crossAxisAlignment:
                                                WrapCrossAlignment.start,
                                            direction: Axis.horizontal,
                                            runAlignment: WrapAlignment.start,
                                            verticalDirection:
                                                VerticalDirection.down,
                                            clipBehavior: Clip.none,
                                            children: [
                                              Material(
                                                color: Colors.transparent,
                                                elevation: 3.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: Container(
                                                  width: 300.0,
                                                  height: 300.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.asset(
                                                          'assets/images/car_12568782.png',
                                                          width: 64.0,
                                                          height: 64.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Text(
                                                          'จำนวนรถเข้าวันนี้',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                fontSize: 22.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                      FutureBuilder<int>(
                                                        future:
                                                            queryTransactionListRecordCount(
                                                          queryBuilder:
                                                              (transactionListRecord) =>
                                                                  transactionListRecord
                                                                      .where(
                                                                        'date_in',
                                                                        isGreaterThanOrEqualTo:
                                                                            functions.getStartDayTime(getCurrentTimestamp),
                                                                      )
                                                                      .where(
                                                                        'date_in',
                                                                        isLessThanOrEqualTo:
                                                                            functions.getEndDayTime(getCurrentTimestamp),
                                                                      ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          int textCount =
                                                              snapshot.data!;
                                                          return Text(
                                                            valueOrDefault<
                                                                String>(
                                                              formatNumber(
                                                                textCount,
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .automatic,
                                                              ),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  fontSize:
                                                                      48.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Material(
                                                color: Colors.transparent,
                                                elevation: 3.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: Container(
                                                  width: 300.0,
                                                  height: 300.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.asset(
                                                          'assets/images/car_12568818.png',
                                                          width: 64.0,
                                                          height: 64.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Text(
                                                          'จำนวนรถค้างทั้งหมด',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                fontSize: 22.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                      FutureBuilder<int>(
                                                        future:
                                                            queryTransactionListRecordCount(
                                                          queryBuilder:
                                                              (transactionListRecord) =>
                                                                  transactionListRecord
                                                                      .where(
                                                            'is_out',
                                                            isEqualTo: false,
                                                          ),
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          int textCount =
                                                              snapshot.data!;
                                                          return Text(
                                                            valueOrDefault<
                                                                String>(
                                                              formatNumber(
                                                                textCount,
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .automatic,
                                                              ),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  fontSize:
                                                                      48.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Material(
                                                color: Colors.transparent,
                                                elevation: 3.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: Container(
                                                  width: 300.0,
                                                  height: 300.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(0.0),
                                                        child: Image.asset(
                                                          'assets/images/car_12568782.png',
                                                          width: 64.0,
                                                          height: 64.0,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0.0,
                                                                    0.0,
                                                                    0.0,
                                                                    16.0),
                                                        child: Text(
                                                          'จำนวนรถเข้าทั้งหมด',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Manrope',
                                                                fontSize: 22.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                        ),
                                                      ),
                                                      FutureBuilder<int>(
                                                        future:
                                                            queryTransactionListRecordCount(),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  valueColor:
                                                                      AlwaysStoppedAnimation<
                                                                          Color>(
                                                                    FlutterFlowTheme.of(
                                                                            context)
                                                                        .primary,
                                                                  ),
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          int textCount =
                                                              snapshot.data!;
                                                          return Text(
                                                            valueOrDefault<
                                                                String>(
                                                              formatNumber(
                                                                textCount,
                                                                formatType:
                                                                    FormatType
                                                                        .decimal,
                                                                decimalType:
                                                                    DecimalType
                                                                        .automatic,
                                                              ),
                                                              '0',
                                                            ),
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  fontSize:
                                                                      48.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          );
                                                        },
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Material(
                                                color: Colors.transparent,
                                                elevation: 3.0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          24.0),
                                                ),
                                                child: Container(
                                                  width: 970.0,
                                                  height: 300.0,
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            24.0),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: Column(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      0.0,
                                                                      0.0,
                                                                      0.0,
                                                                      16.0),
                                                          child: Text(
                                                            'จำนวนรถเข้าย้อนหลัง 7 วัน',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Manrope',
                                                                  fontSize:
                                                                      22.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width:
                                                              double.infinity,
                                                          height: 200.0,
                                                          child:
                                                              FlutterFlowBarChart(
                                                            barData: [
                                                              FFBarChartData(
                                                                yData: _model
                                                                    .valueList,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primary,
                                                              )
                                                            ],
                                                            xLabels:
                                                                _model.dateList,
                                                            barWidth: 16.0,
                                                            barBorderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        8.0),
                                                            groupSpace: 8.0,
                                                            alignment:
                                                                BarChartAlignment
                                                                    .spaceAround,
                                                            chartStylingInfo:
                                                                ChartStylingInfo(
                                                              enableTooltip:
                                                                  true,
                                                              backgroundColor:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryBackground,
                                                              showBorder: false,
                                                            ),
                                                            axisBounds:
                                                                AxisBounds(),
                                                            xAxisLabelInfo:
                                                                AxisLabelInfo(
                                                              title: 'วัน',
                                                              titleTextStyle:
                                                                  TextStyle(
                                                                fontSize: 14.0,
                                                              ),
                                                              reservedSize:
                                                                  28.0,
                                                            ),
                                                            yAxisLabelInfo:
                                                                AxisLabelInfo(
                                                              title:
                                                                  'จำนวนรถเข้า',
                                                              titleTextStyle:
                                                                  TextStyle(
                                                                fontSize: 14.0,
                                                              ),
                                                              reservedSize:
                                                                  42.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ]
                            .addToStart(SizedBox(height: 64.0))
                            .addToEnd(SizedBox(height: 16.0)),
                      ),
                    ),
                  ),
                ],
              ),
              wrapWithModel(
                model: _model.menuToggleViewModel,
                updateCallback: () => setState(() {}),
                child: MenuToggleViewWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
