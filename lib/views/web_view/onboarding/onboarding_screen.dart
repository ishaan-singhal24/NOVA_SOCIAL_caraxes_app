import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/onboarding/cards/cards.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/add_edit_profile.dart';
import 'package:provider/provider.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int page = 1;
  var _init = true;
  var _isLoading = false;
  late final OnboardingNotifier _onboardingNotifier;

  bool isProfileLoaded = false;

  Widget _buildRenderer(int page) {
    Widget widget = const UsernameCard();
    switch (page) {
      case 1:
        widget = const UsernameCard();
        break;
      case 2:
        widget = const ProfileAddEditInterest(
          isUserOnboarding: true,
        );
        break;
      case 3:
        widget = const ProfileAddEditAvailability(
          isUserOnboarding: true,
        );
        break;
      case 4:
        widget = const ProfileAddEditEducation(
          isUserOnboarding: true,
        );
        break;
      case 5:
        widget = const UserWaitlist();
        break;
      default:
    }
    return widget;
  }

  @override
  void initState() {
    super.initState();
    // _onboardingNotifier =
    //     Provider.of<OnboardingNotifier>(context, listen: false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      // setState(() {
      //   _isLoading = true;
      // });

      _onboardingNotifier = Provider.of<OnboardingNotifier>(context);
      // _profileNotifier = Provider.of<ProfileNotifier>(context);
      // if (_profileNotifier.userProfile == null) {
      //   _profileNotifier.populateProfile(FirebaseAuth.instance.currentUser!);
      // }
      setState(() {
        _isLoading = false;
        if (_onboardingNotifier.hasEducation!) {
          page = 5;
        } else if (_onboardingNotifier.hasOpportunities!) {
          page = 4;
        } else if (_onboardingNotifier.hasInterests!) {
          page = 3;
        } else if (_onboardingNotifier.hasUsername!) {
          page = 2;
        } else if (_onboardingNotifier.isAuth!) {
          page = 1;
        }
      });
      _init = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance.init(context);
    context.watch<AuthNotifier>();
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.novaBlack,
        body: Stack(
          children: [
            Positioned.fill(
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      AppAssets.landingPage,
                    ),
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5),
                      BlendMode.dstATop,
                    ),
                  ),
                ),
              ),
            ),
            _isLoading
                ? Container()
                : Consumer<OnboardingNotifier>(
                    builder: (ctx, onboarding, _) {
                      if (onboarding.hasEducation!) {
                        page = 5;
                      } else if (onboarding.hasOpportunities!) {
                        page = 4;
                      } else if (onboarding.hasInterests!) {
                        page = 3;
                      } else if (onboarding.hasUsername!) {
                        page = 2;
                      }
                      return _buildRenderer(page);
                    },
                  ),
          ],
        ),
      ),
    );
  }
}
