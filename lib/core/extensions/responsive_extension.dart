import 'package:flutter/material.dart';

extension ResponsiveExtension on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;

  bool get isDesktop => screenWidth > 800;
  bool get isTablet => screenWidth > 600 && screenWidth <= 800;
  bool get isMobile => screenWidth <= 600;
}
