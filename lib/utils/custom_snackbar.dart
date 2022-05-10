import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import './custom_colors.dart';

class CustomSnackbarAndDialog {

  static void showErrorSnackbar({
    required String message,
    bool? networkFailure,
    Color? color,
  }) async {

    if(Get.isSnackbarOpen) {

      return;

    }

    Get.snackbar(
      "",
      message,
      animationDuration: const Duration(milliseconds: 500),
      backgroundColor: color ?? Colors.red.shade400,
      barBlur: 0.5,
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
      dismissDirection: DismissDirection.vertical,
      borderRadius: 10,
      forwardAnimationCurve: Curves.easeInOutBack,
      margin: const EdgeInsets.all(15),
      duration: const Duration(seconds: 15),
      snackStyle: SnackStyle.FLOATING,
      padding: EdgeInsets.zero,
      icon: Icon(
        networkFailure != null && networkFailure ? Icons.wifi_off_sharp : Icons.error_outline_rounded,
        color: Colors.white,
        size: 30,
      ),
      snackbarStatus: (SnackbarStatus? status) {

        if(status == SnackbarStatus.OPENING) {
          
          HapticFeedback.heavyImpact();

        }

      },
      titleText: const SizedBox(),
      messageText: Container(
        padding: const EdgeInsets.only(
          top: 5, bottom: 10, right: 10
        ),
        alignment: Alignment.centerLeft,
        constraints: const BoxConstraints(
          minHeight: 40
        ),
        child: Text(
          message,
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  static void showNotificationSnackbar({
    required String message,
    Color? color,
  }) async {
    Get.snackbar(
      "",
      message,
      animationDuration: const Duration(milliseconds: 500),
      backgroundColor: color ?? Colors.white,
      barBlur: 0.5,
      isDismissible: true,
      snackPosition: SnackPosition.TOP,
      dismissDirection: DismissDirection.vertical,
      borderRadius: 10,
      forwardAnimationCurve: Curves.easeInOutBack,
      margin: const EdgeInsets.all(15),
      duration: const Duration(seconds: 10),
      snackStyle: SnackStyle.FLOATING,
      padding: EdgeInsets.zero,
      titleText: const SizedBox(),
      messageText: Container(
        padding: const EdgeInsets.only(
          top: 5, bottom: 10, right: 10 , left: 10
        ),
        alignment: Alignment.centerLeft,
        constraints: const BoxConstraints(
          minHeight: 40
        ),
        child: Text(
          message,
          maxLines: 10,
          overflow: TextOverflow.ellipsis,
          textScaleFactor: 1,
          style: const TextStyle(
            color: CustomColors.accentColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
  
}