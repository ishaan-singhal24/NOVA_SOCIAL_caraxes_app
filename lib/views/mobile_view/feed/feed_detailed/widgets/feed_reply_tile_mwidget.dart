import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/feed/comment/comment_reply/feed_comment_reply_model.dart';
import 'package:nova_social/data/models/feed/comment/feed_comment_model.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class FeedReplyTileMWidget extends StatelessWidget {
  final FeedCommentReplyModel feedCommentReplyModel;
  final FeedCommentModel feedCommentModel;
  const FeedReplyTileMWidget({
    super.key,
    required this.feedCommentReplyModel,
    required this.feedCommentModel,
  });

  @override
  Widget build(BuildContext context) {
    final ProfileNotifier profileNotifier =
        Provider.of<ProfileNotifier>(context);
    final FeedNotifier feedNotifier = Provider.of<FeedNotifier>(context);
    final UserReaction? myReaction =
        feedCommentReplyModel.reactions?.cast<UserReaction?>().firstWhere(
              (element) => element?.id == profileNotifier.userProfile?.id,
              orElse: () => null,
            );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppUserProfileCircle(
          radius: 20.r,
          imageUrl: feedCommentReplyModel.userDetails?.profilePictureUrl ?? '',
          errorText: 'NA',
        ),
        sizedBoxWithWidth(8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxWithHeight(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    feedCommentReplyModel.userDetails?.name ?? '',
                    style: AppTextStyles.text14w600,
                  ),
                  Text(
                    feedCommentReplyModel.createdAt != null
                        ? feedCommentReplyModel.createdAt!.writeDateTime
                        : '',
                    style: AppTextStyles.text14w300.copyWith(
                      color: AppColors.novaWhite.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              sizedBoxWithHeight(4),
              ReadMoreText(
                feedCommentReplyModel.commentReplyText ?? '',
                style: AppTextStyles.text14w400,
                trimLines: 2,
                moreStyle: AppTextStyles.text14w400.indigo,
                lessStyle: AppTextStyles.text14w400.indigo,
                trimMode: TrimMode.Line,
              ),
              // Text(
              //   feedCommentReplyModel.commentReplyText ?? '',
              //   style: AppTextStyles.text14w400,
              //   overflow: TextOverflow.ellipsis,
              //   maxLines: 5,
              // ),
              sizedBoxWithHeight(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (myReaction == null) {
                        if (profileNotifier.userProfile == null) {
                          return;
                        }
                        var userModel = profileNotifier.userProfile;
                        final UserReaction reaction = UserReaction(
                          id: userModel?.id,
                          name: userModel?.name,
                          username: userModel?.username,
                          profilePictureUrl: userModel?.profilePictureUrl,
                          reaction: ReactionEnum.love,
                        );

                        var tempItem = feedCommentReplyModel;
                        var reactions =
                            feedCommentReplyModel.reactions?.toList() ?? [];
                        reactions.add(reaction);
                        tempItem = tempItem.copyWith(reactions: reactions);
                        await feedNotifier.addCommentReplyToFeed(
                          feedCommentReplyModel: tempItem,
                          currentCommentModel: feedCommentModel,
                        );
                      }
                    },
                    child: Icon(
                      (myReaction == null
                          ? Icons.favorite_border
                          : Icons.favorite),
                      color: AppColors.novaWhite.withOpacity(0.8),
                      size: 16.r,
                    ),
                  ),
                  sizedBoxWithWidth(4),
                  if (feedCommentReplyModel.reactions?.isNotEmpty ?? false) ...{
                    Text(
                      (feedCommentReplyModel.reactions?.length ?? '0')
                          .toString(),
                      style: AppTextStyles.text14w400,
                    ),
                  },
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
