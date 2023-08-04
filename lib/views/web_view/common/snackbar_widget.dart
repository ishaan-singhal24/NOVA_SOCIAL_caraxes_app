import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/theme_handler.dart';

class SnackbarWidget {
  BuildContext context;
  String text;
  SnackbarWidget({required this.context, required this.text});

  void showSnackbar() {
    final snackBar = SnackBar(
      showCloseIcon: true,
      closeIconColor: AppColors.novaWhite.withOpacity(0.8),
      backgroundColor: AppColors.novaDarkIndigo,
      content: Text(
        text,
        style: AppTextStyles.text12w500,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
