import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

showToast(String msg, {bool iserror = false}) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: iserror ? Colors.red : Colors.white,
      textColor: iserror ? Colors.white : Colors.black,
      fontSize: 16.0);
}
