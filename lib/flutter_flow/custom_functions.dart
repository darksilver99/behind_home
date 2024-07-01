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

String getCurrentMonth(DateTime currentDate) {
  return "มกราคม";
}

List<String> getYearList(DateTime currentDate) {
  return ['2024', '2025', '2026', '2027'];
}

String getCurrentYear(DateTime currentDate) {
  return '2024';
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

  // Calculate the days, hours, and minutes
  int days = duration.inDays;
  int hours = duration.inHours.remainder(24);
  int minutes = duration.inMinutes.remainder(60);

  // Construct the formatted string based on the duration
  StringBuffer result = StringBuffer();

  if (days > 0) {
    result.write('$days วัน ');
  }

  if (hours > 0 || days > 0) {
    // Only show hours if there are any days or hours
    result.write('$hours ชม. ');
  }

  result.write('$minutes นาที');

  return result.toString().trim(); // Trim any trailing spaces
}
