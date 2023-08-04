// import 'dart:html' as html;
import 'package:universal_html/html.dart' as html;

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/app_assets.dart';
import 'package:nova_social/data/constants/app_strings.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/web/nova_router.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/web_view.dart';
import 'package:provider/provider.dart';

class UserWaitlist extends StatefulWidget {
  const UserWaitlist({Key? key}) : super(key: key);

  @override
  State<UserWaitlist> createState() => _UserWaitlistState();
}

class _UserWaitlistState extends State<UserWaitlist> {
  late OnboardingNotifier notifier;
  bool? isInTheWaitList;
  String? waitlistCounter = 'Calculating..';
  bool _checkingForWaitlist = false;

  @override
  void initState() {
    super.initState();
    notifier = Provider.of<OnboardingNotifier>(context, listen: false);
    isInTheWaitList = notifier.inTheWaitlist;

    final profileNoti = Provider.of<ProfileNotifier>(context, listen: false);

    if (isInTheWaitList == true &&
        profileNoti.invitedByUserInviteModel != null) {
      profileNoti.callFromFinalOnboarding = true;
      UserModel? userModel = profileNoti.userProfile;
      userModel = userModel?.copyWith(inTheWaitlist: false);
      setState(() {
        _checkingForWaitlist = true;
      });
      profileNoti.saveProfile(userModel!).then((value) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.go(NovaRouter.baseRoute);
        });
      });
      isInTheWaitList = false;
    } else if (isInTheWaitList == false) {
      setState(() {
        _checkingForWaitlist = true;
      });
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go(NovaRouter.baseRoute);
      });
    } else if (isInTheWaitList != true) {
      print('Call Waitlist for true');
      UserModel? userModel = profileNoti.userProfile;
      userModel = userModel?.copyWith(inTheWaitlist: true);
      profileNoti.saveProfile(userModel!);
    } else {
      profileNoti.countUsersInWaitlist().then((value) {
        waitlistCounter = profileNoti.waitlistCounter != null
            ? (profileNoti.waitlistCounter! + 1).toString()
            : '1';
        setState(() {});
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool kIsLargeScreen = !ResponsiveWidget.isSmallScreen();
    final deviceSize = MediaQuery.of(context).size;
    return _checkingForWaitlist
        ? const LoadingScreen()
        : BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Center(
              child: FittedBox(
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: kIsLargeScreen
                        ? deviceSize.width * 0.3
                        : double.maxFinite,
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppAssets.partyPopper,
                        width: 64.w,
                      ),
                      sizedBoxWithHeight(8),
                      Text(
                        (isInTheWaitList ?? false)
                            ? '${AppStrings.alreadyInWaitlistTitle} \n Queue No. : $waitlistCounter'
                            : AppStrings.congratulations,
                        style: AppTextStyles.text24w800,
                        textAlign: TextAlign.center,
                      ),
                      sizedBoxWithHeight(8),
                      Text(
                        (isInTheWaitList ?? false)
                            ? AppStrings.alreadyInWaitlistBody
                            : AppStrings.addedToWailtlist,
                        style: AppTextStyles.text14w500,
                        textAlign: TextAlign.center,
                      ),
                      sizedBoxWithHeight(16),
                      CustomButton(
                        text: AppStrings.done,
                        width: double.maxFinite,
                        onPressed: () async {
                          await Provider.of<AuthNotifier>(context,
                                  listen: false)
                              .signOut();
                          html.window.open('http://novasocial.club', '_self');
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
