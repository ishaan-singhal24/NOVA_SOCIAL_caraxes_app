import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/feed/comments/feed_comment_mview.dart';
import 'package:nova_social/views/mobile_view/feed/create_feed/create_feed_mview.dart';
import 'package:nova_social/views/mobile_view/feed/create_feed/widgets/feed_image_preview_mview.dart';
import 'package:nova_social/views/mobile_view/feed/feed_detailed/feed_detailed_mview.dart';

class FeedMRouter {
  static String feedViewRoute = '/feed';
  static String feedDetailedViewRoute = '/feed-detail';
  static String createFeedViewRoute = '/create-feed';
  static String feedCommentViewRoute = '/feed-comments';

  static String feedImagePreviewMViewRoute = '/feed-image-preview';

  static List<RouteBase> feedMRoutes = [
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: feedDetailedViewRoute,
      builder: (context, state) {
        final FeedDetailedMViewArgs args =
            (state.extra as FeedDetailedMViewArgs);
        return FeedDetailedMView(
          args: args,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: createFeedViewRoute,
      builder: (context, state) {
        // final CreateFeedMViewArgs args = (state.extra as CreateFeedMViewArgs);

        final CreateFeedMViewArgs? args =
            (state.extra != null && state.extra is CreateFeedMViewArgs)
                ? state.extra as CreateFeedMViewArgs
                : null;
        return CreateFeedMView(
          args: args,
        );
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: feedCommentViewRoute,
      builder: (context, state) {
        return const FeedCommentMView();
      },
    ),
    GoRoute(
      parentNavigatorKey: AppEnvironment.rootNavigationKey,
      path: feedImagePreviewMViewRoute,
      builder: (context, state) {
        final function =
            state.extra as Function(List<String>, List<Uint8List?>?);
        return FeedImagePreviewMView(
          onPickImage: function,
        );
      },
    ),
  ];
}
