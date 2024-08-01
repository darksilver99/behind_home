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
import '/water_payment_view/water_payment_detail_view/water_payment_detail_view_widget.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'water_payment_page_model.dart';
export 'water_payment_page_model.dart';

class WaterPaymentPageWidget extends StatefulWidget {
  const WaterPaymentPageWidget({
    super.key,
    required this.menuName,
  });

  final String? menuName;

  @override
  State<WaterPaymentPageWidget> createState() => _WaterPaymentPageWidgetState();
}

class _WaterPaymentPageWidgetState extends State<WaterPaymentPageWidget> {
  late WaterPaymentPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => WaterPaymentPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await action_blocks.checkExpireDate(context);
      _model.startDate = functions.getStartDateOfMonth(getCurrentTimestamp);
      _model.endDate = functions.getEndDateOfMonth(getCurrentTimestamp);
      _model.dataResult = await queryWaterPaymentListRecordOnce(
        queryBuilder: (waterPaymentListRecord) => waterPaymentListRecord
            .where(
              'create_date',
              isGreaterThanOrEqualTo: _model.startDate,
            )
            .where(
              'create_date',
              isLessThanOrEqualTo: _model.endDate,
            )
            .orderBy('create_date', descending: true),
      );
      _model.dataList =
          _model.dataResult!.toList().cast<WaterPaymentListRecord>();
      _model.tmpDataList =
          _model.dataResult!.toList().cast<WaterPaymentListRecord>();
      _model.isLoading = false;
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
    context.watch<FFAppState>();

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
              widget!.menuName,
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
              SingleChildScrollView(
                child: Column(
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
                                        verticalDirection:
                                            VerticalDirection.down,
                                        clipBehavior: Clip.none,
                                        children: [
                                          FlutterFlowDropDown<String>(
                                            controller: _model
                                                    .dropDownValueController1 ??=
                                                FormFieldController<String>(
                                              _model.dropDownValue1 ??=
                                                  functions.getCurrentMonth(
                                                      getCurrentTimestamp,
                                                      FFAppConstants
                                                          .thaiMonthList
                                                          .toList()),
                                            ),
                                            options:
                                                FFAppConstants.thaiMonthList,
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                            options: functions.getYearList(
                                                getCurrentTimestamp),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                              _model.startDate = functions
                                                  .getStartDateOfMonth(functions
                                                      .getDateTimeFormat(
                                                          _model
                                                              .dropDownValue1!,
                                                          _model
                                                              .dropDownValue2!,
                                                          FFAppConstants
                                                              .thaiMonthList
                                                              .toList()));
                                              _model.endDate = functions
                                                  .getEndDateOfMonth(functions
                                                      .getDateTimeFormat(
                                                          _model
                                                              .dropDownValue1!,
                                                          _model
                                                              .dropDownValue2!,
                                                          FFAppConstants
                                                              .thaiMonthList
                                                              .toList()));
                                              _model.dataResult2 =
                                                  await queryWaterPaymentListRecordOnce(
                                                queryBuilder:
                                                    (waterPaymentListRecord) =>
                                                        waterPaymentListRecord
                                                            .where(
                                                              'create_date',
                                                              isGreaterThanOrEqualTo:
                                                                  _model
                                                                      .startDate,
                                                            )
                                                            .where(
                                                              'create_date',
                                                              isLessThanOrEqualTo:
                                                                  _model
                                                                      .endDate,
                                                            )
                                                            .orderBy(
                                                                'create_date',
                                                                descending:
                                                                    true),
                                              );
                                              _model.dataList = _model
                                                  .dataResult2!
                                                  .toList()
                                                  .cast<
                                                      WaterPaymentListRecord>();
                                              _model.tmpDataList = _model
                                                  .dataResult2!
                                                  .toList()
                                                  .cast<
                                                      WaterPaymentListRecord>();
                                              setState(() {});

                                              setState(() {});
                                            },
                                            text: 'ค้นหา',
                                            options: FFButtonOptions(
                                              height: 56.0,
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      32.0, 0.0, 32.0, 0.0),
                                              iconPadding: EdgeInsetsDirectional
                                                  .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                              color:
                                                  FlutterFlowTheme.of(context)
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
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  32.0, 0.0, 32.0, 0.0),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Expanded(
                                    child: Wrap(
                                      spacing: 0.0,
                                      runSpacing: 0.0,
                                      alignment: WrapAlignment.end,
                                      crossAxisAlignment:
                                          WrapCrossAlignment.start,
                                      direction: Axis.horizontal,
                                      runAlignment: WrapAlignment.start,
                                      verticalDirection: VerticalDirection.down,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Container(
                                          width: 300.0,
                                          child: TextFormField(
                                            controller: _model.textController,
                                            focusNode:
                                                _model.textFieldFocusNode,
                                            onChanged: (_) =>
                                                EasyDebounce.debounce(
                                              '_model.textController',
                                              Duration(milliseconds: 300),
                                              () async {
                                                if (_model.textController
                                                            .text !=
                                                        null &&
                                                    _model.textController
                                                            .text !=
                                                        '') {
                                                  _model.dataResult3 =
                                                      await actions
                                                          .filterWaterPaymentList(
                                                    _model.textController.text,
                                                    _model.tmpDataList.toList(),
                                                  );
                                                  _model.dataList = _model
                                                      .dataResult3!
                                                      .toList()
                                                      .cast<
                                                          WaterPaymentListRecord>();
                                                  setState(() {});
                                                } else {
                                                  _model.dataList = _model
                                                      .tmpDataList
                                                      .toList()
                                                      .cast<
                                                          WaterPaymentListRecord>();
                                                  setState(() {});
                                                }

                                                setState(() {});
                                              },
                                            ),
                                            autofocus: false,
                                            obscureText: false,
                                            decoration: InputDecoration(
                                              labelText:
                                                  'ระบุคำค้นหา ชื่อ, เบอร์โทร, บ้าน/ห้องเลขที่',
                                              labelStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                              hintStyle:
                                                  FlutterFlowTheme.of(context)
                                                      .labelMedium
                                                      .override(
                                                        fontFamily: 'Manrope',
                                                        letterSpacing: 0.0,
                                                      ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .alternate,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(24.0),
                                              ),
                                              filled: true,
                                              fillColor:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              prefixIcon: Icon(
                                                Icons.search_rounded,
                                                size: 24.0,
                                              ),
                                              suffixIcon: _model.textController!
                                                      .text.isNotEmpty
                                                  ? InkWell(
                                                      onTap: () async {
                                                        _model.textController
                                                            ?.clear();
                                                        if (_model.textController
                                                                    .text !=
                                                                null &&
                                                            _model.textController
                                                                    .text !=
                                                                '') {
                                                          _model.dataResult3 =
                                                              await actions
                                                                  .filterWaterPaymentList(
                                                            _model
                                                                .textController
                                                                .text,
                                                            _model.tmpDataList
                                                                .toList(),
                                                          );
                                                          _model.dataList = _model
                                                              .dataResult3!
                                                              .toList()
                                                              .cast<
                                                                  WaterPaymentListRecord>();
                                                          setState(() {});
                                                        } else {
                                                          _model.dataList = _model
                                                              .tmpDataList
                                                              .toList()
                                                              .cast<
                                                                  WaterPaymentListRecord>();
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
                                            validator: _model
                                                .textControllerValidator
                                                .asValidator(context),
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
                    ),
                    Builder(
                      builder: (context) {
                        final dataListView = _model.dataList.toList();
                        if (dataListView.isEmpty) {
                          return Center(
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.8,
                              child: NoDataViewWidget(),
                            ),
                          );
                        }

                        return FlutterFlowDataTable<WaterPaymentListRecord>(
                          controller: _model.paginatedDataTableController,
                          data: dataListView,
                          columnsBuilder: (onSortChanged) => [
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'ชื่อลูกบ้าน/ผู้เช่า',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Manrope',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'เบอร์โทรศัพท์',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Manrope',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'บ้าน/ห้อง เลขที่',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Manrope',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'วันที่แจ้งชำระ',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Manrope',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'สถานะ',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Manrope',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            DataColumn2(
                              label: DefaultTextStyle.merge(
                                softWrap: true,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        'จัดการข้อมูล',
                                        textAlign: TextAlign.center,
                                        style: FlutterFlowTheme.of(context)
                                            .labelLarge
                                            .override(
                                              fontFamily: 'Manrope',
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .info,
                                              letterSpacing: 0.0,
                                            ),
                                      ),
                                    ),
                                  ],
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
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      dataListViewItem.contactName,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      dataListViewItem.contactPhone,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      dataListViewItem.contactAddress,
                                      textAlign: TextAlign.center,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      functions.dateTimeTh(
                                          dataListViewItem.createDate),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Expanded(
                                    child: Text(
                                      functions.getDataStatus(
                                          dataListViewItem.status,
                                          FFAppState()
                                              .waterPaymentStatusList
                                              .toList()),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Manrope',
                                            color: () {
                                              if (dataListViewItem.status ==
                                                  1) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primaryText;
                                              } else if (dataListViewItem
                                                      .status ==
                                                  0) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .warning;
                                              } else if (dataListViewItem
                                                      .status ==
                                                  3) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .primary;
                                              } else if (dataListViewItem
                                                      .status ==
                                                  4) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .success;
                                              } else if (dataListViewItem
                                                      .status ==
                                                  5) {
                                                return FlutterFlowTheme.of(
                                                        context)
                                                    .error;
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
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 8.0, 0.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        await showModalBottomSheet(
                                          isScrollControlled: true,
                                          backgroundColor: Colors.transparent,
                                          enableDrag: false,
                                          context: context,
                                          builder: (context) {
                                            return GestureDetector(
                                              onTap: () => _model.unfocusNode
                                                      .canRequestFocus
                                                  ? FocusScope.of(context)
                                                      .requestFocus(
                                                          _model.unfocusNode)
                                                  : FocusScope.of(context)
                                                      .unfocus(),
                                              child: Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child:
                                                    WaterPaymentDetailViewWidget(
                                                  dataDocument:
                                                      dataListViewItem,
                                                ),
                                              ),
                                            );
                                          },
                                        ).then((value) => safeSetState(
                                            () => _model.isUpdate = value));

                                        if ((_model.isUpdate != null &&
                                                _model.isUpdate != '') &&
                                            (_model.isUpdate == 'update')) {
                                          _model.dataResult4 =
                                              await queryWaterPaymentListRecordOnce(
                                            queryBuilder:
                                                (waterPaymentListRecord) =>
                                                    waterPaymentListRecord
                                                        .where(
                                                          'create_date',
                                                          isGreaterThanOrEqualTo:
                                                              _model.startDate,
                                                        )
                                                        .where(
                                                          'create_date',
                                                          isLessThanOrEqualTo:
                                                              _model.endDate,
                                                        )
                                                        .orderBy('create_date',
                                                            descending: true),
                                          );
                                          _model.dataList = _model.dataResult4!
                                              .toList()
                                              .cast<WaterPaymentListRecord>();
                                          _model.tmpDataList = _model
                                              .dataResult4!
                                              .toList()
                                              .cast<WaterPaymentListRecord>();
                                          _model.isLoading = false;
                                          setState(() {});
                                        }

                                        setState(() {});
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
                                  if (false)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        var confirmDialogResponse =
                                            await showDialog<bool>(
                                                  context: context,
                                                  builder:
                                                      (alertDialogContext) {
                                                    return AlertDialog(
                                                      title: Text(
                                                          'ต้องการลบข้อมูล?'),
                                                      actions: [
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  false),
                                                          child: Text('ยกเลิก'),
                                                        ),
                                                        TextButton(
                                                          onPressed: () =>
                                                              Navigator.pop(
                                                                  alertDialogContext,
                                                                  true),
                                                          child: Text('ยืนยัน'),
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ) ??
                                                false;
                                        if (confirmDialogResponse) {
                                          await dataListViewItem.reference
                                              .delete();
                                          _model.dataResult6 =
                                              await queryWaterPaymentListRecordOnce(
                                            queryBuilder:
                                                (waterPaymentListRecord) =>
                                                    waterPaymentListRecord
                                                        .where(
                                                          'create_date',
                                                          isGreaterThanOrEqualTo:
                                                              _model.startDate,
                                                        )
                                                        .where(
                                                          'create_date',
                                                          isLessThanOrEqualTo:
                                                              _model.endDate,
                                                        )
                                                        .orderBy('create_date',
                                                            descending: true),
                                          );
                                          _model.dataList = _model.dataResult6!
                                              .toList()
                                              .cast<WaterPaymentListRecord>();
                                          _model.tmpDataList = _model
                                              .dataResult6!
                                              .toList()
                                              .cast<WaterPaymentListRecord>();
                                          _model.isLoading = false;
                                          setState(() {});
                                        }

                                        setState(() {});
                                      },
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.delete_rounded,
                                            color: FlutterFlowTheme.of(context)
                                                .error,
                                            size: 24.0,
                                          ),
                                          Text(
                                            'ลบข้อมูล',
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
                                ],
                              ),
                            ].map((c) => DataCell(c)).toList(),
                          ),
                          emptyBuilder: () => Center(
                            child: Container(
                              height: MediaQuery.sizeOf(context).height * 0.8,
                              child: NoDataViewWidget(),
                            ),
                          ),
                          paginated: true,
                          selectable: false,
                          hidePaginator: false,
                          showFirstLastButtons: false,
                          height: 600.0,
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
                  ],
                ),
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
