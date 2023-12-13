import 'package:bookbuzz/styles/app_message.dart';
import 'package:flutter/material.dart';

class AppMessenger {
  static void showMessageGreen(BuildContext context, String message) {
    AppSnackbar.showSnackbarGreen(context, message);
  }

  static void showMessageYellow(BuildContext context, String message) {
    AppSnackbar.showSnackbarYellow(context, message);
  }

  static void showMessageRed(BuildContext context, String message) {
    AppSnackbar.showSnackbarRed(context, message);
  }
}
