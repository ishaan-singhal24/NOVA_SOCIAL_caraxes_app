import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/routes/mobile/explore_routes.dart/explore_mroutes.dart';
import 'package:nova_social/routes/mobile/feed_routes/feed_mroutes.dart';
import 'package:nova_social/routes/mobile/playground_routes/playground_mroutes.dart';
import 'package:nova_social/routes/mobile/show_all_routes.dart/show_all_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/chat_bot/chat_bot_mview.dart';
import 'package:nova_social/views/mobile_view/connection/connection_mview.dart';
import 'package:nova_social/views/mobile_view/connection/connection_requests_mview.dart';
import 'package:nova_social/views/mobile_view/connection/manage_network_mview.dart';
import 'package:nova_social/views/mobile_view/explore/explore_by_tags_mview.dart';
import 'package:nova_social/views/mobile_view/feed/feed_view/feed_mview.dart';
import 'package:nova_social/views/mobile_view/internship/categories/internship_categories_mview.dart';
import 'package:nova_social/views/mobile_view/internship/internships_by_categories/internships_by_categories_mview.dart';
import 'package:nova_social/views/mobile_view/main/main_mview.dart';
import 'package:nova_social/views/mobile_view/mobile_view.dart';
import 'package:nova_social/views/mobile_view/notification/notification_mview.dart';
import 'package:nova_social/views/mobile_view/playground/playground_view/playground_mview.dart';
import 'package:nova_social/views/mobile_view/profile/sop/sop_generator/sop_generator_mview.dart';
import 'package:nova_social/views/mobile_view/profile/sop/sop_reviewer/sop_reviewer_mview.dart';
import 'package:nova_social/views/mobile_view/profile/user_collection_item/user_collection_item_home/user_collection_item_mview.dart';
import 'package:nova_social/views/mobile_view/search/search_mview.dart';
import 'package:nova_social/views/mobile_view/settings/settings_mview.dart';
import 'package:nova_social/views/mobile_view/try_explore_map/try_explore_map.dart';
import 'package:nova_social/views/web_view/web_view.dart';

import 'add_edit_routes.dart/add_edit_mroutes.dart';
import 'space_station_routes.dart/space_station_routes.dart';

final _shellNavigatorKey = GlobalKey<NavigatorState>();

class MobileRouter {
  MobileRouter();

  static String baseRoute = '/';
  static String loadingRoute = '/loading';
  static String notFoundRoute = '/404';

  static String loginRoute = '/login';
  static String verifyOTPRoute = '/verify-otp';
  static String onboardingRoute = '/onboarding';
  static String userWaitlistRoute = '/waitlist';
  static String profileRoute = '/profile';
  static String profileShellRoute = '/profile-shell';
  static String homeRoute = '/home';
  static String userCollectionRoute = '/user-collection';
  static String sopGeneratorRoute = '/sop-generator';
  static String sopReviewerRoute = '/sop-reviewer';
  static String playgroundRoute = '/playground';
  static String tryExploreRoute = '/try-explore-route';
  static String notificationRoute = '/notification';
  static String connectionRoute = '/connection';
  static String manageNetworkRoute = '/manage-network';
  static String feedViewRoute = '/feed';
  static String exploreByTagsRoute = '/explore-by-tags';
  static String connectionReqRoute = '/connection-requests';
  static String chatBotRoute = '/chat-bot-robin';
  static String searchRoute = '/search';

  static String internshipCategoriesRoute = '/internship-categories';
  static String internshipsByCategoriesRoute = '/internships';

  static String settingsRoute = '/settings';

