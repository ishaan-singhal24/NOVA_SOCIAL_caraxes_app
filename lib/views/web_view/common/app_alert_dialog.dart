import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/utils/theme_handler.dart';

Future<void> showAlertDialog({
  required BuildContext context,
  String? textBtn1,
  String? txtBtn2,
  String? txtContent,
  Function()? onBtn1,
  Function()? onBtn2,
}) async {
  // set up the buttons
  Widget cancelButton = TextButton(
    onPressed: onBtn1,
    child: Text(
      textBtn1 ?? '',
      style: AppTextStyles.text12w400,
    ),
  );
  Widget continueButton = TextButton(
    onPressed: onBtn2,
    child: Text(
      txtBtn2 ?? '',
      style: AppTextStyles.text12w400,
    ),
  );
  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    backgroundColor: ThemeHandler.backgroundColor(),
    title: Text(
      "Alert Dialog",
      style: AppTextStyles.text14w600,
    ),
    content: Text(
      txtContent ?? '',
      style: AppTextStyles.text14w400,
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  // show the dialog
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
