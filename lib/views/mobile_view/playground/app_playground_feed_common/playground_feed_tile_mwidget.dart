import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/feed_routes/feed_mroutes.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/routes/mobile/playground_routes/playground_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/playground/data/playground_suggestions_data.dart';
import 'package:nova_social/views/mobile_view/playground/app_playground_feed_common/widgets/playground_delete_popup_mwidget.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';

class PlaygroundFeedTileMWidget extends StatefulWidget {
  final bool showLoader;
  final PlaygroundFeedModel playgroundFeedModel;
  final String? showLoaderPrompt;
  final Function()? onCommentIconTap;
  const PlaygroundFeedTileMWidget({
    super.key,
    required this.playgroundFeedModel,
    this.showLoader = false,
    this.showLoaderPrompt,
    this.onCommentIconTap,
  });

  @override
  State<PlaygroundFeedTileMWidget> createState() =>
      _PlaygroundFeedTileMWidgetState();
}

class _PlaygroundFeedTileMWidgetState extends State<PlaygroundFeedTileMWidget> {
  bool _isSnackbarVisible = false;

  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  late ProfileNotifier profileNotifier;
  late PlaygroundNotifier playgroundFeedNotifier;
  late UserReaction? myReaction;

  Widget _buildLoadingWidget() {
    var playgroundSuggestionModelList =
        PlaygroundSuggestionsData.playgroundSuggestionsList;
    playgroundSuggestionModelList.shuffle();
    return Stack(
      children: [
        Image.asset(
          AppAssets.feedLoader,
          fit: BoxFit.contain,
        ),
        Positioned.fill(
          bottom: 24.h,
          child: Container(
            width: ScreenUtil.instance.screenWidth * 0.75,
            padding: EdgeInsets.symmetric(
              horizontal: 4.w,
              vertical: 16.h,
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LinearProgressBarMWidget(),
                  sizedBoxWithHeight(16),
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: CachedNetworkImage(
                        imageUrl:
                            playgroundSuggestionModelList.first.imageUrl ?? '',
                        fit: BoxFit.contain,
                        errorWidget: (_, __, ___) => Text(
                          'Error occured while loading image',
                          style: AppTextStyles.text14w400.white,
                        ),
                      ),
                    ),
                  ),
                  sizedBoxWithHeight(8),
                  Text(
                    'Tip: ${playgroundSuggestionModelList.first.tip}',
                    style: AppTextStyles.text12w700,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  sizedBoxWithHeight(4),
                  Text(
                    'Try: ${playgroundSuggestionModelList.first.prompt}',
                    style: AppTextStyles.text12w400,
                    maxLines: 4,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    profileNotifier = Provider.of<ProfileNotifier>(context);
    playgroundFeedNotifier = Provider.of<PlaygroundNotifier>(context);
    final UserReaction? myReaction =
        widget.playgroundFeedModel.reactions?.cast<UserReaction?>().firstWhere(
              (element) => element?.id == profileNotifier.userProfile?.id,
              orElse: () => null,
            );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            if (widget.playgroundFeedModel.userDetails?.id?.isNotEmpty ??
                false) {
              profileNotifier
                  .fetchUsersById((widget.playgroundFeedModel.userDetails!.id!))
                  .then((profile) {
                context.push(
                  MobileRouter.profileRoute,
                  extra: ProfileMViewArgs(
                    isCurrentUser:
                        profileNotifier.userProfile?.id == profile?.id,
                    profile: profile,
                  ),
                );
              });
            }
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppUserProfileCircle(
                radius: 24.r,
                imageUrl:
                    widget.playgroundFeedModel.userDetails?.profilePictureUrl ??
                        '',
                errorText: 'NA',
              ),
              sizedBoxWithWidth(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if ((widget.playgroundFeedModel.userDetails?.tagline
                            ?.isNotEmpty ??
                        false)) ...{
                      sizedBoxWithHeight(4),
                    },
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Text(
                                widget.playgroundFeedModel.userDetails?.name ??
                                    '',
                                style: AppTextStyles.text16w500,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              Text(
                                ' • ${widget.playgroundFeedModel.createdAt != null ? widget.playgroundFeedModel.createdAt!.writeDateTime : ''}',
                                style: AppTextStyles.text14w300.copyWith(
                                  color: AppColors.novaWhite.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                        sizedBoxWithWidth(8),
                        if ((profileNotifier.userProfile?.username ==
                            widget.playgroundFeedModel.userDetails
                                ?.username)) ...{
                          GestureDetector(
                            onTap: () {
                              if (_isSnackbarVisible) {
                                ScaffoldMessenger.of(context)
                                    .hideCurrentSnackBar();
                                _isSnackbarVisible = false;
                              } else {
                                _isSnackbarVisible = true;
                                showDeletePlaygroundFeedSnackbar(
                                  context,
                                  widget.playgroundFeedModel,
                                );
                                // ScaffoldMessenger.of(context)
                                //     .hideCurrentSnackBar();
                                // _isSnackbarVisible = false;
                              }
                            },
                            child: Icon(
                              Icons.more_horiz,
                              color: AppColors.novaWhite,
                            ),
                          ),
                        },
                      ],
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Expanded(
                    //       child: Text(
                    //         playgroundFeedModel.name ?? '',
                    //         style: AppTextStyles.text16w500,
                    //         maxLines: 2,
                    //         overflow: TextOverflow.ellipsis,
                    //       ),
                    //     ),
                    //     sizedBoxWithWidth(8),
                    //     Text(
                    //       playgroundFeedModel.createdAt != null
                    //           ? playgroundFeedModel.createdAt!.writeDateTime
                    //           : '',
                    //       style: AppTextStyles.text12w300.copyWith(
                    //         color: AppColors.novaWhite.withOpacity(0.8),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    if ((widget.playgroundFeedModel.userDetails?.tagline
                            ?.isNotEmpty ??
                        false)) ...{
                      sizedBoxWithHeight(4),
                      Text(
                        widget.playgroundFeedModel.userDetails?.tagline ?? '',
                        style: AppTextStyles.text14w300.copyWith(
                          color: AppColors.novaWhite.withOpacity(0.8),
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    },
                  ],
                ),
              ),
            ],
          ),
        ),
        if (widget.playgroundFeedModel.prompt?.isNotEmpty ?? false) ...{
          sizedBoxWithHeight(16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: ReadMoreText(
              widget.playgroundFeedModel.prompt ?? '',
              style: AppTextStyles.text16w600.italic,
              trimLines: 5,
              moreStyle: AppTextStyles.text16w400.indigo,
              lessStyle: AppTextStyles.text16w400.indigo,
              trimMode: TrimMode.Line,
            ),
          ),
        },
        sizedBoxWithHeight(16),
        if (widget.showLoader) ...{
          _buildLoadingWidget(),
        } else ...{
          CachedNetworkImage(
            imageUrl: widget.playgroundFeedModel.generatedFeedUrl ?? '',
            fit: BoxFit.contain,
            // height: 256.h,
            // width: double.maxFinite,
            errorWidget: (_, __, ___) => Text(
              'Error occured while loading image',
              style: AppTextStyles.text14w400.white,
            ),
          ),
        },
        sizedBoxWithHeight(16),
        _buildBottomRowTile(),
        sizedBoxWithHeight(16),
        const AppDividerMwidget(
          thickness: 0.2,
        ),
      ],
    );
  }

  Widget _buildBottomRowTile() {
    final bool likeButtonTappable = (profileNotifier.userProfile?.username !=
        widget.playgroundFeedModel.userDetails?.username);
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // if (likeButtonTappable) ...{
        //   _buildLikeButton(tappable: likeButtonTappable),
        // } else if (likeButtonTappable.not &&
        //     (widget.feedModel.reactions?.isNotEmpty ?? false)) ...{
        //   _buildLikeButton(tappable: likeButtonTappable),
        // },

        _buildLikeButton(),
        sizedBoxWithWidth(8),
        _buildCommentButton(),

        if ((profileNotifier.userProfile?.username ==
            widget.playgroundFeedModel.userDetails?.username)) ...{
          sizedBoxWithWidth(8),
          _buildShareButton(),
        },
      ],
    );
  }

  Widget _buildLikeButton() {
    bool isReacted = playgroundFeedNotifier.checkIfPostReacted(
      reactionList: widget.playgroundFeedModel.reactions,
    );
    int reactionCount = playgroundFeedNotifier.reactionCount(
        playgroundfeedModel: widget.playgroundFeedModel);
    return Padding(
      padding: EdgeInsets.only(right: 8.w, left: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              playgroundFeedNotifier.updateCurrentFeedById(
                  id: widget.playgroundFeedModel.id ?? '');
              if (isReacted.not) {
                await playgroundFeedNotifier.togglePostReaction();
                if (playgroundFeedNotifier
                        .currentPlaygroundFeedModel?.userDetails?.id !=
                    profileNotifier.userProfile?.id) {
                  RepoNotification repoNotification = RepoNotification(
                    createdAt: DateTime.now(),
                    description:
                        '${profileNotifier.userProfile?.name ?? 'Someone'} liked your AI Art.',
                    from:
                        UserMinimum.getUserMinimum(profileNotifier.userProfile),
                    to: playgroundFeedNotifier
                        .currentPlaygroundFeedModel?.userDetails,
                    title: 'Your AI Art is making a buzz on Novaverse!',
                    type: NotificationType.reaction,
                    reference: RepoNotificationReference(
                      id: playgroundFeedNotifier.currentPlaygroundFeedModel?.id,
                      type: NotificationReferenceType.aiArt,
                    ),
                  );
                  await profileNotifier.createNotification(repoNotification);
                }
              } else {
                await playgroundFeedNotifier.togglePostReaction();
              }
            },
            child: isReacted.not
                ? SvgPicture.asset(
                    AppAssets.likeIcon,
                    height: 20.h,
                    color: AppColors.novaWhite.withOpacity(0.8),
                  )
                : Icon(
                    Icons.favorite,
                    color: AppColors.novaWhite.withOpacity(0.8),
                    size: 24.r,
                  ),
          ),
          sizedBoxWithWidth(4),
          Text(
            (reactionCount).toString(),
            style: AppTextStyles.text14w500,
          ),
        ],
      ),
    );
  }

  Widget _buildCommentButton() {
    int commentCount = playgroundFeedNotifier.commentCount(
        playgroundfeedModel: widget.playgroundFeedModel);
    return GestureDetector(
      onTap: () {
        playgroundFeedNotifier.updateCurrentFeedById(
            id: widget.playgroundFeedModel.id ?? '');
        // context.push(FeedMRouter.feedCommentViewRoute);
        if (widget.onCommentIconTap != null) {
          widget.onCommentIconTap!();
        } else {
          //We're sending an empty class of argument here because we're using the values
          //directly from the notifier in playground feed detailed view. Argument class was made
          //because of the dynamic links
          context.push(
            PlaygroundFeedMRouter.playgroundFeedDetailedViewRoute,
            extra: const PlaygroundFeedDetailedMViewArgs(),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.only(right: 8.w),
        child: Row(
          children: [
            SvgPicture.asset(
              AppAssets.commentBubbleIcon,
              height: 20.h,
              color: AppColors.novaWhite.withOpacity(0.8),
            ),
            // Iconify(
            //   AppAssets.commentBubbleIcon,
            //   color: AppColors.novaWhite.withOpacity(0.8),
            //   size: 24.r,
            // ),
            sizedBoxWithWidth(4),
            Text(
              (commentCount).toString(),
              style: AppTextStyles.text14w500,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShareButton() {
    return GestureDetector(
      onTap: () {
        playgroundFeedNotifier.updateCurrentFeedById(
            id: widget.playgroundFeedModel.id ?? '');

        context.push(
          FeedMRouter.createFeedViewRoute,
          extra: CreateFeedMViewArgs(
            promptText: widget.playgroundFeedModel.prompt,
            generatedFeedUrl: widget.playgroundFeedModel.generatedFeedUrl,
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.only(right: 8.w),
        child: SvgPicture.asset(
          AppAssets.shareIcon,
          height: 20.h,
          color: AppColors.novaWhite.withOpacity(0.8),
        ),
      ),
    );
  }
}
