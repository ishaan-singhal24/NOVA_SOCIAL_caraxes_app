import 'package:flutter/material.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/repository/repository.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/common/app_stepper.dart';
import 'package:nova_social/views/mobile_view/onboarding/onboarding_steps/connection_step.dart';
import 'package:nova_social/views/mobile_view/onboarding/onboarding_steps/introduction_step.dart';
import 'package:nova_social/views/mobile_view/onboarding/onboarding_steps/onboarding_steps.dart';
import 'package:provider/provider.dart';

class OnboardingMView extends StatefulWidget {
  const OnboardingMView({super.key});

  @override
  State<OnboardingMView> createState() => _OnboardingMViewState();
}

class _OnboardingMViewState extends State<OnboardingMView> {
  int _page = 0;

  void changePage(int p) {
    _page = p;
    setState(() {});
  }

  Widget renderStepPage(int index) {
    Widget? page;
    switch (index) {
      case 0:
        // page = UsernameStep(onTap: changePage);
        page = IntroductionStep(onTap: changePage);
        break;
      case 1:
        page = const ChatBotConversationSteps();
        break;
      case 2:
        page = InterestStep(onTap: changePage);
        // page = EducationStep(onTap: changePage);
        break;
      case 3:
        page = const ConnectionStep();
        break;
      default:
        page = IntroductionStep(onTap: changePage);
    }
    return page;
  }

  bool _init = true;
  bool _isLoading = false;
  late OnboardingNotifier _onboardingNotifier;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_init) {
      _onboardingNotifier = Provider.of<OnboardingNotifier>(context);
      // print('storing schools');
      // GlobalRepository().saveGlobalSchools();
      // print('storing schools 2');

      setState(() {
        _isLoading = false;
        if (_onboardingNotifier.hasInterests!) {
          _page = 3;
        } else if (_onboardingNotifier.hasEducation!) {
          _page = 2;
        } else if (_onboardingNotifier.isAuth!) {
          _page = 0;
        }
      });
      _init = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance.init(context);
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: SizedBox(
              height: ScreenUtil.instance.screenHeight - 72.h,
              width: ScreenUtil.instance.screenWidth,
              child: Consumer<OnboardingNotifier>(
                builder: (ctx, onboarding, _) {
                  if (onboarding.userProfileStatus != InitEnum.initialized) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Center(
                          child: CircularProgressIndicator(),
                        ),
                      ],
                    );
                  }

                  // if (onboarding.hasEducation!) {
                  //   _page = 4;
                  // } else
                  // if (onboarding.hasOpportunities!) {
                  //   _page = 3;
                  // } else if (onboarding.hasInterests!) {
                  //   _page = 2;
                  // } else if (onboarding.hasUsername!) {
                  //   _page = 1;
                  // }
                  if (_onboardingNotifier.hasInterests!) {
                    _page = 3;
                  } else if (_onboardingNotifier.hasEducation!) {
                    _page = 2;
                  } else if (_onboardingNotifier.isAuth!) {
                    _page = 0;
                  }

                  ///..
                  ///
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      sizedBoxWithHeight(24),
                      AppStepper(
                        count: 5,
                        currIndex: _page,
                      ),
                      sizedBoxWithHeight(24),
                      renderStepPage(_page),
                      sizedBoxWithHeight(24),
                      // InterestStep(
                      //   onTap: changePage,
                      // ),
                      // ConnectionStep(),
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
