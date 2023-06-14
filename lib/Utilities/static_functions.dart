import 'package:another_flushbar/flushbar.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class StaticFunctions {
  static void showNotification(BuildContext conx, String? note) {
    Flushbar(
      message: note ?? "",
      flushbarPosition: FlushbarPosition.TOP,
      duration: Duration(seconds: 1),
      backgroundColor: Constants.MAIN_COLOR,
      margin: EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(5),
    ).show(conx);
  }

  static void showSuccessNote(
      BuildContext context, String? note, Function? onOk) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.success,
      animType: AnimType.bottomSlide,
      title: "",
      desc: note ?? "",
      btnOkOnPress: () {
        if (onOk != null) {
          onOk();
        }
      },
    ).show();
  }

  static void showErrorNote(BuildContext context, String? note) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.bottomSlide,
      title: "",
      desc: note ?? "",
      btnOkOnPress: () {},
      btnOkColor: Colors.red,
    ).show();
  }

  static bool checkValidEmail(String email) {
    return RegExp(r"[a-zA-Z]+[.][0-9]+@izam.co$").hasMatch(email);
  }

  static bool checkValidPassword(String email) {
    return RegExp(r"^(?=.*\d)(?=.*[!$#^*])[A-Za-z\d!$#^*]{8,}$")
        .hasMatch(email);
  }

  static double getScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double getScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }
}
