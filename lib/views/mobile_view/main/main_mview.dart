import 'dart:ui';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/feed_routes/feed_mroutes.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/app_drawer.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/feed/feed_detailed/feed_detailed_mview.dart';
import 'package:nova_social/views/mobile_view/main/widgets/custom_app_bar.dart';
import 'package:provider/provider.dart';
import 'package:xml/xml.dart';

class MainMView extends StatefulWidget {
  final String location;
  final Widget child;

  const MainMView({
    super.key,
    required this.child,
    required this.location,
  });

  @override
  State<MainMView> createState() => _MainMViewState();
}

class _MainMViewState extends State<MainMView> {
  String? deepLinkPath;
  int _currentIndex = 0;
  String _pageHead = 'Nova';
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  late NotificationNotifier notificationNoti;
  String initialLocation = MobileRouter.feedViewRoute;
  int? notificationCount;

  @override
  void initState() {
    super.initState();
    initialLocation = MobileRouter.feedViewRoute;
    notificationNoti =
        Provider.of<NotificationNotifier>(context, listen: false);
    notificationNoti.fetchNotifications();
    initDynamicLinks();
  }

  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  String? feedId;

  Future<void> initDynamicLinks() async {
    ///THIS METHOD ONLY WORKS FOR FEED IS RIGHT NOW
    ///CHANGE ACC. IF MORE DYNAMIC LINKS ARE BEING ADDED
    dynamicLinks.onLink.listen((PendingDynamicLinkData? dynamicLinkData) async {
      Uri? deepLink = dynamicLinkData?.link;

      if (deepLink != null) {
        // Extract data from the dynamic link
        feedId = deepLink.queryParameters['feedId'];

        if (feedId?.isNotEmpty ?? false) {
          AppEnvironment.deepLinkArgs.value = feedId;
          AppEnvironment.deepLinkPath.value = FeedMRouter.feedDetailedViewRoute;
        }
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
        feedId = deepLink.queryParameters['feedId'];

        if (feedId?.isNotEmpty ?? false) {
          AppEnvironment.deepLinkArgs.value = feedId;
          AppEnvironment.deepLinkPath.value = FeedMRouter.feedDetailedViewRoute;
        }
      }
    });
  }

  setInitialLocation(int i) {
    switch (i) {
      case 0:
        _pageHead = 'Feed';
        initialLocation = FeedMRouter.feedViewRoute;
        break;
      case 1:
        _pageHead = 'Network';
        initialLocation = MobileRouter.connectionRoute;
        break;
      case 2:
        _pageHead = 'Robin';
        initialLocation = MobileRouter.chatBotRoute;
        break;
      case 3:
        _pageHead = 'Explore';
        initialLocation = MobileRouter.exploreByTagsRoute;
        break;
      case 4:
        _pageHead = 'Notifications';
        initialLocation = MobileRouter.notificationRoute;
        break;

      // case 4:
      //   _pageHead = '';
      //   initialLocation = MobileRouter.profileShellRoute;
      // break;
      default:
        initialLocation = MobileRouter.feedViewRoute;
    }
  }

  int currentIndex() {
    if (widget.location == FeedMRouter.feedViewRoute) {
      return 0;
    } else if (widget.location == MobileRouter.connectionRoute) {
      return 1;
    } else if (widget.location == MobileRouter.chatBotRoute) {
      return 2;
    } else if (widget.location == MobileRouter.exploreByTagsRoute) {
      return 3;
    } else if (widget.location == MobileRouter.notificationRoute) {
      return 4;
    }
    return 0;
  }

