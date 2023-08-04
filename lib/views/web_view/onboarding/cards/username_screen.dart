import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/user/user.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/views/web_view/common/snackbar_widget.dart';
import 'package:nova_social/views/web_view/onboarding/widgets/onboarding_top_bar.dart';
import 'package:provider/provider.dart';

class UsernameCard extends StatefulWidget {
  const UsernameCard({Key? key}) : super(key: key);

  @override
  State<UsernameCard> createState() => _UsernameCardState();
}

class _UsernameCardState extends State<UsernameCard> {
  late OnboardingNotifier _onboardingNotifier;
  late ProfileNotifier profileNotifier;

  final TextEditingController usernameTextEditingController =
      TextEditingController();

  final formKey = GlobalKey<FormState>();
  bool valid = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    usernameTextEditingController.dispose();
  }

  Future<void> onTap() async {
    valid = formKey.currentState?.validate() ?? false;
    if (valid) {
      appLoadingPopup(context);
      await _onboardingNotifier
          .storeUsername(usernameTextEditingController.text);
      UserModel? userModel = profileNotifier.userProfile;
      if ((_onboardingNotifier.isUsernameTaken?.not ?? true) &&
          profileNotifier.invitedByUserProfile != null &&
          userModel != null) {
        profileNotifier.callFromUsername = true;
        profileNotifier.saveProfile(userModel);
      }
      if (_onboardingNotifier.isUsernameTaken ?? false) {
        SnackbarWidget(
          context: context,
          text: 'Username already exists.',
        ).showSnackbar();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _onboardingNotifier = Provider.of<OnboardingNotifier>(context);
    profileNotifier = Provider.of<ProfileNotifier>(context);
    final bool kIsLargeScreen = !ResponsiveWidget.isSmallScreen();
    final deviceSize = MediaQuery.of(context).size;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
      child: Center(
        child: FittedBox(
          child: Container(
            constraints: BoxConstraints(
              maxWidth:
                  kIsLargeScreen ? deviceSize.width * 0.3 : double.maxFinite,
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
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  OnboardingTopBar(
                    head: AppStrings.usernameHead,
                    subHead: AppStrings.yourUsernameHelps,
                  ),
                  sizedBoxWithHeight(8),
                  //Username TextField
                  AppMaterialInputField(
                    label: 'Username',
                    hint: AppStrings.chooseYourUsername,
                    controller: usernameTextEditingController,
                    isRequired: true,
                    isSpecialCharInvalid: true,
                    maxLines: 1,
                    textInputAction: TextInputAction.go,
                    onSubmit: (v) async {
                      await onTap().then((value) {
                        Navigator.pop(context);
                      });
                    },
                  ),
                  sizedBoxWithHeight(16),
                  //Button - Signup
                  CustomButton(
                    text: 'Continue',
                    onPressed: () async {
                      await onTap().then((value) {
                        Navigator.pop(context);
                      });
                    },
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
