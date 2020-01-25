library common_app_utils;

import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:share/share.dart';

class AppUtils {
  navigate(BuildContext context, Widget nextScreen) {
    var nav = Navigator.of(context);

    if (Platform.isAndroid) {
      nav.push(MaterialPageRoute(builder: (ctx) => nextScreen));
    } else if (Platform.isIOS) {
      nav.push(CupertinoPageRoute(builder: (ctx) => nextScreen));
    }
  }

  navigateClearStack(BuildContext context, Widget route) {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => route),
        ModalRoute.withName("/ROOT"));
  }

  setTimeout(void callback(Timer timer), int time) {
    Timer timer;
    timer = Timer(Duration(milliseconds: time), () {
      callback(timer);
    });
  }

  toast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIos: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  share(String text) {
    Share.share(text);
  }
}
