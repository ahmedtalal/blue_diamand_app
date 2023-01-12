import 'package:drinking_app/app/core/utils/app_colors.dart';
import 'package:drinking_app/app/core/utils/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

showErrorDialog(String message, String errortype) {
  return Get.snackbar(
    errortype,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: AppColor.color2,
    colorText: Colors.white,
    borderRadius: 15,
    margin: const EdgeInsets.all(5),
    duration: const Duration(seconds: 4),
    isDismissible: true,
    forwardAnimationCurve: Curves.easeOutBack,
    icon: const Icon(Icons.error),
    messageText: Text(
      message,
      style: const TextStyle(
        fontSize: 16,
        fontFamily: appFont,
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    titleText: const Text(
      "auth Exception",
      style: TextStyle(
        fontSize: 20,
        fontFamily: appFont,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
