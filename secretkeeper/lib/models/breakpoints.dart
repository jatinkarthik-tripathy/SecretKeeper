import 'package:flutter/widgets.dart';

class Breakpoints {
  bool isMobile(BoxConstraints constraints) => constraints.maxWidth <= 650;
  bool isTablet(BoxConstraints constraints) =>
      constraints.maxWidth > 650 && constraints.maxWidth <= 1250;
  bool isDesktop(BoxConstraints constraints) => constraints.maxWidth > 1250;
}
