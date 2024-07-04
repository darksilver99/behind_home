// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
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

Future exportTransactionPark(
  List<TransactionListRecord> dataList,
  String month,
  String year,
) async {
  // Add your function code here!
  List<String> headerList = [
    "ทะเบียน",
    "จังหวัดทะเบียน",
    "ประเภทรถ",
    "ชื่อ",
    "จุดประสงค์",
    "ที่อยู่ที่มาติดต่อ",
    "เวลาเข้า",
    "เวลาออก",
    "เวลารวม",
    "ตราประทับ"
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
    customValue: TextCellValue('รายการ รถเข้า-ออก ประจำเดือน $month ปี $year'),
  );

  // add Header
  for (var i = 0; i < headerList.length; i++) {
    var cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 1));
    cell.value = TextCellValue(headerList[i]);
    cell.cellStyle = cellStyle;
  }

  // add Body
  //["ทะเบียน", "จังหวัดทะเบียน", "ประเภทรถ", "ชื่อ", "จุดประสงค์", "ที่อยู่ที่มาติดต่อ", "เวลาเข้า", "เวลาออก", "เวลารวม", "ตราประทับ"];
  for (int i = 0; i < dataList.length; i++) {
    var cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i + 2));
    cell.cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Left);
    cell.value = TextCellValue(dataList[i].carRegistration);

    cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i + 2));
    cell.cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Left);
    cell.value = TextCellValue(dataList[i].carRegistrationProvince);

    cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: i + 2));
    cell.cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Left);
    cell.value = TextCellValue(dataList[i].carType);

    cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: i + 2));
    cell.cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Left);
    cell.value = TextCellValue(
        '${dataList[i].preName}${dataList[i].firstName} ${dataList[i].lastName}');

    cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: i + 2));
    cell.cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Left);
    cell.value = TextCellValue(dataList[i].objective);

    cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: i + 2));
    cell.cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Left);
    cell.value = TextCellValue(
        dataList[i].contactAddress.isEmpty ? '-' : dataList[i].contactAddress);

    cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: i + 2));
    cell.cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Left);
    cell.value = TextCellValue(functions.dateTimeTh(dataList[i].dateIn!));

    cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 7, rowIndex: i + 2));
    cell.cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Left);
    cell.value = TextCellValue(dataList[i].dateOut == null
        ? '-'
        : functions.dateTimeTh(dataList[i].dateOut!));

    cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 8, rowIndex: i + 2));
    cell.cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Left);
    cell.value = TextCellValue(dataList[i].dateOut == null
        ? '-'
        : functions.getTimeDuration(dataList[i].dateIn!, dataList[i].dateOut!));

    cell = sheetObject
        .cell(CellIndex.indexByColumnRow(columnIndex: 9, rowIndex: i + 2));
    cell.cellStyle = CellStyle(horizontalAlign: HorizontalAlign.Left);
    cell.value =
        TextCellValue(dataList[i].stamp.isEmpty ? '-' : dataList[i].stamp);
  }

  // autoSize Columns
  for (int col = 0; col <= headerList.length; col++) {
    sheetObject.setDefaultColumnWidth(25);
  }

  excel.save(fileName: 'รายการรถเข้า-ออก ประจำเดือน$monthปี$year.xlsx');
}
