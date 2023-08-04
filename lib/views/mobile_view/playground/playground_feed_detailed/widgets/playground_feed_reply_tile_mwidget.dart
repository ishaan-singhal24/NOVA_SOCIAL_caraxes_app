import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/playground/playground_feed/comment/comment_reply/playground_feed_comment_reply_model.dart';
import 'package:nova_social/data/models/playground/playground_feed/comment/playground_feed_comment_model.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class PlaygroundFeedReplyTileMWidget extends StatelessWidget {
  final PlaygroundFeedCommentReplyModel playgroundFeedCommentReplyModel;
  final PlaygroundFeedCommentModel playgroundFeedCommentModel;
  const PlaygroundFeedReplyTileMWidget({
    super.key,
    required this.playgroundFeedCommentReplyModel,
    required this.playgroundFeedCommentModel,
  });

  @override
  Widget build(BuildContext context) {
    final ProfileNotifier profileNotifier =
        Provider.of<ProfileNotifier>(context);
    final PlaygroundNotifier feedNotifier =
        Provider.of<PlaygroundNotifier>(context);
    final UserReaction? myReaction = playgroundFeedCommentReplyModel.reactions
        ?.cast<UserReaction?>()
        .firstWhere(
          (element) => element?.id == profileNotifier.userProfile?.id,
          orElse: () => null,
        );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppUserProfileCircle(
          radius: 20.r,
          imageUrl:
              playgroundFeedCommentReplyModel.userDetails?.profilePictureUrl ??
                  '',
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
                    playgroundFeedCommentReplyModel.userDetails?.name ?? '',
                    style: AppTextStyles.text14w600,
                  ),
                  Text(
                    playgroundFeedCommentReplyModel.createdAt != null
                        ? playgroundFeedCommentReplyModel
                            .createdAt!.writeDateTime
                        : '',
                    style: AppTextStyles.text14w300.copyWith(
                      color: AppColors.novaWhite.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              sizedBoxWithHeight(4),
              ReadMoreText(
                playgroundFeedCommentReplyModel.commentReplyText ?? '',
                style: AppTextStyles.text14w400,
                trimLines: 2,
                moreStyle: AppTextStyles.text14w400.indigo,
                lessStyle: AppTextStyles.text14w400.indigo,
                trimMode: TrimMode.Line,
              ),
              // Text(
              //   playgroundFeedCommentReplyModel.commentReplyText ?? '',
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

                        var tempItem = playgroundFeedCommentReplyModel;
                        var reactions = playgroundFeedCommentReplyModel
                                .reactions
                                ?.toList() ??
                            [];
                        reactions.add(reaction);
                        tempItem = tempItem.copyWith(reactions: reactions);
                        await feedNotifier.addCommentReplyToFeed(
                          playgroundFeedCommentReplyModel: tempItem,
                          currentPlaygroundFeedCommentModel:
                              playgroundFeedCommentModel,
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
                  if (playgroundFeedCommentReplyModel.reactions?.isNotEmpty ??
                      false) ...{
                    Text(
                      (playgroundFeedCommentReplyModel.reactions?.length ?? '0')
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
