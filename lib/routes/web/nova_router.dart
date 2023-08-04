import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/app_key_names.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/onboarding/onboarding_screen.dart';
import 'package:nova_social/views/web_view/user_collection/user_collection_view.dart';
import 'package:nova_social/views/web_view/web_view.dart';

part 'user_route.dart';

String _id = 'id';
String _id2 = 'id2';

class NovaRouter {
  NovaRouter();

  static String baseRoute = '/';
  static String loadingRoute = '/loading';
  static String notFoundRoute = '/404';

  static String inviteRoute = '/invite';
  static String loginRoute = '/login';
  static String onboardingRoute = '/onboarding';
  static String collection = 'collection';
  static String userRoute = '/user';
  static String exploreInterestRoute = '/interest';
  static String exploreOpportunityRoute = '/available';

  GoRouter router() => GoRouter(
        initialLocation: baseRoute,
        navigatorKey: AppEnvironment.rootNavigationKey,
        refreshListenable: Listenable.merge(
          [
            GetIt.instance<AuthNotifier>(),
            GetIt.instance<ProfileNotifier>(),
          ],
        ),
        routes: [
          GoRoute(
            path: baseRoute,
            builder: (context, state) => const LoadingScreen(),
          ),
          GoRoute(
            path: loadingRoute,
            builder: (context, state) => const LoadingScreen(),
          ),
          GoRoute(
            path: loginRoute,
            builder: (context, state) => const LoginScreen(),
          ),
          GoRoute(
            path: onboardingRoute,
            builder: (context, state) => const OnboardingScreen(),
          ),
          GoRoute(
            path: userRoute,
            routes: userRoutes,
            builder: (context, state) => ProfileView(
              args: ProfileViewArgs(
                username: state.params[_id],
                uid: state.params[_id],
              ),
            ),
          ),
          GoRoute(
            path: '$exploreInterestRoute/:$_id',
            builder: (context, state) => ExploreView(
              args: ExploreViewArgs(
                id: (state.extra as NovaInterests).id,
                name: state.params[_id],
                filterBy: AppKeyNames.userInterestsIds,
                pageType: ExploreViewArgsPageType.interest,
              ),
            ),
          ),
          GoRoute(
            path: '$exploreOpportunityRoute/:$_id',
            builder: (context, state) => ExploreView(
              args: ExploreViewArgs(
                id: (state.extra as NovaOpportunities).id,
                name: state.params[_id],
                filterBy: AppKeyNames.userOpportunitiesIds,
                pageType: ExploreViewArgsPageType.available,
              ),
            ),
          ),
          GoRoute(
            path: '$inviteRoute/:$_id/:$_id2',
            builder: (context, state) => InviteView(
              args: InviteViewArgs(
                invitedByUsername: state.params[_id],
                inviteCode: state.params[_id2],
              ),
            ),
          ),
          GoRoute(
            path: notFoundRoute,
            builder: (context, state) => const PageNotFoundScreen(),
          ),
        ],
        redirect: (context, state) {
          if (state.subloc.startsWith(notFoundRoute) ||
              state.subloc.startsWith(inviteRoute)) {
            return state.subloc;
          }
          if (state.subloc.startsWith(userRoute) &&
              state.subloc.startsWith('$userRoute$loadingRoute').not) {
            print('Called subloc');
            return state.subloc;
          }
          print('Nova Route');
          final authNoti = GetIt.instance<AuthNotifier>();
          final profileNoti = GetIt.instance<ProfileNotifier>();
          final isLoggedIn = authNoti.authStatus == InitEnum.initialized;
          final isLoggingIn = state.subloc == loginRoute;
          final inTheWaitlist = profileNoti.userProfile?.inTheWaitlist ?? true;
          final isProfileLoaded =
              profileNoti.userProfileStatus == InitEnum.initialized;

          if (authNoti.authStatus == null) return null;
          if (!isLoggedIn && !isLoggingIn) return loginRoute;
          if (isLoggedIn) {
            print('Logged IN');
            if (isProfileLoaded.not) return '$userRoute$loadingRoute';
            print('Logged IN 2');

            if (inTheWaitlist && isProfileLoaded) return onboardingRoute;
            print('Logged IN 3');

            if (state.subloc.startsWith(userRoute) ||
                state.subloc == baseRoute) {
              return '$userRoute/${profileNoti.userProfile?.username}';
            }
            print('Logged IN 4');
          }
          print('OUT 5');
          return state.subloc;
        },
        errorBuilder: (context, state) {
          print("Router ${state.error}");
          return const PageNotFoundScreen();
        },
      );
}
