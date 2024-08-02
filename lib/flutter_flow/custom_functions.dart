import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

List<dynamic> updateDataList(
  List<dynamic> newList,
  List<dynamic> currentList,
) {
  currentList.addAll(newList);
  return currentList;
}

String getCurrentMonth(
  DateTime currentDate,
  List<String> monthList,
) {
  return monthList[currentDate.month - 1];
}

List<String> getYearList(DateTime currentDate) {
  int currentYear = DateTime.now().year;
  int firstYear = currentYear - 4;
  List<String> yearList = [];
  for (int i = firstYear; i <= currentYear; i++) {
    yearList.add(i.toString());
  }
  yearList.sort((a, b) => b.compareTo(a));
  return yearList;
}

String getCurrentYear(DateTime currentDate) {
  return currentDate.year.toString();
}

DateTime getStartDateOfMonth(DateTime date) {
  return DateTime(date.year, date.month, 1);
}

DateTime getEndDateOfMonth(DateTime date) {
  DateTime firstDayOfNextMonth = (date.month == 12)
      ? DateTime(date.year + 1, 1, 1)
      : DateTime(date.year, date.month + 1, 1);

  DateTime lastDayOfCurrentMonth =
      firstDayOfNextMonth.subtract(Duration(days: 1));

  DateTime endOfMonthWithTime = DateTime(
    lastDayOfCurrentMonth.year,
    lastDayOfCurrentMonth.month,
    lastDayOfCurrentMonth.day,
    23,
    59,
    59,
  );

  return endOfMonthWithTime;
}

String getTimeDuration(
  DateTime dateIn,
  DateTime dateOut,
) {
  // Calculate the duration between the two dates
  Duration duration = dateOut.difference(dateIn);

  // Calculate the days, hours, minutes, and seconds
  int days = duration.inDays;
  int hours = duration.inHours.remainder(24);
  int minutes = duration.inMinutes.remainder(60);
  int seconds = duration.inSeconds.remainder(60);

  // Construct the formatted string based on the duration
  StringBuffer result = StringBuffer();

  if (days > 0) {
    result.write('$days วัน ');
  }

  if (hours > 0 || days > 0) {
    // Only show hours if there are any days or hours
    result.write('$hours ชม. ');
  }

  if (minutes > 0 || hours > 0 || days > 0) {
    // Only show minutes if there are any days, hours, or minutes
    result.write('$minutes นาที ');
  }

  result.write('$seconds วินาที');

  return result.toString().trim(); // Trim any trailing spaces
}

DateTime getDateTimeFormat(
  String month,
  String year,
  List<String> monthList,
) {
  int indexOfMonth = monthList.indexOf(month);
  return DateTime(int.parse(year), indexOfMonth + 1, 1);
}

String imageToString(String image) {
  return image.toString();
}

String convertPhoneNumber(String phoneNumber) {
  if (phoneNumber.startsWith('0')) {
    return '+66' + phoneNumber.substring(1);
  }
  return phoneNumber;
}

DateTime getStartDayTime(DateTime date) {
  DateTime startOfDay = DateTime(date.year, date.month, date.day);
  return startOfDay;
}

DateTime getEndDayTime(DateTime date) {
  DateTime endOfDay = DateTime(date.year, date.month, date.day, 23, 59, 59);
  return endOfDay;
}

String getIssueStatus(
  int status,
  List<IssueStatusDataStruct> issueStatusList,
) {
  for (var dataStatus in issueStatusList) {
    if (dataStatus.status == status) {
      return dataStatus.subject;
    }
  }
  return '-';
}

String dateTimeTh(DateTime? date) {
  if (date == null) {
    return "-";
  }

  final DateFormat formatter = DateFormat('d MMMM yyyy HH:mm:ss', 'th_TH');
  final buddhistYear = date.year + 543;
  return formatter.format(date).replaceFirst('${date.year}', '$buddhistYear');
}

