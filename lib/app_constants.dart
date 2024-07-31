import 'package:flutter/material.dart';
import 'flutter_flow/flutter_flow_util.dart';

abstract class FFAppConstants {
  static const int pageSize = 10;
  static const List<String> thaiMonthList = [
    'มกราคม',
    'กุมภาพันธ์',
    'มีนาคม',
    'เมษายน',
    'พฤษภาคม',
    'มิถุนายน',
    'กรกฎาคม',
    'สิงหาคม',
    'กันยายน',
    'ตุลาคม',
    'พฤศจิกายน',
    'ธันวาคม'
  ];
  static const double buttonHeigth = 48.0;
  static const String imageUploadSuggestText =
      '*รองรับไฟล์สกุล jpg, jpeg, png ขนาดไม่เกิน 10MB';
  static const int fileSizeLimit = 10485760;
  static const String fileUploadSuggestText =
      '*รองรับไฟล์สกุล txt, pdf, doc, docx, xlsx, xls, jpg, jpeg, png ขนาดไม่เกิน 10MB';
  static const List<String> fileExtAllowList = [
    'txt',
    'pdf',
    'doc',
    'docx',
    'xlsx',
    'xls',
    'jpg',
    'jpeg',
    'png'
  ];
  static const List<String> imageExtAllowList = ['jpg', 'jpeg', 'png'];
  static const int imageSizeLimit = 5242880;
  static const int imageLimit = 3;
}
