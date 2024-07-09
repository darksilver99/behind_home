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
  DateTime endOfDay = DateTime(date.year, date.month, date.day, 23, 0, 0);
  return endOfDay;
}

String dateTimeTh(DateTime date) {
  final DateFormat formatter = DateFormat('d MMMM yyyy HH:mm:ss', 'th_TH');
  final buddhistYear = date.year + 543;
  return formatter.format(date).replaceFirst('${date.year}', '$buddhistYear');
}

String strToImage(String str) {
  return str;
}