String getStockStatus(
  int status,
  List<StockStatusDataStruct> stockStatusList,
) {
  for (var dataStatus in stockStatusList) {
    if (dataStatus.status == status) {
      return dataStatus.subject;
    }
  }
  return '-';
}

String strToImage(String str) {
  return str;
}

DocumentReference configReference() {
  return FirebaseFirestore.instance.doc("config/park_car_app");
}

String dateTh(DateTime date) {
  final DateFormat formatter = DateFormat('d MMMM yyyy', 'th_TH');
  final buddhistYear = date.year + 543;
  return formatter.format(date).replaceFirst('${date.year}', '$buddhistYear');
}

DateTime getBeforeDay(
  int pastDay,
  DateTime date,
) {
  DateTime pastDate = date.subtract(Duration(days: pastDay));
  return pastDate;
}

String getResidentStatus(
  int status,
  List<ResidentStatusDataStruct> residentStatusList,
) {
  for (var dataStatus in residentStatusList) {
    if (dataStatus.status == status) {
      return dataStatus.subject;
    }
  }
  return '-';
}

String getDataStatus(
  int status,
  List<DataStatusStruct> statusList,
) {
  for (var dataStatus in statusList) {
    if (dataStatus.status == status) {
      return dataStatus.subject;
    }
  }
  return '-';
}

String getNextValue(String current) {
  if (current == "") {
    return "A0000";
  }

  // Extract the letter and number parts from the string
  String letterPart = current.substring(0, 1);
  int numberPart = int.parse(current.substring(1));

  // Increment the number part
  numberPart++;

  // Check if the number overflows
  if (numberPart > 9999) {
    numberPart = 0; // Reset number part to 0000
    // Increment the letter part
    letterPart = String.fromCharCode(letterPart.codeUnitAt(0) + 1);
  }

  // Check if the letter overflows
  if (letterPart.codeUnitAt(0) > 'Z'.codeUnitAt(0)) {
    letterPart = 'A'; // Reset letter part to A
  }

  // Combine the letter and number parts into the new value
  String newValue = '$letterPart${numberPart.toString().padLeft(4, '0')}';

  return newValue;
}

int getFileSize(FFUploadedFile file) {
  return file.bytes!.length;
}

bool checkFileAllow(
  FFUploadedFile file,
  List<String> allowList,
) {
  String? extension = file.name!.split('.').last.toLowerCase();
  return allowList.contains(extension);
}

String getTimeDurationOnlyDay(
  DateTime dateIn,
  DateTime dateOut,
) {
  // Calculate the duration between the two dates
  Duration duration = dateOut.difference(dateIn);

  // Calculate the days, hours, minutes, and seconds
  int days = duration.inDays;
  int hours = duration.inHours.remainder(24);
  int minutes = duration.inMinutes.remainder(60);
  int seconds = duration.inSeconds.remainder(60);

  // Construct the formatted string based on the duration
  StringBuffer result = StringBuffer();

  if (days > 0) {
    result.write('$days วัน ');
  }
  return result.toString().trim(); // Trim any trailing spaces
}

double bytesToMB(int bytes) {
  return bytes / (1024 * 1024);
}

double getPadding(double screenSize) {
  if (screenSize < 479.0) {
    return 16.0;
  } else if (screenSize < 767.0) {
    return 16.0;
  } else if (screenSize < 991.0) {
    return 32.0;
  } else {
    return 64.0;
  }
}

DateTime getNextDay(
  int nextDay,
  DateTime date,
) {
  DateTime nextDate = date.add(Duration(days: nextDay));
  return nextDate;
}

int? convertToIntIfNumeric(String value) {
  if (value.isNotEmpty &&
      value.runes.every((int rune) {
        var character = String.fromCharCode(rune);
        return character.contains(RegExp(r'[0-9]'));
      })) {
    // Convert to int
    return int.parse(value);
  } else {
    // Return null if the string is not numeric
    return null;
  }
}
