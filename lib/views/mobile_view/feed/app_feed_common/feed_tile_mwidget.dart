import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/feed/feed_model.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
import 'package:nova_social/flavors.dart' as flavor;
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/feed_routes/feed_mroutes.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/feed/app_feed_common/widgets/feed_delete_popup_mwidget.dart';
import 'package:nova_social/views/mobile_view/feed/app_feed_common/widgets/feed_report_popup_mwidget.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:share_plus/share_plus.dart';

class FeedTileMWidget extends StatefulWidget {
  final FeedModel feedModel;
  final Function()? onCommentIconTap;
  const FeedTileMWidget({
    super.key,
    required this.feedModel,
    this.onCommentIconTap,
  });

  @override
  State<FeedTileMWidget> createState() => _FeedTileMWidgetState();
}

class _FeedTileMWidgetState extends State<FeedTileMWidget> {
  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;
  int _currentImageIndex = 0;
  late ProfileNotifier profileNotifier;
  late FeedNotifier feedNotifier;
  late UserReaction? myReaction;

  bool _isSnackbarVisible = false;

  Future<String> createDynamicLink() async {
    var parameters = DynamicLinkParameters(
      uriPrefix: flavor.F.appFlavor == flavor.Flavor.PROD
          ? 'https://novasocialclub.page.link'
          : 'https://novasocial.page.link',
      link: Uri.parse(
          'https://novasocial.club/feed?feedId=${widget.feedModel.id}'),
      androidParameters: AndroidParameters(
        packageName: flavor.F.appFlavor == flavor.Flavor.PROD
            ? "club.nova_social.android"
            : "club.nova_social.android.dev",
      ),
      iosParameters: IOSParameters(
        bundleId: flavor.F.appFlavor == flavor.Flavor.PROD
            ? "club.novasocial.ios"
            : "club.novasocial.dev",
        // appStoreId: '1498909115',
      ),
    );
    // var dynamicUrl = await parameters.buildUrl();
    // var shortLink = await parameters.buildShortLink();

    final ShortDynamicLink shortLink =
        await dynamicLinks.buildShortLink(parameters);
    var shortUrl = shortLink.shortUrl;

    return shortUrl.toString();
  }

