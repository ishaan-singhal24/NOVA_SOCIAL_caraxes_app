import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

const String termsOfUserURL =
    'https://doc-hosting.flycricket.io/terms-of-use-nova/def4a159-1d0e-4ef7-9ad3-b5f48a96e7c8/terms';
const String privacyPolicyURL =
    'https://doc-hosting.flycricket.io/privacy-nova/54e6f5ab-4518-4263-9e57-1b9762dc924f/privacy';

class LoginMView extends StatefulWidget {
  const LoginMView({super.key});

  @override
  State<LoginMView> createState() => _LoginMViewState();
}

class _LoginMViewState extends State<LoginMView> {
  bool _isChecked = false;

  late AuthNotifier authNotifier;

  Future<void> _btnSubmitGoogle() async {
    if (_isChecked.not) {
      appSnackBarMWidget(
        context: context,
        content: Text(
          'Please agree to our terms of use first.',
          style: AppTextStyles.text14w400,
        ),
      );
      return;
    }
    await authNotifier.signInWithGoogle().then((value) {
      if (authNotifier.isAuth ?? false) {
        context.go(MobileRouter.baseRoute);
      }
    });
  }

  Future<void> _btnSubmitApple() async {
    if (_isChecked.not) {
      appSnackBarMWidget(
        context: context,
        content: Text(
          'Please agree to our terms of use.',
          style: AppTextStyles.text14w400,
        ),
      );
      return;
    }
    await authNotifier.signInWithApple().then((value) {
      if (authNotifier.isAuth ?? false) {
        context.go(MobileRouter.baseRoute);
      }
    });
  }

  Future<void> _launchUrl(url) async {
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    authNotifier = Provider.of<AuthNotifier>(context, listen: false);
    ScreenUtil.instance.init(context);
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sizedBoxWithHeight(40),
                Expanded(
                  child: Image.asset(
                    AppAssetsMobile.spaceStation,
                  ),
                ),
                sizedBoxWithHeight(40),
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
                // sizedBoxWithHeight(40),
                // AppMaterialInputField(
                //   controller: TextEditingController(),
                //   isRequired: true,
                //   hint: 'Mobile Number',
                // ),
                // sizedBoxWithHeight(24),
                // CustomButton(
                //   text: 'Get OTP',
                //   height: 48.h,
                //   onPressed: () {
                //     context.go(MobileRouter.verifyOTPRoute);
                //   },
                // ),
                // sizedBoxWithHeight(32),
                // Text(
                //   '-OR-',
                //   style: AppTextStyles.text16w400,
                // ),
                sizedBoxWithHeight(32),
                UnicornOutlineButton.normalBorder(
                  strokeWidth: 1,
                  radius: 8,
                  width: double.infinity,
                  outlineColor: AppColors.novaDarkIndigo,
                  child: Row(
                    children: [
                      Image.asset(
                        AppAssetsMobile.googleLogo,
                        height: 20.h,
                      ),
                      sizedBoxWithWidth(8),
                      Text(
                        AppStrings.btnGoogleText,
                        style: AppTextStyles.text14w600,
                      ),
                    ],
                  ),
                  onPressed: () async {
                    await _btnSubmitGoogle();
                  },
                ),
                if (kIsWeb.not && (Platform.isIOS || Platform.isMacOS)) ...{
                  sizedBoxWithHeight(16),
                  UnicornOutlineButton.normalBorder(
                    strokeWidth: 1,
                    radius: 8,
                    width: double.infinity,
                    outlineColor: AppColors.novaDarkIndigo,
                    child: Row(
                      children: [
                        Image.asset(
                          AppAssetsMobile.appleLogo,
                          height: 20.h,
                          color: AppColors.novaWhite,
                        ),
                        sizedBoxWithWidth(8),
                        Text(
                          AppStrings.btnAppleText,
                          style: AppTextStyles.text14w600,
                        ),
                      ],
                    ),
                    onPressed: () async {
                      await _btnSubmitApple();
                    },
                  ),
                },
                sizedBoxWithHeight(16),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40.w),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 24.0,
                        height: 24.0,
                        child: Checkbox(
                          value: _isChecked,
                          onChanged: (newValue) {
                            setState(() {
                              _isChecked = newValue ?? false;
                            });
                          },
                        ),
                      ),
                      sizedBoxWithWidth(8),
                      Expanded(
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text:
                                    'By creating this account, you agree to our ',
                                style: AppTextStyles.text12w500,
                              ),
                              TextSpan(
                                text: 'Terms of Use',
                                style: AppTextStyles.text12w600.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    final Uri url = Uri.parse(termsOfUserURL);
                                    _launchUrl(url);
                                  },
                              ),
                              TextSpan(
                                text: ' and ',
                                style: AppTextStyles.text12w500,
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: AppTextStyles.text12w600.copyWith(
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    final Uri url = Uri.parse(privacyPolicyURL);
                                    _launchUrl(url);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                sizedBoxWithHeight(40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
