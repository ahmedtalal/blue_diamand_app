import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showErrorDialog(String message, String errortype) {
  return Get.snackbar(
    errortype,
    message,
    margin: const EdgeInsets.all(0),
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: Colors.red,
    colorText: Colors.white,
    borderRadius: 2,
    duration: const Duration(seconds: 4),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
    icon: const Icon(Icons.error),
    messageText: Text(
      message,
      style: const TextStyle(
        fontSize: 14,
        fontFamily: appFont,
        color: Colors.white,
      ),
    ),
    titleText: Text(
      errortype,
      style: const TextStyle(
        fontSize: 16,
        fontFamily: appFont,
        color: Colors.black,
      ),
    ),
  );
}