  @override
  Widget build(BuildContext context) {
    profileNotifier = Provider.of<ProfileNotifier>(context);
    feedNotifier = Provider.of<FeedNotifier>(context);

    final CarouselController carouselController = CarouselController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            if (widget.feedModel.userDetails?.id?.isNotEmpty ?? false) {
              profileNotifier
                  .fetchUsersById((widget.feedModel.userDetails!.id!))
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
            crossAxisAlignment:
                (widget.feedModel.userDetails?.tagline?.isNotEmpty ?? false)
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppUserProfileCircle(
                radius: 24.r,
                imageUrl: widget.feedModel.userDetails?.profilePictureUrl ?? '',
                errorText: 'NA',
              ),
              sizedBoxWithWidth(8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if ((widget.feedModel.userDetails?.tagline?.isNotEmpty ??
                        false)) ...{
                      sizedBoxWithHeight(4),
                    },
                    Row(
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Flexible(
                                child: Text(
                                  widget.feedModel.userDetails?.name ?? '',
                                  style: AppTextStyles.text16w500,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Text(
                                ' • ${widget.feedModel.createdAt != null ? widget.feedModel.createdAt!.writeDateTime : ''}',
                                style: AppTextStyles.text14w300.copyWith(
                                  color: AppColors.novaWhite.withOpacity(0.8),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ),
                        sizedBoxWithWidth(8),
                        GestureDetector(
                          onTap: () {
                            feedNotifier.updateCurrentFeedById(
                              id: widget.feedModel.id ?? '',
                            );
                            if (_isSnackbarVisible) {
                              ScaffoldMessenger.of(context)
                                  .hideCurrentSnackBar();
                              _isSnackbarVisible = false;
                            } else {
                              if ((profileNotifier.userProfile?.username ==
                                  widget.feedModel.userDetails?.username)) {
                                _isSnackbarVisible = true;
                                showDeletePostSnackbar(
                                    context, widget.feedModel);
                              } else {
                                _isSnackbarVisible = true;
                                showReportPostSnackbar(
                                  context: context,
                                );
                              }
                            }
                          },
                          child: Icon(
                            Icons.more_horiz,
                            color: AppColors.novaWhite,
                          ),
                        ),
                      ],
                    ),
                    if ((widget.feedModel.userDetails?.tagline?.isNotEmpty ??
                        false)) ...{
                      sizedBoxWithHeight(4),
                      Text(
                        widget.feedModel.userDetails?.tagline ?? '',
                        style: AppTextStyles.text14w300.copyWith(
                          color: AppColors.novaWhite.withOpacity(0.8),
                        ),
                      ),
                    },
                  ],
                ),
              ),
            ],
          ),
        ),
        if (widget.feedModel.feedText?.isNotEmpty ?? false) ...{
          sizedBoxWithHeight(12),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: ReadMoreText(
              widget.feedModel.feedText ?? '',
              style: AppTextStyles.text14w400,
              trimLines: 4,
              moreStyle: AppTextStyles.text14w400.indigo,
              lessStyle: AppTextStyles.text14w400.indigo,
              trimMode: TrimMode.Line,
            ),
          ),
        },
        if (widget.feedModel.generatedFeedUrl?.isNotEmpty ?? false) ...{
          sizedBoxWithHeight(16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: CarouselSlider.builder(
              carouselController: carouselController,
              itemCount: widget.feedModel.generatedFeedUrl!.length,
              itemBuilder: (context, index, _) {
                return CachedNetworkImage(
                  imageUrl: widget.feedModel.generatedFeedUrl![index],
                  fit: BoxFit.cover,
                  height: 256.h,
                  width: double.maxFinite,
                  errorWidget: (_, __, ___) => Text(
                    'Error occured while loading image',
                    style: AppTextStyles.text14w400.white,
                  ),
                );
              },
              options: CarouselOptions(
                enableInfiniteScroll: false,
                autoPlay: widget.feedModel.generatedFeedUrl?.length == 1
                    ? false
                    : true,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  _currentImageIndex = index;
                  setState(() {});
                },
              ),
            ),
          ),
          sizedBoxWithHeight(8),
          if ((widget.feedModel.generatedFeedUrl?.length ?? 0) > 1) ...{
            SizedBox(
              width: double.maxFinite,
              child: Center(
                child: SizedBox(
                  width: (widget.feedModel.generatedFeedUrl?.length ?? 0) * 16,
                  height: 24.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (int i = 0;
                          i < (widget.feedModel.generatedFeedUrl?.length ?? 0);
                          i++)
                        Padding(
                          padding: EdgeInsets.only(right: 4.w),
                          child: CircleAvatar(
                            radius: _currentImageIndex == i ? 6.r : 4.r,
                            backgroundColor: _currentImageIndex == i
                                ? AppColors.novaDarkIndigo
                                : AppColors.novaWhite.withOpacity(0.8),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          },
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
        widget.feedModel.userDetails?.username);
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

        sizedBoxWithWidth(8),
        _buildShareButton(),
      ],
    );
  }

  Widget _buildLikeButton() {
    bool isReacted = feedNotifier.checkIfPostReacted(
      reactionList: widget.feedModel.reactions,
    );
    int reactionCount = feedNotifier.reactionCount(feedModel: widget.feedModel);
    return Padding(
      padding: EdgeInsets.only(right: 8.w, left: 8.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () async {
              feedNotifier.updateCurrentFeedById(id: widget.feedModel.id ?? '');
              if (isReacted.not) {
                await feedNotifier.togglePostReaction();
                if (feedNotifier.currentFeedModel?.userDetails?.id !=
                    profileNotifier.userProfile?.id) {
                  RepoNotification repoNotification = RepoNotification(
                    createdAt: DateTime.now(),
                    description:
                        '${profileNotifier.userProfile?.name ?? 'Someone'} liked your post.',
                    from:
                        UserMinimum.getUserMinimum(profileNotifier.userProfile),
                    to: feedNotifier.currentFeedModel?.userDetails,
                    title: 'Your post is making a buzz on Novaverse!',
                    type: NotificationType.reaction,
                    reference: RepoNotificationReference(
                      id: feedNotifier.currentFeedModel?.id,
                      type: NotificationReferenceType.post,
                    ),
                  );
                  await profileNotifier.createNotification(repoNotification);
                }
              } else {
                await feedNotifier.togglePostReaction();
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
    int commentCount = feedNotifier.commentCount(feedModel: widget.feedModel);
    return GestureDetector(
      onTap: () {
        feedNotifier.updateCurrentFeedById(id: widget.feedModel.id ?? '');
        // context.push(FeedMRouter.feedCommentViewRoute);
        if (widget.onCommentIconTap != null) {
          widget.onCommentIconTap!();
        } else {
          //We're sending an empty class of argument here because we're using the values
          //directly from the notifier in feed detailed view. Argument class was made
          //because of the dynamic links
          context.push(
            FeedMRouter.feedDetailedViewRoute,
            extra: const FeedDetailedMViewArgs(),
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
      onTap: () async {
        feedNotifier.updateCurrentFeedById(id: widget.feedModel.id ?? '');
        String feedUrl = await createDynamicLink();
        Share.share(
          'Check out this post on \'Nova : Career Network for Teenagers\' by ${widget.feedModel.userDetails?.name ?? ''}\n\n$feedUrl',
          subject: 'Share this post among your friends!',
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
