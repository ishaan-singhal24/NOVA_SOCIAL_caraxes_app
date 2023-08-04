import 'package:go_router/go_router.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/explore/explore_by_tags_mview.dart';
import 'package:nova_social/views/mobile_view/explore/explore_tags_view_all_mview.dart';
import 'package:nova_social/views/mobile_view/profile/explore/export.dart';
import 'package:nova_social/views/mobile_view/profile/profile_home_view/profile_mview.dart';

String _id = 'id';

class ExploreMRouter {
  static String exploreTagsViewAllRoute = '/explore-tags-view-all';
  static String exploreDreamRoute = '/explore-dream';
  static String exploreUserProfileRoute = '/explore-user-profile';
  static String exploreByTagsRoute = '/explore-profile-by-tags';

  static List<RouteBase> exploreMRoutes = [
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: exploreByTagsRoute,
      builder: (context, state) {
        return ExploreByTagsMView(
          args: state.extra as ExploreByTagsMViewArgs,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: exploreTagsViewAllRoute,
      builder: (context, state) {
        return ExploreTagsViewAllMView(
          args: state.extra as ExploreTagsViewAllMViewArgs,
        );
      },
    ),
    // GoRoute(
    //   parentNavigatorKey: AppEnvironment.rootNavigationKey,
    //   path: exploreInterestRoute,
    //   builder: (context, state) {
    //     return ExploreInterestMView(
    //       args: state.extra as ExploreInterestMViewArgs,
    //     );
    //   },
    // ),
    // GoRoute(
    //   parentNavigatorKey: AppEnvironment.rootNavigationKey,
    //   path: exploreAvailabilityRoute,
    //   builder: (context, state) {
    //     return ExploreAvailabiltyMView(
    //       args: state.extra as ExploreAvailabiltyMViewArgs,
    //     );
    //   },
    // ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: exploreDreamRoute,
      builder: (context, state) {
        return ExploreDreamsMView(
          args: state.extra as ExploreDreamsMViewArgs,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: exploreUserProfileRoute,
      builder: (context, state) {
        return ProfileMView(
          args: state.extra as ProfileMViewArgs,
        );
      },
    ),
  ];
}
