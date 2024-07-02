import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/component_view/loading_view/loading_view_widget.dart';
import '/component_view/menu_toggle_view/menu_toggle_view_widget.dart';
import '/component_view/menu_view/menu_view_widget.dart';
import '/component_view/no_data_view/no_data_view_widget.dart';
import '/flutter_flow/flutter_flow_data_table.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/park_view/park_detail_view/park_detail_view_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'park_page_model.dart';
export 'park_page_model.dart';

class ParkPageWidget extends StatefulWidget {
  const ParkPageWidget({
    super.key,
    required this.collectionName,
    required this.menuName,
  });

  final String? collectionName;
  final String? menuName;

  @override
  State<ParkPageWidget> createState() => _ParkPageWidgetState();
}

class _ParkPageWidgetState extends State<ParkPageWidget> {
  late ParkPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ParkPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.startDate = functions.getStartDateOfMonth(getCurrentTimestamp);
      _model.endDate = functions.getEndDateOfMonth(getCurrentTimestamp);
      _model.dataResult = await queryTransactionListRecordOnce(
        queryBuilder: (transactionListRecord) => transactionListRecord
            .where(
              'date_in',
              isGreaterThanOrEqualTo: _model.startDate,
            )
            .where(
              'date_in',
              isLessThanOrEqualTo: _model.endDate,
            )
            .orderBy('date_in', descending: true),
      );
      _model.dataList =
          _model.dataResult!.toList().cast<TransactionListRecord>();
      _model.tmpDataList =
          _model.dataResult!.toList().cast<TransactionListRecord>();
      setState(() {});
    });

    _model.textController ??= TextEditingController();
    _model.textFieldFocusNode ??= FocusNode();

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
            valueOrDefault<String>(
              widget.menuName,
              '-',
            ),
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
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 16.0),
                    child: Container(
                      decoration: BoxDecoration(),
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
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        32.0, 0.0, 32.0, 8.0),
                                    child: Wrap(
                                      spacing: 8.0,
                                      runSpacing: 8.0,
                                      alignment: WrapAlignment.start,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownValueController1 ??=
                                              FormFieldController<String>(
                                            _model.dropDownValue1 ??=
                                                functions.getCurrentMonth(
                                                    getCurrentTimestamp,
                                                    FFAppConstants.thaiMonthList
                                                        .toList()),
                                          ),
                                          options: FFAppConstants.thaiMonthList,
                                          onChanged: (val) => setState(() =>
                                              _model.dropDownValue1 = val),
                                          width: 300.0,
                                          height: 56.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Manrope',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: 'เลือกเดือน',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isOverButton: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                        FlutterFlowDropDown<String>(
                                          controller: _model
                                                  .dropDownValueController2 ??=
                                              FormFieldController<String>(
                                            _model.dropDownValue2 ??=
                                                functions.getCurrentYear(
                                                    getCurrentTimestamp),
                                          ),
                                          options: functions
                                              .getYearList(getCurrentTimestamp),
                                          onChanged: (val) => setState(() =>
                                              _model.dropDownValue2 = val),
                                          width: 300.0,
                                          height: 56.0,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyMedium
                                                  .override(
                                                    fontFamily: 'Manrope',
                                                    letterSpacing: 0.0,
                                                  ),
                                          hintText: 'เลือกปี',
                                          icon: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          fillColor:
                                              FlutterFlowTheme.of(context)
                                                  .secondaryBackground,
                                          elevation: 2.0,
                                          borderColor:
                                              FlutterFlowTheme.of(context)
                                                  .alternate,
                                          borderWidth: 2.0,
                                          borderRadius: 8.0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16.0, 4.0, 16.0, 4.0),
                                          hidesUnderline: true,
                                          isOverButton: true,
                                          isSearchable: false,
                                          isMultiSelect: false,
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            if (_model.dataList.isNotEmpty) {
                                              _model
                                                  .paginatedDataTableController
                                                  .paginatorController
                                                  .goToFirstPage();
                                            }
                                            _model.startDate =
                                                functions.getStartDateOfMonth(
                                                    functions.getDateTimeFormat(
                                                        _model.dropDownValue1!,
                                                        _model.dropDownValue2!,
                                                        FFAppConstants
                                                            .thaiMonthList
                                                            .toList()));
                                            _model.endDate =
                                                functions.getEndDateOfMonth(
                                                    functions.getDateTimeFormat(
                                                        _model.dropDownValue1!,
                                                        _model.dropDownValue2!,
                                                        FFAppConstants
                                                            .thaiMonthList
                                                            .toList()));
                                            _model.dataResult2 =
                                                await queryTransactionListRecordOnce(
                                              queryBuilder:
                                                  (transactionListRecord) =>
                                                      transactionListRecord
                                                          .where(
                                                            'date_in',
                                                            isGreaterThanOrEqualTo:
                                                                _model
                                                                    .startDate,
                                                          )
                                                          .where(
                                                            'date_in',
                                                            isLessThanOrEqualTo:
                                                                _model.endDate,
                                                          )
                                                          .orderBy('date_in',
                                                              descending: true),
                                            );
                                            _model.dataList = _model
                                                .dataResult2!
                                                .toList()
                                                .cast<TransactionListRecord>();
                                            _model.tmpDataList = _model
                                                .dataResult2!
                                                .toList()
                                                .cast<TransactionListRecord>();
                                            setState(() {});

                                            setState(() {});
                                          },
                                          text: 'ค้นหา',
                                          options: FFButtonOptions(
                                            height: 56.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    32.0, 0.0, 32.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        FFButtonWidget(
                                          onPressed: () async {
                                            if (_model.dataList.isNotEmpty) {
                                              _model.isLoading = true;
                                              setState(() {});
                                              await Future.delayed(
                                                  const Duration(
                                                      milliseconds: 2000));
                                              await actions.exportExcel(
                                                _model.dataList.toList(),
                                              );
                                              _model.isLoading = false;
                                              setState(() {});
                                            }
                                          },
                                          text: 'Export Excel',
                                          options: FFButtonOptions(
                                            height: 56.0,
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    32.0, 0.0, 32.0, 0.0),
                                            iconPadding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .success,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Manrope',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 8.0, 0.0),
                                child: Container(
                                  width: 300.0,
                                  child: TextFormField(
                                    controller: _model.textController,
                                    focusNode: _model.textFieldFocusNode,
                                    onChanged: (_) => EasyDebounce.debounce(
                                      '_model.textController',
                                      Duration(milliseconds: 300),
                                      () async {
                                        if (_model.textController.text !=
                                                null &&
                                            _model.textController.text != '') {
                                          _model.dataResult3 =
                                              await actions.filterDataList(
                                            _model.textController.text,
                                            _model.dataList.toList(),
                                          );
                                          _model.dataList = _model.dataResult3!
                                              .toList()
                                              .cast<TransactionListRecord>();
                                          setState(() {});
                                        } else {
                                          _model.dataList = _model.tmpDataList
                                              .toList()
                                              .cast<TransactionListRecord>();
                                          setState(() {});
                                        }

                                        setState(() {});
                                      },
                                    ),
                                    autofocus: false,
                                    obscureText: false,
                                    decoration: InputDecoration(
                                      labelText: 'ระบุคำค้นหา ชื่อ, ทะเบียนรถ',
                                      labelStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                      hintStyle: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                      enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .alternate,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      errorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      focusedErrorBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                          width: 1.0,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                      ),
                                      filled: true,
                                      fillColor:
                                          FlutterFlowTheme.of(context).info,
                                      prefixIcon: Icon(
                                        Icons.search_rounded,
                                        size: 24.0,
                                      ),
                                      suffixIcon: _model
                                              .textController!.text.isNotEmpty
                                          ? InkWell(
                                              onTap: () async {
                                                _model.textController?.clear();
                                                if (_model.textController
                                                            .text !=
                                                        null &&
                                                    _model.textController
                                                            .text !=
                                                        '') {
                                                  _model.dataResult3 =
                                                      await actions
                                                          .filterDataList(
                                                    _model.textController.text,
                                                    _model.dataList.toList(),
                                                  );
                                                  _model.dataList = _model
                                                      .dataResult3!
                                                      .toList()
                                                      .cast<
                                                          TransactionListRecord>();
                                                  setState(() {});
                                                } else {
                                                  _model.dataList = _model
                                                      .tmpDataList
                                                      .toList()
                                                      .cast<
                                                          TransactionListRecord>();
                                                  setState(() {});
                                                }

                                                setState(() {});
                                                setState(() {});
                                              },
                                              child: Icon(
                                                Icons.clear,
                                                size: 24.0,
                                              ),
                                            )
                                          : null,
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyMedium
                                        .override(
                                          fontFamily: 'Manrope',
                                          letterSpacing: 0.0,
                                        ),
                                    validator: _model.textControllerValidator
                                        .asValidator(context),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        final dataListView = _model.dataList.toList();
                        if (dataListView.isEmpty) {
                          return NoDataViewWidget();
                        }
                        return FlutterFlowDataTable<TransactionListRecord>(
                          controller: _model.paginatedDataTableController,
                          data: dataListView,
                          columnsBuilder: (onSortChanged) => [
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Text(
                                  'วันเวลาเข้า-ออก',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Manrope',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Text(
                                  'ระยะเวลา',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Manrope',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Text(
                                  'ชื่อ-สกุลผู้มาติดต่อ',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Manrope',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Text(
                                  'ทะเบียนรถ',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Manrope',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Text(
                                  'วัตถุประสงค์',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Manrope',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Text(
                                  'ประเภทรถ',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Manrope',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Text(
                                  'จัดการข้อมูล',
                                  style: FlutterFlowTheme.of(context)
                                      .labelLarge
                                      .override(
                                        fontFamily: 'Manrope',
                                        color:
                                            FlutterFlowTheme.of(context).info,
                                        letterSpacing: 0.0,
                                      ),
                                ),
                              ),
                            ),
                          ],
                          dataRowBuilder: (dataListViewItem, dataListViewIndex,
                                  selected, onSelectChanged) =>
                              DataRow(
                            color: MaterialStateProperty.all(
                              dataListViewIndex % 2 == 0
                                  ? FlutterFlowTheme.of(context)
                                      .secondaryBackground
                                  : FlutterFlowTheme.of(context)
                                      .primaryBackground,
                            ),
                            cells: [
                              Builder(
                                builder: (context) {
                                  if (dataListViewItem.dateOut != null) {
                                    return Text(
                                      '${dateTimeFormat('d/M/y', dataListViewItem.dateIn)} ${dateTimeFormat('Hm', dataListViewItem.dateIn)} - ${dateTimeFormat('d/M/y', dataListViewItem.dateOut)} ${dateTimeFormat('Hm', dataListViewItem.dateOut)}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                    );
                                  } else {
                                    return Text(
                                      '${dateTimeFormat('d/M/y', dataListViewItem.dateIn)} ${dateTimeFormat('Hm', dataListViewItem.dateIn)}',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                    );
                                  }
                                },
                              ),
                              Builder(
                                builder: (context) {
                                  if (dataListViewItem.dateOut != null) {
                                    return Text(
                                      functions.getTimeDuration(
                                          dataListViewItem.dateIn!,
                                          dataListViewItem.dateOut!),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                    );
                                  } else {
                                    return Text(
                                      functions.getTimeDuration(
                                          dataListViewItem.dateIn!,
                                          getCurrentTimestamp),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                    );
                                  }
                                },
                              ),
                              Text(
                                '${dataListViewItem.preName}${dataListViewItem.firstName} ${dataListViewItem.lastName}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                '${dataListViewItem.carRegistration} ${dataListViewItem.carRegistrationProvince}',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                dataListViewItem.objective,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                dataListViewItem.carType,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Manrope',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
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
                                              backgroundColor:
                                                  Colors.transparent,
                                              alignment:
                                                  AlignmentDirectional(0.0, 0.0)
                                                      .resolve(
                                                          Directionality.of(
                                                              context)),
                                              child: GestureDetector(
                                                onTap: () => _model.unfocusNode
                                                        .canRequestFocus
                                                    ? FocusScope.of(context)
                                                        .requestFocus(
                                                            _model.unfocusNode)
                                                    : FocusScope.of(context)
                                                        .unfocus(),
                                                child: ParkDetailViewWidget(
                                                  transactionDocument:
                                                      dataListViewItem,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => setState(() {}));
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.remove_red_eye_sharp,
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            size: 24.0,
                                          ),
                                          Text(
                                            'ดูข้อมูล',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Manrope',
                                                  fontSize: 8.0,
                                                  letterSpacing: 0.0,
                                                ),
                                          ),
                                        ],
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
                          headingRowColor: FlutterFlowTheme.of(context).primary,
                          borderRadius: BorderRadius.circular(0.0),
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
                ],
              ),
              wrapWithModel(
                model: _model.menuToggleViewModel,
                updateCallback: () => setState(() {}),
                child: MenuToggleViewWidget(),
              ),
              if (_model.isLoading)
                wrapWithModel(
                  model: _model.loadingViewModel,
                  updateCallback: () => setState(() {}),
                  child: LoadingViewWidget(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
