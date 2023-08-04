import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';

class MobileWebScreen extends StatelessWidget {
  const MobileWebScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance.init(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.novaBlack,
        body: Container(
          constraints: const BoxConstraints(
            maxWidth: double.maxFinite,
          ),
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(
            horizontal: 8.w,
            vertical: 16.h,
          ),
          decoration: BoxDecoration(
            color: ThemeHandler.backgroundColor(),
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: 24.w,
            vertical: 32.h,
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Please visit us on desktop..',
                  style: AppTextStyles.text14w500.white,
                ),
                sizedBoxWithWidth(8),
                Icon(
                  Icons.computer,
                  color: ThemeHandler.widgetColor(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
