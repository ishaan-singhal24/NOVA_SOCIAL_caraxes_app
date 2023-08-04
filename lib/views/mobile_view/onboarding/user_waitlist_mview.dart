import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/user/user.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';

class UserWaitlistMView extends StatefulWidget {
  const UserWaitlistMView({super.key});

  @override
  State<UserWaitlistMView> createState() => _UserWaitlistMViewState();
}

class _UserWaitlistMViewState extends State<UserWaitlistMView> {
  bool? isCodeValid;
  final TextEditingController waitlistCodeController = TextEditingController();
  late OnboardingNotifier onboardingNotifier;
  late ProfileNotifier profileNotifier;

  void _submitButton() async {
    isCodeValid ??= false;

    if (waitlistCodeController.text.isEmpty) {
      return;
    }
    isCodeValid = await onboardingNotifier.isWaitlistInviteCodeValid(
        code: waitlistCodeController.text);
    setState(() {});
    if (isCodeValid!) {
      UserModel? userModel = profileNotifier.userProfile;
      userModel = userModel?.copyWith(
        inTheWaitlist: false,
      );
      await profileNotifier.saveProfile(userModel!);
    } else {
      Future.delayed(
        const Duration(
          seconds: 2,
        ),
      ).then((value) {
        isCodeValid = null;
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    profileNotifier = Provider.of<ProfileNotifier>(context);
    onboardingNotifier = Provider.of<OnboardingNotifier>(context);

    final isDummyAccount =
        profileNotifier.user?.email == 'harshvardhanbaid.777@gmail.com' ||
            profileNotifier.user?.email == 'anuj.tayal1421@gmail.com' ||
            profileNotifier.user?.email == 'testaccharsh@gmail.com';

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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  sizedBoxWithHeight(40),
                  Image.asset(
                    AppAssetsMobile.onboardingCongratulations,
                    height: ScreenUtil.instance.screenHeight * 0.4,
                  ),
                  sizedBoxWithHeight(16),
                  Text(
                    '${AppStrings.congratulations}!',
                    style: AppTextStyles.text24w700,
                  ),
                  sizedBoxWithHeight(4),
                  Text(
                    AppStrings.addedToWailtlist,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.text14w300,
                  ),
                  // We have created your profile with Email ID
                  sizedBoxWithHeight(4),
                  Text(
                    'We have created your profile with Email ID',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.text14w300,
                  ),
                  sizedBoxWithHeight(4),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: profileNotifier.userProfile?.email,
                          style: AppTextStyles.text14w500,
                        ),
                        TextSpan(
                          text: ' Logout ',
                          style: AppTextStyles.text14w700.indigo,
                          recognizer: TapGestureRecognizer()
                            ..onTap = () async {
                              await Provider.of<AuthNotifier>(
                                context,
                                listen: false,
                              ).signOut().then((value) {
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);
                                }
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);
                                }
                                context.go(MobileRouter.baseRoute);
                              });
                            },
                        ),
                      ],
                    ),
                  ),
                  sizedBoxWithHeight(24),
                  Text(
                    AppStrings.wailtlistNotifyFeedback,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.text14w300,
                  ),
                  sizedBoxWithHeight(24),
                  if (isDummyAccount) ...{
                    UnicornOutlineButton.normalBorder(
                      onPressed: () async {
                        UserModel? userModel = profileNotifier.userProfile;
                        userModel = userModel?.copyWith(
                          inTheWaitlist: false,
                        );
                        await profileNotifier.saveProfile(userModel!);
                      },
                      strokeWidth: 1.h,
                      radius: 8.r,
                      outlineColor: AppColors.novaDarkIndigo,
                      child: Text(
                        'Proceed',
                        style: AppTextStyles.text14w600,
                      ),
                    ),
                    sizedBoxWithHeight(16),
                    Text(
                      'Since this is a dummy account, you can directly tap on proceed to pass this waitlist.',
                      textAlign: TextAlign.center,
                      style: AppTextStyles.text14w300,
                    ),
                    sizedBoxWithHeight(16),
                  } else ...{
                    Text(
                      'Have an invite code?\nEnter below to pass the waitlist.',
                      style: AppTextStyles.text14w400,
                      textAlign: TextAlign.center,
                    ),
                    sizedBoxWithHeight(8),
                    AppMaterialInputField(
                      controller: waitlistCodeController,
                      isRequired: false,
                      label: 'Invite Code',
                      hint: 'Enter your code here',
                      minLines: 1,
                      textInputAction: TextInputAction.go,
                    ),
                    sizedBoxWithHeight(16),
                    if (isCodeValid?.not ?? false) ...{
                      Text(
                        'Invalid Code',
                        style: AppTextStyles.text16w400.novaRed,
                      ),
                      sizedBoxWithHeight(16),
                    },
                    CustomButton(
                      text: AppStrings.continueWord,
                      onPressed: () async {
                        _submitButton();
                      },
                    ),
                    sizedBoxWithHeight(24),
                  },
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
