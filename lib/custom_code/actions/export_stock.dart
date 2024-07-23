// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:excel/excel.dart';
import 'package:excel/excel.dart' as exBorder;
import '/flutter_flow/custom_functions.dart' as functions;

Future exportStock(
  List<StockListRecord> dataList,
  String month,
  String year,
) async {
  // Add your function code here!
  List<String> headerList = [
    "หมายเลขพัสดุ",
    "วันที่รับพัสดุเข้าระบบ",
    "วันที่จ่ายพัสดุ",
    "บ้าน/ห้องเลขที่",
    "รายละเอียด",
    "สถานะพัสดุ"
  ];

  // config
  var excel = Excel.createExcel();
  Sheet sheetObject = excel['Sheet1'];

  CellStyle cellStyle = CellStyle(
    backgroundColorHex: ExcelColor.orange,
    horizontalAlign: HorizontalAlign.Center,
    bold: true,
    leftBorder: exBorder.Border(borderStyle: exBorder.BorderStyle.Thin),
    rightBorder: exBorder.Border(borderStyle: exBorder.BorderStyle.Thin),
    topBorder: exBorder.Border(borderStyle: exBorder.BorderStyle.Thin),
    bottomBorder: exBorder.Border(borderStyle: exBorder.BorderStyle.Thin),
  );
  sheetObject.merge(
    CellIndex.indexByString('A1'),
    CellIndex.indexByString('C1'),
    customValue: TextCellValue('รายการพัสดุ ประจำเดือน $month ปี $year'),
  );

  // add Header
  for (var i = 0; i < headerList.length; i++) {
    var cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 1));
    cell.value = TextCellValue(headerList[i]);
    cell.cellStyle = cellStyle;
  }

  // add Body
  for (int i = 0; i < dataList.length; i++) {
    var cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i + 2));
    cell.cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Left);
    cell.value = TextCellValue(dataList[i].stockNumber);

    cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i + 2));
    cell.cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Left);
    cell.value = TextCellValue(functions.dateTimeTh(dataList[i].createDate));

    cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: i + 2));
    cell.cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Left);
    cell.value = TextCellValue(functions.dateTimeTh(dataList[i].receiveDate));

    cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: i + 2));
    cell.cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Left);
    cell.value = TextCellValue(dataList[i].contactAddress);

    cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: i + 2));
    cell.cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Left);
    cell.value =
        TextCellValue(dataList[i].detail != '' ? dataList[i].detail : '-');

    cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: i + 2));
    cell.cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Left);
    cell.value = TextCellValue(functions.getStockStatus(
        dataList[i].status, FFAppState().stockStatusList.toList()));
  }

  // autoSize Columns
  for (int col = 0; col <= headerList.length; col++) {
    sheetObject.setDefaultColumnWidth(25);
  }

  excel.save(fileName: 'รายการพัสดุ ประจำเดือน$monthปี$year.xlsx');
}
