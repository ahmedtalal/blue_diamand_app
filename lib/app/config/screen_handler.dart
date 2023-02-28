import 'package:flutter/material.dart';

class ScreenHandler {
  static double getScreenWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double getScreenHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double setWidthSpacing({
    required widthSpacing,
    required BuildContext context,
  }) {
    return getScreenWidth(context) * widthSpacing;
  }
}
