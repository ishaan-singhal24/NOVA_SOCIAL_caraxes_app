import 'package:flutter/material.dart';
import 'package:nova_social/utils/utils.dart';

appLoadingMPopup(BuildContext context) {
  //set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Container(
      padding: EdgeInsets.symmetric(horizontal: 40.w, vertical: 32.h),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    ),
  );
  showDialog(
    //prevent outside touch
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      //prevent Back button press
      return WillPopScope(
        onWillPop: () async => false,
        child: alert,
      );
    },
  );
}
