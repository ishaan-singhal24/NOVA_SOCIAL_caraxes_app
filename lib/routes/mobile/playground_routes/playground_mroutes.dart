import 'package:go_router/go_router.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/playground/comments/playground_feed_comment_mview.dart';
import 'package:nova_social/views/mobile_view/playground/playground_feed_detailed/playground_feed_detailed_mview.dart';

class PlaygroundFeedMRouter {
  static String playgroundfeedViewRoute = '/playground-feed';
  // static String feedViewRoute = '/feed';
  static String playgroundFeedDetailedViewRoute = '/playgroundfeed-detail';
  static String createPlaygroundFeedViewRoute = '/create-playgroundfeed';
  static String playgroundFeedCommentViewRoute = '/playgroundfeed-comments';

  static List<RouteBase> playgroundfeedMRoutes = [
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: playgroundFeedDetailedViewRoute,
      builder: (context, state) {
        final PlaygroundFeedDetailedMViewArgs args =
            (state.extra as PlaygroundFeedDetailedMViewArgs);
        return PlaygroundFeedDetailedMView(
          args: args,
        );
      },
    ),
    // GoRoute(
    //   parentNavigatorKey: AppEnvironment.rootNavigationKey,
    //   path: createPlaygroundFeedViewRoute,
    //   builder: (context, state) {
    //     return const CreatePlaygroundFeedMView();
    //   },
    // ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: playgroundFeedCommentViewRoute,
      builder: (context, state) {
        return const PlaygroundFeedCommentMView();
      },
    ),
  ];
}
