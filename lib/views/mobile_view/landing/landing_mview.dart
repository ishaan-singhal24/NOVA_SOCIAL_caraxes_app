import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';

class LandingMView extends StatelessWidget {
  const LandingMView({super.key});

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
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppAssetsMobile.spaceStation,
                      height: 224.h,
                    ),
                    sizedBoxWithHeight(80),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Welcome to ',
                            style: AppTextStyles.text24w700,
                          ),
                          Text(
                            'Novaverse',
                            style: AppTextStyles.text24w700.indigo,
                          ),
                        ],
                      ),
                    ),
                    sizedBoxWithHeight(4),
                    Text(
                      AppStrings.landingSubHead,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.text14w400,
                    ),
                    sizedBoxWithHeight(40),
                    UnicornOutlineButton.normalBorder(
                      strokeWidth: 1.h,
                      radius: 8.r,
                      outlineColor: AppColors.novaDarkIndigo,
                      onPressed: () {
                        context.go(MobileRouter.loginRoute);
                      },
                      child: Text(
                        'Join Nova',
                        style: AppTextStyles.text14w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
