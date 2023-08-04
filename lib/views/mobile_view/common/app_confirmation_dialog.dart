import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';

class AppConfirmationDialog extends StatelessWidget {
  final String title;
  final String message;
  final String buttonName;
  final VoidCallback onConfirm;
  final Color? messageColor;

  const AppConfirmationDialog({
    super.key,
    required this.title,
    required this.message,
    required this.buttonName,
    required this.onConfirm,
    this.messageColor,
  });

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: AppColors.novaIndigo.withOpacity(0.5),
        child: FittedBox(
          child: Container(
            width: ScreenUtil.instance.screenWidth * 0.9,
            padding: EdgeInsets.all(24.r),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ThemeHandler.backgroundColor(),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.close,
                        color: AppColors.novaWhite,
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          title,
                          style: AppTextStyles.text20w600,
                        ),
                      ),
                    ),
                  ],
                ),
                sizedBoxWithHeight(24),
                Text(
                  message,
                  style: AppTextStyles.text14w400.copyWith(
                    color: messageColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                sizedBoxWithHeight(16),
                CustomButton(
                  text: buttonName,
                  onPressed: onConfirm,
                ),
                sizedBoxWithHeight(16),
                CustomButton(
                  color: ThemeHandler.mutedPlusColor(nonInverse: false),
                  text: 'Cancel',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
