import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/feed/comment/feed_comment_model.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/feed/feed_detailed/widgets/feed_reply_tile_mwidget.dart';
import 'package:provider/provider.dart';

class FeedCommentTileMWidget extends StatelessWidget {
  final FeedCommentModel feedCommentModel;
  final Function()? onReplyTap;
  const FeedCommentTileMWidget({
    super.key,
    required this.feedCommentModel,
    this.onReplyTap,
  });

  @override
  Widget build(BuildContext context) {
    final ProfileNotifier profileNotifier =
        Provider.of<ProfileNotifier>(context);
    final FeedNotifier feedNotifier = Provider.of<FeedNotifier>(context);
    final UserReaction? myReaction =
        feedCommentModel.reactions?.cast<UserReaction?>().firstWhere(
              (element) => element?.id == profileNotifier.userProfile?.id,
              orElse: () => null,
            );

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppUserProfileCircle(
          radius: 20.r,
          imageUrl: feedCommentModel.userDetails?.profilePictureUrl ?? '',
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
                    feedCommentModel.userDetails?.name ?? '',
                    style: AppTextStyles.text14w600,
                  ),
                  Text(
                    feedCommentModel.createdAt != null
                        ? feedCommentModel.createdAt!.writeDateTime
                        : '',
                    style: AppTextStyles.text14w300.copyWith(
                      color: AppColors.novaWhite.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              sizedBoxWithHeight(4),
              Text(
                feedCommentModel.commentText ?? '',
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

                        var tempItem = feedCommentModel;
                        var reactions =
                            feedCommentModel.reactions?.toList() ?? [];
                        reactions.add(reaction);
                        tempItem = tempItem.copyWith(reactions: reactions);
                        await feedNotifier.addCommentToFeed(tempItem);
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
                  if (feedCommentModel.reactions?.isNotEmpty ?? false) ...{
                    Text(
                      (feedCommentModel.reactions?.length ?? '0').toString(),
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
              if (feedCommentModel.replies?.isNotEmpty ?? false) ...{
                sizedBoxWithHeight(16),
                ...feedCommentModel.replies!.map((e) {
                  return Column(
                    children: [
                      FeedReplyTileMWidget(
                        feedCommentReplyModel: e,
                        feedCommentModel: feedCommentModel,
                      ),
                      sizedBoxWithHeight(16),
                    ],
                  );
                }).toList(),
              },
              // if (feedCommentModel.replies?.isNotEmpty ?? false) ...{
              //   sizedBoxWithHeight(16),
              //   SizedBox(
              //     height: (feedCommentModel.replies?.length ?? 0) * 100,
              //     child: ListView.builder(
              //       itemCount: feedCommentModel.replies?.length ?? 0,
              //       itemBuilder: (context, index) {
              //         if ((feedCommentModel.replies?.isNotEmpty ?? false) &&
              //             (feedCommentModel.replies?[index] != null)) {
              //           return Column(
              //             children: [
              //               FeedReplyTileMWidget(
              //                 feedCommentReplyModel:
              //                     feedCommentModel.replies![index],
              //                 feedCommentModel: feedCommentModel,
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