  @override
  void dispose() {
    notificationNoti.cancelNotifications();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final notificationNoti = Provider.of<NotificationNotifier>(context);
    notificationCount = notificationNoti.notifications
        ?.where(
          (element) => element.isRead != true,
        )
        .toList()
        .length;
    return ValueListenableBuilder(
        valueListenable: AppEnvironment.deepLinkPath,
        builder: (BuildContext context, String path, _) {
          if (path == MobileRouter.connectionRoute) {
            setInitialLocation(3);
            _goOtherTab(context, 3);
          } else if (path.isNotEmpty) {
            if (AppEnvironment.deepLinkArgs.value != null) {
              // context.go(path, extra: AppEnvironment.deepLinkArgs.value);
              return FeedDetailedMView(
                args: FeedDetailedMViewArgs(
                  feedId: AppEnvironment.deepLinkArgs.value as String?,
                ),
              );
            } else {
              context.go(path);
            }
            return const SizedBox();
          }
          return Scaffold(
            key: _scaffoldKey,
            appBar: CustomAppBar(
              head: _pageHead,
              height: 60.h,
              scaffoldKey: _scaffoldKey,
            ),
            drawer: const AppDrawer(),
            body: widget.child,
            extendBody: true,
            bottomNavigationBar: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: BottomNavigationBar(
                  // selectedItemColor: AppColors.novaPurple,
                  // unselectedItemColor: AppColors.novaWhite,
                  showUnselectedLabels: false,
                  showSelectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: AppColors.novaWhite.withOpacity(0.1),
                  onTap: (int index) {
                    setInitialLocation(index);
                    _goOtherTab(context, index);
                  },
                  currentIndex: currentIndex(),
                  items: [
                    MyCustomBottomNavBarItem(
                      icon: Iconify(
                        MaterialSymbols.home_outline_sharp,
                        color: AppColors.novaWhite,
                      ),
                      activeIcon: Iconify(
                        MaterialSymbols.home_outline_sharp,
                        color: AppColors.novaIndigo,
                      ),
                      label: 'Home',
                      initialLocation: FeedMRouter.feedViewRoute,
                    ),
                    MyCustomBottomNavBarItem(
                      icon: Iconify(
                        MaterialSymbols.group_outline_rounded,
                        color: AppColors.novaWhite,
                      ),
                      activeIcon: Iconify(
                        MaterialSymbols.group,
                        color: AppColors.novaIndigo,
                      ),
                      label: 'Connect',
                      initialLocation: MobileRouter.connectionRoute,
                    ),
                    MyCustomBottomNavBarItem(
                      icon: AppAssetImageHandlerMWidget(
                        imagePath: AppAssets.robin,
                        errorText: 'R',
                        boxColor: ThemeHandler.mutedColor(nonInverse: false)
                            .withOpacity(0.1),
                      ),
                      activeIcon: AppAssetImageHandlerMWidget(
                        imagePath: AppAssets.robin,
                        errorText: 'R',
                        boxColor: ThemeHandler.mutedColor(nonInverse: false)
                            .withOpacity(0.1),
                      ),
                      label: 'Robin',
                      initialLocation: MobileRouter.profileRoute,
                    ),
                    MyCustomBottomNavBarItem(
                      icon: Iconify(
                        MaterialSymbols.rocket_launch_outline_rounded,
                        color: AppColors.novaWhite,
                      ),
                      activeIcon: Iconify(
                        MaterialSymbols.rocket_launch_rounded,
                        color: AppColors.novaIndigo,
                      ),
                      label: 'Space Station',
                      initialLocation: MobileRouter.exploreByTagsRoute,
                    ),
                    MyCustomBottomNavBarItem(
                      icon: Badge(
                        isLabelVisible: (notificationCount ?? 0) > 0,
                        label: Text(
                          notificationCount.toString(),
                          style: AppTextStyles.text10w400,
                        ),
                        child: Iconify(
                          MaterialSymbols.notifications_outline_rounded,
                          color: AppColors.novaWhite,
                        ),
                      ),
                      activeIcon: Iconify(
                        MaterialSymbols.notifications_rounded,
                        color: AppColors.novaIndigo,
                      ),
                      label: 'Notifications',
                      initialLocation: MobileRouter.notificationRoute,
                    ),
                    // MyCustomBottomNavBarItem(
                    //   icon: Iconify(
                    //     MaterialSymbols.person_2_outline,
                    //     color: AppColors.novaWhite,
                    //   ),
                    //   activeIcon: Iconify(
                    //     MaterialSymbols.person_2,
                    //     color: AppColors.novaIndigo,
                    //   ),
                    //   label: 'Profile',
                    //   initialLocation: MobileRouter.profileRoute,
                    // ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  void _goOtherTab(BuildContext context, int index) {
    if (index == _currentIndex) return;
    GoRouter router = GoRouter.of(context);
    String location = initialLocation;
    var extra;
    if (location == MobileRouter.profileShellRoute ||
        location == MobileRouter.profileRoute) {
      extra = ProfileMViewArgs(
        profile:
            Provider.of<ProfileNotifier>(context, listen: false).userProfile,
        isCurrentUser: true,
      );
    } else if (location == MobileRouter.exploreByTagsRoute) {
      extra = const ExploreByTagsMViewArgs(
        selectedInterest: null,
        selectedOpportunity: null,
      );
    }
    setState(() {
      _currentIndex = index;
    });
    router.go(location, extra: extra);
  }
}

class MyCustomBottomNavBarItem extends BottomNavigationBarItem {
  final String initialLocation;

  const MyCustomBottomNavBarItem(
      {required this.initialLocation,
      required Widget icon,
      String? label,
      Widget? activeIcon})
      : super(icon: icon, label: label, activeIcon: activeIcon ?? icon);
}
