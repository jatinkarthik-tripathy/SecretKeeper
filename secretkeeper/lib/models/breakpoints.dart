import 'package:flutter/widgets.dart';

class Breakpoints {
  static bool isMobile(BoxConstraints constraints) =>
      constraints.maxWidth <= 750;
  static bool isTablet(BoxConstraints constraints) =>
      constraints.maxWidth > 750 && constraints.maxWidth <= 1250;
  static bool isDesktop(BoxConstraints constraints) =>
      constraints.maxWidth > 1250;
}
