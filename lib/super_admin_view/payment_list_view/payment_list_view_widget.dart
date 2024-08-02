import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component_view/drop_down_payment_status_view/drop_down_payment_status_view_widget.dart';
import '/component_view/no_data_view/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'payment_list_view_model.dart';
export 'payment_list_view_model.dart';

class PaymentListViewWidget extends StatefulWidget {
  const PaymentListViewWidget({
    super.key,
    this.dataDocument,
    required this.title,
  });

  final ProjectListRecord? dataDocument;
  final String? title;

  @override
  State<PaymentListViewWidget> createState() => _PaymentListViewWidgetState();
}

class _PaymentListViewWidgetState extends State<PaymentListViewWidget> {
  late PaymentListViewModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PaymentListViewModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.paymetListResult = await queryPaymentListRecordOnce(
        queryBuilder: (paymentListRecord) => paymentListRecord
            .where(
              'create_project_ref',
              isEqualTo: widget!.dataDocument?.reference,
            )
            .orderBy('create_date', descending: true),
      );
      _model.paymentList =
          _model.paymetListResult!.toList().cast<PaymentListRecord>();
      _model.isLoading = false;
      setState(() {});
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
    context.watch<FFAppState>();

    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 0.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      valueOrDefault<String>(
                        widget!.title,
                        '-',
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Manrope',
                            fontSize: 22.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ),
                  InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 36.0,
                    ),
                  ),
                ],
              ),
            ),
            if (!_model.isLoading)
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Builder(
                    builder: (context) {
                      final paymentListView =
                          _model.paymetListResult?.toList() ?? [];
                      if (paymentListView.isEmpty) {
                        return NoDataViewWidget();
                      }

                      return FlutterFlowDataTable<PaymentListRecord>(
                        controller: _model.paginatedDataTableController,
                        data: paymentListView,
                        columnsBuilder: (onSortChanged) => [
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'วันที่โอนเงิน',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'จ่ายจาก',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'หลักฐานการโอนเงิน',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                          DataColumn2(
                            label: DefaultTextStyle.merge(
                              softWrap: true,
                              child: Text(
                                'สถานะ',
                                style: FlutterFlowTheme.of(context)
                                    .labelLarge
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context).info,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                          ),
                        ],
                        dataRowBuilder: (paymentListViewItem,
                                paymentListViewIndex,
                                selected,
                                onSelectChanged) =>
                            DataRow(
                          color: MaterialStateProperty.all(
                            paymentListViewIndex % 2 == 0
                                ? FlutterFlowTheme.of(context)
                                    .secondaryBackground
                                : FlutterFlowTheme.of(context)
                                    .primaryBackground,
                          ),
                          cells: [
                            Text(
                              functions
                                  .dateTimeTh(paymentListViewItem.createDate),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Text(
                              paymentListViewItem.payFrom,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Manrope',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                await launchURL(functions.imageToString(
                                    paymentListViewItem.slipImage));
                              },
                              child: Text(
                                'ตรวจสอบ',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      color: FlutterFlowTheme.of(context).link,
                                      letterSpacing: 0.0,
                                      decoration: TextDecoration.underline,
                                    ),
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 8.0, 0.0),
                                  child: Text(
                                    functions.getDataStatus(
                                        paymentListViewItem.status,
                                        FFAppState()
                                            .paymentStatusList
                                            .toList()),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          color: () {
                                            if (paymentListViewItem.status ==
                                                0) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .warning;
                                            } else if (paymentListViewItem
                                                    .status ==
                                                1) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .success;
                                            } else if (paymentListViewItem
                                                    .status ==
                                                3) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .error;
                                            } else if (paymentListViewItem
                                                    .status ==
                                                4) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .link;
                                            } else if (paymentListViewItem
                                                    .status ==
                                                5) {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .tertiary;
                                            } else {
                                              return FlutterFlowTheme.of(
                                                      context)
                                                  .primaryText;
                                            }
                                          }(),
                                          letterSpacing: 0.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                ),
                                Builder(
                                  builder: (context) => InkWell(
                                    splashColor: Colors.transparent,
                                    focusColor: Colors.transparent,
                                    hoverColor: Colors.transparent,
                                    highlightColor: Colors.transparent,
                                    onTap: () async {
                                      await showDialog(
                                        context: context,
                                        builder: (dialogContext) {
                                          return Dialog(
                                            elevation: 0,
                                            insetPadding: EdgeInsets.zero,
                                            backgroundColor: Colors.transparent,
                                            alignment: AlignmentDirectional(
                                                    0.0, 0.0)
                                                .resolve(
                                                    Directionality.of(context)),
                                            child:
                                                DropDownPaymentStatusViewWidget(
                                              currentStatus:
                                                  paymentListViewItem.status,
                                            ),
                                          );
                                        },
                                      ).then((value) => safeSetState(
                                          () => _model.isUpdate = value));

                                      if (_model.isUpdate != null) {
                                        await paymentListViewItem.reference
                                            .update(createPaymentListRecordData(
                                          status: _model.isUpdate,
                                          updateDate: getCurrentTimestamp,
                                          updateBy: currentUserReference,
                                        ));
                                        Navigator.pop(context);
                                      }

                                      setState(() {});
                                    },
                                    child: Text(
                                      'เปลี่ยน',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: FlutterFlowTheme.of(context)
                                                .link,
                                            letterSpacing: 0.0,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ].map((c) => DataCell(c)).toList(),
                        ),
                        emptyBuilder: () => NoDataViewWidget(),
                        paginated: true,
                        selectable: false,
                        hidePaginator: false,
                        showFirstLastButtons: false,
                        minWidth: 800.0,
                        headingRowHeight: 56.0,
                        dataRowHeight: 48.0,
                        columnSpacing: 20.0,
                        headingRowColor: FlutterFlowTheme.of(context).link,
                        borderRadius: BorderRadius.circular(8.0),
                        addHorizontalDivider: true,
                        addTopAndBottomDivider: false,
                        hideDefaultHorizontalDivider: true,
                        horizontalDividerColor:
                            FlutterFlowTheme.of(context).secondaryBackground,
                        horizontalDividerThickness: 1.0,
                        addVerticalDivider: false,
                      );
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
