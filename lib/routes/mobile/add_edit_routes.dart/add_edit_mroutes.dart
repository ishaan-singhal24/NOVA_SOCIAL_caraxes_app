import 'package:go_router/go_router.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/views/top/profile_add_edit_about_mview.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/views/top/profile_add_edit_availability_mview.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/views/top/profile_add_edit_dream_mview.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/views/top/profile_add_edit_interests_mview.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/views/top/profile_add_edit_intro_mview.dart.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/views/top/profile_add_edit_profile_image_mview.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/views/top/profile_add_edit_social_mview.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/views/center/profile_add_edit_award_mview.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/views/center/profile_add_edit_education_mview.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/views/center/profile_add_edit_experience_mview.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/views/center/profile_add_edit_test_score_mview.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/views/center/profile_add_edit_volunteered_mview.dart';
import 'package:nova_social/views/mobile_view/profile/profile_add_edit_views/views/top/profile_add_edit_wallpaper_image.dart';
import 'package:nova_social/views/mobile_view/profile/user_collection_item/add_edit/add_edit_user_collection_item_mview.dart';

String _id = 'id';

class AddEditMRouter {
  static String addEditAboutRoute = '/add-edit-about';
  static String addEditExperienceRoute = '/add-edit-experience';
  static String addEditEducationRoute = '/add-edit-education';
  static String addEditVolenteerRoute = '/add-edit-volenteer';
  static String addEditTestScoreRoute = '/add-edit-test-score';
  static String addEditAwardRoute = '/add-edit-award';
  static String addEditIntroRoute = '/add-edit-intro';
  static String addEditSocialRoute = '/add-edit-social';
  static String addEditCollectionRoute = '/add-edit-collection';
  static String addEditInterestRoute = '/add-edit-interest';
  static String addEditAvailabilityRoute = '/add-edit-availability';
  static String addEditDreamRoute = '/add-edit-dream';
  static String addEditWallpaperImageRoute = '/add-edit-wallpaper-image';
  static String addEditProfileImageRoute = '/add-edit-profile-image';

  static List<RouteBase> addEditMRoutes = [
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: addEditAboutRoute,
      builder: (context, state) {
        final bool isAdd = (state.extra as bool);
        return ProfileAddEditAboutMView(
          isAdd: isAdd,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: addEditSocialRoute,
      builder: (context, state) {
        final bool isAdd = (state.extra as bool);
        return ProfileAddEditSocialMView(
          isAdd: isAdd,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: addEditInterestRoute,
      builder: (context, state) {
        return const ProfileAddEditInterestMView();
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: addEditAvailabilityRoute,
      builder: (context, state) {
        return const ProfileAddEditAvailabilityMView();
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: addEditDreamRoute,
      builder: (context, state) {
        return ProfileAddEditDreamMView(
          dreamType: state.extra as ProfileAddEditDreamType,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: addEditExperienceRoute,
      builder: (context, state) {
        final ProfileAddEditExperienceMViewArgs args =
            (state.extra as ProfileAddEditExperienceMViewArgs);
        return ProfileAddEditExperienceMView(
          args: args,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: addEditEducationRoute,
      builder: (context, state) {
        final ProfileAddEditEducationMViewArgs args =
            (state.extra as ProfileAddEditEducationMViewArgs);
        return ProfileAddEditEducationMView(
          args: args,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: addEditVolenteerRoute,
      builder: (context, state) {
        final ProfileAddEditVolunteeredMViewArgs args =
            (state.extra as ProfileAddEditVolunteeredMViewArgs);
        return ProfileAddEditVolunteeredMView(
          args: args,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: addEditTestScoreRoute,
      builder: (context, state) {
        final ProfileAddEditTestScoreMViewArgs args =
            (state.extra as ProfileAddEditTestScoreMViewArgs);
        return ProfileAddEditTestScoreMView(
          args: args,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: addEditAwardRoute,
      builder: (context, state) {
        final ProfileAddEditAwardMViewArgs args =
            (state.extra as ProfileAddEditAwardMViewArgs);
        return ProfileAddEditAwardMView(
          args: args,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: addEditCollectionRoute,
      builder: (context, state) {
        final AddEditCollectionItemMViewArgs args =
            (state.extra as AddEditCollectionItemMViewArgs);
        return AddEditUserCollectionItemMView(
          args: args,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: addEditIntroRoute,
      builder: (context, state) {
        final bool isAdd = (state.extra as bool);
        return ProfileAddEditIntroMView(
          isAdd: isAdd,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: addEditWallpaperImageRoute,
      builder: (context, state) {
        final ProfileMViewArgs args = (state.extra as ProfileMViewArgs);
        return ProfileAddEditWallpaperImageMView(
          args: args,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: addEditProfileImageRoute,
      builder: (context, state) {
        final ProfileMViewArgs args = (state.extra as ProfileMViewArgs);
        return ProfileAddEditProfileImageMView(
          args: args,
        );
      },
    ),
  ];
}
