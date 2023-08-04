import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/app_strings.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/web/nova_router.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/views/web_view/onboarding/widgets/onboarding_top_bar.dart';
import 'package:provider/provider.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({Key? key}) : super(key: key);

  @override
  State<LoginCard> createState() => _LoginCardState();
}

class _LoginCardState extends State<LoginCard> {
  late final AuthNotifier authNotifier;

  @override
  void initState() {
    super.initState();
    authNotifier = Provider.of<AuthNotifier>(context, listen: false);
  }

  Future<void> _btnSubmit() async {
    await authNotifier.signInWithGoogle().then((value) {
      if (authNotifier.isAuth ?? false) {
        context.go(NovaRouter.baseRoute);
      }
    });
  }

  Widget _buildLoginButton({
    required String icon,
    required String head,
    required Function() onPressed,
  }) {
    bool? kIsLargeScreen = !ResponsiveWidget.isSmallScreen();
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 8.h,
      ),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 8.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: ThemeHandler.widgetColor(),
              width: 0.75,
            ),
            borderRadius: BorderRadius.circular(
              kIsLargeScreen ? 8 : 8.r,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 24.h,
                width: 24.h,
                child: Image.asset(
                  icon,
                  // scale: 24,
                ),
              ),
              sizedBoxWithWidth(8),
              Text(
                head,
                style: AppTextStyles.text14w500.darkModeSupport,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        OnboardingTopBar(
          head: AppStrings.welcomeText,
          subHead: AppStrings.welcomeSubtitle,
        ),
        sizedBoxWithHeight(32),
        _buildLoginButton(
          icon: AppStrings.googleLogo,
          head: AppStrings.btnGoogleText,
          onPressed: () => _btnSubmit(),
        ),
      ],
    );
  }
}
