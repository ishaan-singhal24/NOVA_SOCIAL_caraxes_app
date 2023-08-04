import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';

class VerifyOTPMView extends StatelessWidget {
  const VerifyOTPMView({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance.init(context);
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  sizedBoxWithHeight(56),
                  Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: 24.r,
                        color: ThemeHandler.widgetColor(),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            AppStrings.verifyOTP,
                            style: AppTextStyles.text24w700,
                          ),
                        ),
                      ),
                    ],
                  ),
                  sizedBoxWithHeight(40),
                  Row(
                    children: [
                      Expanded(
                        child: AppMaterialInputField(
                          controller: TextEditingController(),
                          isRequired: true,
                        ),
                      ),
                      sizedBoxWithWidth(16),
                      Expanded(
                        child: AppMaterialInputField(
                          controller: TextEditingController(),
                          isRequired: true,
                          maxLines: 1,
                        ),
                      ),
                      sizedBoxWithWidth(16),
                      Expanded(
                        child: AppMaterialInputField(
                          controller: TextEditingController(),
                          isRequired: true,
                          maxLines: 1,
                        ),
                      ),
                      sizedBoxWithWidth(16),
                      Expanded(
                        child: AppMaterialInputField(
                          controller: TextEditingController(),
                          isRequired: true,
                          maxLines: 1,
                        ),
                      ),
                    ],
                  ),
                  sizedBoxWithHeight(16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        AppStrings.resendOTP,
                        style: AppTextStyles.text14w300,
                      ),
                      Text(
                        '00:18',
                        style: AppTextStyles.text14w300,
                      ),
                    ],
                  ),
                  sizedBoxWithHeight(48),
                  CustomButton(
                    text: AppStrings.verifyOTP,
                    height: 48.h,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
