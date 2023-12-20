import 'package:flutter/material.dart';

extension ContentExtension on BuildContext {
  double dynamicWidth(double val) => MediaQuery.of(this).size.width * val;

  double dynamicHeight(double val) => MediaQuery.of(this).size.height * val;

  double dynamicWidthSmall(double val) => MediaQuery.of(this).size.width / val;

  double dynamicHeightSmall(double val) =>
      MediaQuery.of(this).size.height / val;
}
