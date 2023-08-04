import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/routes.dart';
import 'package:nova_social/utils/app_environment.dart';
import 'package:nova_social/utils/responsive.dart';
import 'package:nova_social/views/web_view/login/login_screen.dart';
import 'package:nova_social/views/web_view/onboarding/onboarding_screen.dart';
import 'package:nova_social/views/web_view/profile/profile_view.dart';
import 'package:nova_social/views/web_view/mobile/mobile_web_screen.dart';
import 'package:nova_social/views/web_view/web_view.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AuthNotifier>(context, listen: false).authState();
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Home');
    if (ResponsiveWidget.isSmallScreen()) {
      return const MobileWebScreen();
    }
    return Selector<AuthNotifier, InitEnum?>(
      selector: (ctx, authNotifier) => authNotifier.authStatus,
      builder: (context, authStatus, _) {
        if (authStatus == InitEnum.initializing || authStatus == null) {
          return const LoadingScreen();
        }
        // else if (authStatus == InitEnum.uninitialized) {
        //   context.go(NovaRouter.loginRoute);
        // }
        // return OnboardingScreen();
        return Selector<ProfileNotifier, bool?>(
          selector: (ctx, profileNotifier) =>
              profileNotifier.userProfile?.inTheWaitlist,
          builder: (ctx, inTheWaitlist, _) {
            final username =
                Provider.of<ProfileNotifier>(context).userProfile?.username;
            print('Home1');

            if (inTheWaitlist ?? true) {
              print('Home2');
              return const OnboardingScreen();
            } else {
              print('Home3');

              Future.microtask(
                () => context.go('${NovaRouter.userRoute}/$username'),
              );
            }
            return const LoadingScreen();
          },
        );
      },
    );
  }
}
