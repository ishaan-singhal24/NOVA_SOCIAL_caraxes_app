import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/repository/config/config_repository.dart';
import 'package:nova_social/routes/mobile/feed_routes/feed_mroutes.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/feed/feed_detailed/feed_detailed_mview.dart';
import 'package:nova_social/views/mobile_view/loading/loading_mview.dart';
import 'package:nova_social/views/mobile_view/mobile_view.dart';
import 'package:provider/provider.dart';

class BaseControlMView extends StatefulWidget {
  const BaseControlMView({Key? key}) : super(key: key);

  @override
  State<BaseControlMView> createState() => _BaseControlMViewState();
}

class _BaseControlMViewState extends State<BaseControlMView> {
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  StreamSubscription? dynamicLinksSubscription;
  InitEnum? isInternetAvailable = InitEnum.uninitialized;
  InitEnum? isPageInitialised = InitEnum.uninitialized;

  // String? feedId;

  Stream<ConnectivityResult>? networkConnectionStream;

  Future<void> networkStatus() async {
    final networkConnectivity = await ConfigRepository().networkConnectivity();
    if (networkConnectivity.isSuccess.not) {
      isInternetAvailable = InitEnum.uninitialized;
      setState(() {});
    }
    networkConnectionStream = ConfigRepository().networkConnectionStream();
    networkConnectionStream?.listen((event) async {
      isInternetAvailable = InitEnum.initializing;
      if (event != ConnectivityResult.none) {
        final result = await ConfigRepository().isInternetAvailable();
        isInternetAvailable =
            result.isSuccess ? InitEnum.initialized : InitEnum.uninitialized;
      } else {
        isInternetAvailable = InitEnum.uninitialized;
      }
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    print('check init');
    setState(() {
      isPageInitialised = InitEnum.initializing;
    });
    initDynamicLinks().then((value) {
      setState(() {
        isPageInitialised = InitEnum.initialized;
      });
    });
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<AuthNotifier>(context, listen: false).authState();
      // networkStatus();
    });
  }

  Future<void> initDynamicLinks() async {
    ///THIS METHOD ONLY WORKS FOR FEED RIGHT NOW
    ///CHANGE ACC. IF MORE DYNAMIC LINKS ARE BEING ADDED
    dynamicLinksSubscription = dynamicLinks.onLink.listen(
        (PendingDynamicLinkData? dynamicLinkData) async {
      Uri? deepLink = dynamicLinkData?.link;

      if (deepLink != null) {
        // Extract data from the dynamic link
        AppEnvironment.deepLinkArgs.value = deepLink.queryParameters['feedId'];
        AppEnvironment.deepLinkPath.value = FeedMRouter.feedDetailedViewRoute;
      }
    }, onError: (e) async {
      Logger.logMsg('Dynamic Link Failed', '${e.message}');
    });

    // Check if the app was launched from a dynamic link
    FirebaseDynamicLinks.instance
        .getInitialLink()
        .then((PendingDynamicLinkData? dynamicLinkData) async {
      Uri? deepLink = dynamicLinkData?.link;
      if (deepLink != null) {
        AppEnvironment.deepLinkArgs.value = deepLink.queryParameters['feedId'];
        AppEnvironment.deepLinkPath.value = FeedMRouter.feedDetailedViewRoute;
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    dynamicLinksSubscription?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<AuthNotifier, InitEnum?>(
      selector: (ctx, authNotifier) => authNotifier.authStatus,
      builder: (context, authStatus, _) {
        // if (isInternetAvailable == null ||
        //     isInternetAvailable == InitEnum.initializing) {
        //   return LoadingMView(color: AppColors.novaYellow);
        // }
        // if (isInternetAvailable == InitEnum.uninitialized) {
        //   return const NoInternetMView();
        // }
        if (authStatus == InitEnum.uninitialized || authStatus == null) {
          return const LoginMView();
        } else if (authStatus == InitEnum.initializing) {
          return LoadingMView(
            color: AppColors.novaBrown,
          );
        }
        return Consumer<ProfileNotifier>(
          builder: (ctx, profileNotifier, _) {
            final inTheWaitlist = profileNotifier.userProfile?.inTheWaitlist;
            if (inTheWaitlist == null) {
              return const OnboardingMView();
            } else if (inTheWaitlist) {
              return const UserWaitlistMView();
            } else if (inTheWaitlist.not) {
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                context.go(
                  MobileRouter.feedViewRoute,
                );
              });

              // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              //   context.go(
              //     MobileRouter.profileShellRoute,
              //     extra: ProfileMViewArgs(
              //       profile: profileNotifier.userProfile,
              //       isCurrentUser: true,
              //     ),
              //   );
              // });

              // return ProfileMView(
              //   args: ProfileMViewArgs(
              //     profile: profileNotifier.userProfile,
              //     isCurrentUser: true,
              //   ),
              // );
              // return SpaceStationMView(
              //     // args: ProfileMViewArgs(
              //     //   profile: profileNotifier.userProfile,
              //     //   isCurrentUser: true,
              //     // ),
              //     );
            }
            return LoadingMView(
              color: AppColors.novaGrey,
            );
          },
        );
      },
    );
  }
}
