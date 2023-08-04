import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/misc/misc.dart';
import 'package:nova_social/data/models/user/user.dart';
import 'package:nova_social/notifiers/profile/profile_notifier.dart';
import 'package:nova_social/routes/mobile/feed_routes/feed_mroutes.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/routes/mobile/playground_routes/playground_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';

class NotificationItemMTile extends StatefulWidget {
  final RepoNotification notification;
  final Function(bool)? tileSeen;
  const NotificationItemMTile({
    super.key,
    required this.notification,
    this.tileSeen,
  });

  @override
  State<NotificationItemMTile> createState() => _NotificationItemMTileState();
}

class _NotificationItemMTileState extends State<NotificationItemMTile> {
  late UserModel? fromUserModel;
  @override
  void initState() {
    super.initState();
    if (widget.notification.isRead != true && widget.tileSeen != null) {
      Future.delayed(
          const Duration(
            seconds: 3,
          ), () {
        widget.tileSeen!(true);
      });
    }
    parseMessage();
  }

  String? message = 'has sent you a notification';
  Function()? onMessageTap = () {};

  void parseMessage() async {
    switch (widget.notification.type) {
      case NotificationType.viewedProfile:
        message = 'Viewed your profile';
        onMessageTap = () {
          context.push(
            MobileRouter.profileRoute,
            extra: ProfileMViewArgs(
              isCurrentUser: false,
              profile: fromUserModel,
            ),
          );
        };
        break;
      case NotificationType.connectionRequest:
        if (widget.notification.reference?.type ==
            NotificationReferenceType.connectionAccept) {
          message = 'has accepted your connection request';
        } else {
          message = 'has sent you a connection request';
        }
        onMessageTap = () {
          context.push(
            MobileRouter.profileRoute,
            extra: ProfileMViewArgs(
              isCurrentUser: false,
              profile: fromUserModel,
            ),
          );
        };
        break;
      case NotificationType.comment:
        if (widget.notification.reference?.type ==
            NotificationReferenceType.post) {
          message = 'commented on your post';
          onMessageTap = () {
            context.push(
              FeedMRouter.feedDetailedViewRoute,
              extra: FeedDetailedMViewArgs(
                feedId: widget.notification.reference?.id,
              ),
            );
          };
        } else if (widget.notification.reference?.type ==
            NotificationReferenceType.aiArt) {
          message = 'commented on your AI Art';
          onMessageTap = () {
            context.push(
              PlaygroundFeedMRouter.playgroundFeedDetailedViewRoute,
              extra: PlaygroundFeedDetailedMViewArgs(
                playgroundfeedId: widget.notification.reference?.id,
              ),
            );
          };
        }
        if (widget.notification.reference?.type ==
            NotificationReferenceType.collection) {
          message = 'commented on your collection';
        }
        break;
      case NotificationType.replyToComment:
        if (widget.notification.reference?.type ==
            NotificationReferenceType.post) {
          message = 'replied to your comment';
          onMessageTap = () {
            context.push(
              FeedMRouter.feedDetailedViewRoute,
              extra: FeedDetailedMViewArgs(
                feedId: widget.notification.reference?.id,
              ),
            );
          };
        } else if (widget.notification.reference?.type ==
            NotificationReferenceType.aiArt) {
          message = 'replied to your comment';
          onMessageTap = () {
            context.push(
              PlaygroundFeedMRouter.playgroundFeedDetailedViewRoute,
              extra: PlaygroundFeedDetailedMViewArgs(
                playgroundfeedId: widget.notification.reference?.id,
              ),
            );
          };
        }
        break;
      case NotificationType.reaction:
        if (widget.notification.reference?.type ==
            NotificationReferenceType.post) {
          message = 'reacted to your post';
          onMessageTap = () {
            context.push(
              FeedMRouter.feedDetailedViewRoute,
              extra: FeedDetailedMViewArgs(
                feedId: widget.notification.reference?.id,
              ),
            );
          };
        } else if (widget.notification.reference?.type ==
            NotificationReferenceType.aiArt) {
          message = 'reacted to your AI Art';
          onMessageTap = () {
            context.push(
              PlaygroundFeedMRouter.playgroundFeedDetailedViewRoute,
              extra: PlaygroundFeedDetailedMViewArgs(
                playgroundfeedId: widget.notification.reference?.id,
              ),
            );
          };
        }
        if (widget.notification.reference?.type ==
            NotificationReferenceType.collection) {
          message = 'reacted to your collection';
        }
        break;
      case NotificationType.share:
        message = 'shared you something';
        break;
      default:
        message = message;
    }
    fromUserModel = await Provider.of<ProfileNotifier>(context, listen: false)
        .fetchUsersById(widget.notification.from?.id ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: (widget.notification.isRead ?? false)
          ? null
          : ThemeHandler.mutedColor(nonInverse: false),
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          AppUserProfileCircle(
            imageUrl: widget.notification.from?.profilePictureUrl ?? '',
            errorText: 'NA',
            radius: 28.r,
          ),
          sizedBoxWithWidth(12),
          Expanded(
            child: Text.rich(
              TextSpan(
                text: widget.notification.from?.name,
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    context.push(
                      MobileRouter.profileRoute,
                      extra: ProfileMViewArgs(
                        isCurrentUser: false,
                        profile: fromUserModel,
                      ),
                    );
                  },
                children: [
                  TextSpan(
                    text: ' $message',
                    style: AppTextStyles.text14w400,
                    recognizer: TapGestureRecognizer()..onTap = onMessageTap,
                  ),
                ],
              ),
              style: AppTextStyles.text14w500,
              maxLines: 4,
            ),
          ),
          sizedBoxWithWidth(4),
          Text(
            widget.notification.createdAt?.writeDateTime ?? '',
            style: AppTextStyles.text10w400,
          ),
        ],
      ),
    );
  }
}
