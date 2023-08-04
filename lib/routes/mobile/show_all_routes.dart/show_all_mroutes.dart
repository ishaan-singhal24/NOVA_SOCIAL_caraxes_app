import 'package:go_router/go_router.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/profile/profile_activity_show_all/profile_activity_show_all_mview.dart';
import 'package:nova_social/views/mobile_view/profile/profile_show_all/profile_show_all_awards_mview.dart';
import 'package:nova_social/views/mobile_view/profile/profile_show_all/profile_show_all_education_mview.dart';
import 'package:nova_social/views/mobile_view/profile/profile_show_all/profile_show_all_experiences_mview.dart';
import 'package:nova_social/views/mobile_view/profile/profile_show_all/profile_show_all_test_score_mview.dart';
import 'package:nova_social/views/mobile_view/profile/profile_show_all/profile_show_all_volunteer_mview.dart';

class ShowAllMRouter {
  static String showAllEducationRoute = '/show-all-education';
  static String showAllVolunteeredRoute = '/show-all-volunteered';
  static String showAllTestScoresRoute = '/show-all-test-scores';
  static String showAllAwardsRoute = '/show-all-awards';
  static String showAllExperiencesRoute = '/show-all-experiences';

  static String showAllActivityRoute = '/show-all-activity';

  static List<RouteBase> showAllMRoutes = [
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: showAllEducationRoute,
      builder: (context, state) {
        return ProfileShowAllEducationMView(
          args: state.extra as ProfileMViewArgs,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: showAllVolunteeredRoute,
      builder: (context, state) {
        return ProfileShowAllVolunteerMView(
          args: state.extra as ProfileMViewArgs,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: showAllTestScoresRoute,
      builder: (context, state) {
        return ProfileShowAllTestScoresMView(
          args: state.extra as ProfileMViewArgs,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: showAllAwardsRoute,
      builder: (context, state) {
        return ProfileShowAllAwardsMView(
          args: state.extra as ProfileMViewArgs,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: showAllExperiencesRoute,
      builder: (context, state) {
        return ProfileShowAllExperiencesMView(
          args: state.extra as ProfileMViewArgs,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: showAllActivityRoute,
      builder: (context, state) {
        return ProfileActivityShowAllMView(
          args: state.extra as ProfileMViewArgs,
        );
      },
    ),
  ];
}