  GoRouter router() => GoRouter(
        initialLocation: baseRoute,
        navigatorKey: AppEnvironment.rootNavigationKey,
        routes: [
          GoRoute(
            parentNavigatorKey: AppEnvironment.rootNavigationKey,
            path: loadingRoute,
            builder: (context, state) => const LoadingScreen(),
          ),
          GoRoute(
            path: baseRoute,
            builder: (context, state) => const BaseControlMView(),
          ),
          GoRoute(
            parentNavigatorKey: AppEnvironment.rootNavigationKey,
            path: loginRoute,
            builder: (context, state) => const LoginMView(),
          ),
          GoRoute(
            parentNavigatorKey: AppEnvironment.rootNavigationKey,
            path: verifyOTPRoute,
            builder: (context, state) => const VerifyOTPMView(),
          ),
          GoRoute(
            parentNavigatorKey: AppEnvironment.rootNavigationKey,
            path: onboardingRoute,
            builder: (context, state) => const OnboardingMView(),
          ),
          GoRoute(
            parentNavigatorKey: AppEnvironment.rootNavigationKey,
            path: userWaitlistRoute,
            builder: (context, state) => const UserWaitlistMView(),
          ),
          GoRoute(
            parentNavigatorKey: AppEnvironment.rootNavigationKey,
            path: userCollectionRoute,
            builder: (context, state) {
              return UserCollectionItemMView(
                args: state.extra as UserCollectionItemMViewArgs,
              );
            },
          ),

          GoRoute(
            parentNavigatorKey: AppEnvironment.rootNavigationKey,
            path: chatBotRoute,
            builder: (context, state) {
              return const ChatBotMView();
            },
          ),

          GoRoute(
            parentNavigatorKey: AppEnvironment.rootNavigationKey,
            path: searchRoute,
            builder: (context, state) {
              return const SearchMView();
            },
          ),

          //Internship Routes
          GoRoute(
            parentNavigatorKey: AppEnvironment.rootNavigationKey,
            path: internshipCategoriesRoute,
            builder: (context, state) {
              return const InternshipCategoriesMView();
            },
          ),
          GoRoute(
            parentNavigatorKey: AppEnvironment.rootNavigationKey,
            path: internshipsByCategoriesRoute,
            builder: (context, state) {
              return const InternshipsByCategoriesMView();
            },
          ),
          //...

          //Other Routes
          ...AddEditMRouter.addEditMRoutes,
          ...ShowAllMRouter.showAllMRoutes,
          ...ExploreMRouter.exploreMRoutes,
          ...FeedMRouter.feedMRoutes,
          ...PlaygroundFeedMRouter.playgroundfeedMRoutes,

          //Shell Route
          ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              return MainMView(
                location: state.location,
                child: child,
              );
            },
            routes: [
              GoRoute(
                path: homeRoute,
                name: homeRoute,
                parentNavigatorKey: _shellNavigatorKey,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ConnectionMView(),
                  //replace with feed view
                ),
              ),
              GoRoute(
                path: connectionRoute,
                name: connectionRoute,
                parentNavigatorKey: _shellNavigatorKey,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ConnectionMView(),
                ),
              ),
              ...SpaceStationRouter.spaceStationRoutes,
              GoRoute(
                name: feedViewRoute,
                path: feedViewRoute,
                pageBuilder: (context, state) {
                  return const NoTransitionPage(
                    child: FeedMView(),
                  );
                },
              ),
              GoRoute(
                path: exploreByTagsRoute,
                name: exploreByTagsRoute,
                pageBuilder: (context, state) {
                  return NoTransitionPage(
                    child: ExploreByTagsMView(
                      args: state.extra as ExploreByTagsMViewArgs,
                    ),
                  );
                },
              ),
              GoRoute(
                path: notificationRoute,
                name: notificationRoute,
                parentNavigatorKey: _shellNavigatorKey,
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: NotificationMView(),
                ),
              ),
              GoRoute(
                parentNavigatorKey: _shellNavigatorKey,
                name: profileShellRoute,
                path: profileShellRoute,
                pageBuilder: (context, state) => NoTransitionPage(
                  child: ProfileMView(args: state.extra as ProfileMViewArgs),
                ),
                // builder: (context, state) =>
                //     ProfileMView(args: state.extra as ProfileMViewArgs),
              ),
            ],
          ),
          //...

          GoRoute(
            parentNavigatorKey: AppEnvironment.rootNavigationKey,
            name: profileRoute,
            path: profileRoute,
            builder: (context, state) =>
                ProfileMView(args: state.extra as ProfileMViewArgs),
          ),

          //AI Tools
          GoRoute(
            parentNavigatorKey: AppEnvironment.rootNavigationKey,
            path: sopGeneratorRoute,
            builder: (context, state) => const SopGeneratorMView(),
          ),
          GoRoute(
            parentNavigatorKey: AppEnvironment.rootNavigationKey,
            path: sopReviewerRoute,
            builder: (context, state) => const SopReviewerMView(),
          ),
          GoRoute(
            parentNavigatorKey: AppEnvironment.rootNavigationKey,
            path: playgroundRoute,
            builder: (context, state) => const PlaygroundMView(),
          ),
          //...

          GoRoute(
            parentNavigatorKey: AppEnvironment.rootNavigationKey,
            path: tryExploreRoute,
            builder: (context, state) => const TryExploreMap(),
          ),
          GoRoute(
            parentNavigatorKey: AppEnvironment.rootNavigationKey,
            path: manageNetworkRoute,
            builder: (context, state) => ManageNetworkMView(
              args: state.extra as ManageNetworkMViewArgs,
            ),
          ),
          GoRoute(
            parentNavigatorKey: AppEnvironment.rootNavigationKey,
            path: connectionReqRoute,
            builder: (context, state) => const ConnectionRequestsMView(),
          ),
          GoRoute(
            parentNavigatorKey: AppEnvironment.rootNavigationKey,
            path: settingsRoute,
            builder: (context, state) => const SettingsMView(),
          ),
          GoRoute(
            path: notFoundRoute,
            builder: (context, state) => const PageNotFoundScreen(),
          ),
        ],
      );
}
