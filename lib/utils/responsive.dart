import 'package:flutter/material.dart';

class Responsive {
  // Mobile phones
  static bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 1024;
  }

  // Tablets and small laptops
  static bool isTablet(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return width >= 1024 && width < 1440;
  }

  // Large desktop screens
  static bool isDesktop(BuildContext context) {
    return MediaQuery.of(context).size.width >= 1440;
  }
}