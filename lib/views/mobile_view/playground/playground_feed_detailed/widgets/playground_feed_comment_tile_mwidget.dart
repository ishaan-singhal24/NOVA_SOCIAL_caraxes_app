import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/playground/playground_feed/comment/playground_feed_comment_model.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';

import 'playground_feed_reply_tile_mwidget.dart';

class PlaygroundFeedCommentTileMWidget extends StatelessWidget {
  final PlaygroundFeedCommentModel playgroundFeedCommentModel;
  final Function()? onReplyTap;
  const PlaygroundFeedCommentTileMWidget({
    super.key,
    required this.playgroundFeedCommentModel,
    this.onReplyTap,
  });

  @override
  Widget build(BuildContext context) {
    final ProfileNotifier profileNotifier =
        Provider.of<ProfileNotifier>(context);
    final PlaygroundNotifier playgroundfeedNotifier =
        Provider.of<PlaygroundNotifier>(context);
    final UserReaction? myReaction =
        playgroundFeedCommentModel.reactions?.cast<UserReaction?>().firstWhere(
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
              playgroundFeedCommentModel.userDetails?.profilePictureUrl ?? '',
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
                    playgroundFeedCommentModel.userDetails?.name ?? '',
                    style: AppTextStyles.text14w600,
                  ),
                  Text(
                    playgroundFeedCommentModel.createdAt != null
                        ? playgroundFeedCommentModel.createdAt!.writeDateTime
                        : '',
                    style: AppTextStyles.text14w300.copyWith(
                      color: AppColors.novaWhite.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              sizedBoxWithHeight(4),
              Text(
                playgroundFeedCommentModel.commentText ?? '',
                style: AppTextStyles.text14w400,
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
              ),
              sizedBoxWithHeight(8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () async {
                      if (myReaction == null) {
                        // appLoadingMPopup(context);
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

                        var tempItem = playgroundFeedCommentModel;
                        var reactions =
                            playgroundFeedCommentModel.reactions?.toList() ??
                                [];
                        reactions.add(reaction);
                        tempItem = tempItem.copyWith(reactions: reactions);
                        await playgroundfeedNotifier.addCommentToFeed(tempItem);
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
                  if (playgroundFeedCommentModel.reactions?.isNotEmpty ??
                      false) ...{
                    Text(
                      (playgroundFeedCommentModel.reactions?.length ?? '0')
                          .toString(),
                      style: AppTextStyles.text14w400,
                    ),
                  },
                  sizedBoxWithWidth(8),
                  GestureDetector(
                    onTap: () {
                      if (onReplyTap != null) {
                        onReplyTap!();
                      }
                    },
                    child: Text(
                      'Reply',
                      style: AppTextStyles.text12w400,
                    ),
                  ),
                ],
              ),
              //..
              if (playgroundFeedCommentModel.replies?.isNotEmpty ?? false) ...{
                sizedBoxWithHeight(16),
                ...playgroundFeedCommentModel.replies!.map((e) {
                  return Column(
                    children: [
                      PlaygroundFeedReplyTileMWidget(
                        playgroundFeedCommentReplyModel: e,
                        playgroundFeedCommentModel: playgroundFeedCommentModel,
                      ),
                      sizedBoxWithHeight(16),
                    ],
                  );
                }).toList(),
              },
              // if (playgroundFeedCommentModel.replies?.isNotEmpty ?? false) ...{
              //   sizedBoxWithHeight(16),
              //   SizedBox(
              //     height: (playgroundFeedCommentModel.replies?.length ?? 0) * 100,
              //     child: ListView.builder(
              //       itemCount: playgroundFeedCommentModel.replies?.length ?? 0,
              //       itemBuilder: (context, index) {
              //         if ((playgroundFeedCommentModel.replies?.isNotEmpty ?? false) &&
              //             (playgroundFeedCommentModel.replies?[index] != null)) {
              //           return Column(
              //             children: [
              //               PlaygroundFeedReplyTileMWidget(
              //                 feedCommentReplyModel:
              //                     playgroundFeedCommentModel.replies![index],
              //                 playgroundFeedCommentModel: playgroundFeedCommentModel,
              //               ),
              //               sizedBoxWithHeight(16),
              //             ],
              //           );
              //         }
              //         return Container();
              //       },
              //     ),
              //   ),
              // },
            ],
          ),
        ),
      ],
    );
  }
}
