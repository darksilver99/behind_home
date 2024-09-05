import 'dart:html' as html;
import 'package:flutter/foundation.dart';

bool isMobileWeb() {
  if (kIsWeb) {
    final userAgent = html.window.navigator.userAgent.toLowerCase();
    if (userAgent.contains('iphone') ||
        userAgent.contains('android')) {
      return true; // Mobile web
    }
  }
  return false; // Not mobile web
}