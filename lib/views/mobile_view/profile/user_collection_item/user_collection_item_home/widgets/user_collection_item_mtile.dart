import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/routes/mobile/add_edit_routes.dart/add_edit_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/formatter/time_duration_calculator.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:readmore/readmore.dart';
import 'package:url_launcher/url_launcher.dart';

class UserCollectionItemMTile extends StatelessWidget {
  final String collectionName;
  final UserCollectionItem collectionItem;
  final int collectionIndex;
  final int editingIndex;
  final ProfileMViewArgs profileArgs;
  final VoidCallback? onLongPress;
  const UserCollectionItemMTile({
    super.key,
    required this.collectionName,
    required this.collectionItem,
    required this.collectionIndex,
    required this.editingIndex,
    required this.profileArgs,
    this.onLongPress,
  });

  Future<void> _launchUrl(String link) async {
    final Uri url = Uri.parse(link);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $link');
    }
  }

  @override
  Widget build(BuildContext context) {
    final UserReaction? myReaction =
        collectionItem.reactions?.cast<UserReaction?>().firstWhere(
              (element) => element?.id == profileArgs.profile?.id,
              orElse: () => null,
            );
    return InkWell(
      onLongPress: onLongPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (collectionItem.thumbnailUrl?.isNotEmpty ?? false) ...{
            sizedBoxWithHeight(18),
            CachedNetworkImage(
              imageUrl: collectionItem.thumbnailUrl ?? '',
              imageBuilder: (context, imageProvider) => Container(
                width: double.maxFinite,
                height: 200.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              errorWidget: (context, url, error) => const SizedBox(),
            ),
          },
          sizedBoxWithHeight(24),
          Row(
            children: [
              Expanded(
                child: Text(
                  collectionItem.name ?? '',
                  maxLines: 2,
                  style: AppTextStyles.text16w600,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              sizedBoxWithWidth(8),
              if (profileArgs.isCurrentUser ?? false) ...{
                AppIconButton(
                  icon: Icons.edit_outlined,
                  onTap: () {
                    context.push(
                      AddEditMRouter.addEditCollectionRoute,
                      extra: AddEditCollectionItemMViewArgs(
                        isAdd: false,
                        collectionName: collectionName,
                        collectionIndex: collectionIndex,
                        editIndex: editingIndex,
                        editCollectionItem: collectionItem,
                      ),
                    );
                  },
                ),
              },
              sizedBoxWithWidth(8),
            ],
          ),
          if (collectionItem.tagline?.isNotEmpty ?? false) ...{
            sizedBoxWithHeight(8),
            Text(
              collectionItem.tagline!,
              style: AppTextStyles.text14w300,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          },
          if (collectionItem.startDate != null) ...{
            sizedBoxWithHeight(8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  collectionItem.startDate?.abrMMMyyyy ?? 'NA',
                  style: AppTextStyles.text14w300,
                ),
                sizedBoxWithWidth(4),
                Text(
                  '-',
                  style: AppTextStyles.text14w300,
                ),
                sizedBoxWithWidth(4),
                Text(
                  collectionItem.endDate?.abrMMMyyyy ?? 'Present',
                  style: AppTextStyles.text14w300,
                ),
                sizedBoxWithWidth(8),
                CircleAvatar(
                  backgroundColor: ThemeHandler.widgetColor(),
                  radius: 2.r,
                ),
                sizedBoxWithWidth(8),
                Text(
                  DateTimeFormatter.timeDurationCalculator(
                    collectionItem.startDate,
                    collectionItem.endDate,
                  ),
                  style: AppTextStyles.text14w300,
                ),
              ],
            ),
          },
          if (collectionItem.description?.isNotEmpty ?? false) ...{
            sizedBoxWithHeight(16),
            SizedBox(
              width: ScreenUtil.instance.screenWidth * 0.6,
              child: ReadMoreText(
                collectionItem.description!,
                trimLines: 4,
                colorClickableText: AppColors.novaIndigo,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Show more',
                trimExpandedText: ' Show less',
                style: AppTextStyles.text14w400.darkModeSupport.copyWith(
                  height: 1.4,
                ),
                moreStyle: AppTextStyles.text14w400.indigo,
              ),
            ),
          },
          if (collectionItem.fileUrl?.isNotEmpty ?? false) ...{
            sizedBoxWithHeight(16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    _launchUrl(collectionItem.fileUrl!);
                  },
                  child: Container(
                    height: 40.h,
                    width: 130.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24.r),
                      border: Border.all(
                        color: AppColors.novaDarkIndigo,
                      ),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Related Link',
                            style: AppTextStyles.text14w600,
                          ),
                          sizedBoxWithWidth(8),
                          Icon(
                            Icons.open_in_new,
                            size: 16.r,
                            color: AppColors.novaIndigo,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // if ((profileArgs.isCurrentUser?.not ?? false) &&
                //     myReaction == null &&
                //     profileArgs.profile != null) ...{
                //   Padding(
                //     padding: EdgeInsets.only(right: 16.w),
                //     child: InkWell(
                //       onTap: () async {
                //         appLoadingMPopup(context);
                //         var userModel = profileArgs.profile;
                //         final UserReaction reaction = UserReaction(
                //           id: userModel?.id,
                //           name: userModel?.name,
                //           username: userModel?.username,
                //           profilePictureUrl: userModel?.profilePictureUrl,
                //           reaction: ReactionEnum.love,
                //         );
                //         var collections = userModel?.collections?.toList() ?? [];
                //         var collection = collections[collectionIndex];
                //         var items = collection.item?.toList() ?? [];
                //         var tempItem = collectionItem;
                //         var reactions = collectionItem.reactions?.toList() ?? [];
                //         reactions.add(reaction);
                //         tempItem = tempItem.copyWith(reactions: reactions);
                //         items[editingIndex] = tempItem;
                //         collection = collection.copyWith(item: items);
                //         collections[collectionIndex] = collection;
                //         userModel = userModel?.copyWith(collections: collections);
                //         final profileNoti =
                //             Provider.of<ProfileNotifier>(context, listen: false);
                //         await profileNoti
                //             .saveToOtherProfile(userModel!)
                //             .then((value) {
                //           Navigator.pop(context);
                //         });

                //         //Create Notification
                //         // RepoNotification noti = RepoNotification(
                //         //   from:
                //         //       UserMinimum.getUserMinimum(profileNoti.userProfile),
                //         //   to: UserMinimum.getUserMinimum(userModel),
                //         //   title: 'Someone reacted to your $collectionName collection',
                //         //   description: 'Check ',
                //         //   isRead: false,
                //         //   type: NotificationType.reaction,
                //         //   reference: RepoNotificationReference(id: '3434', type: NotificationReferenceType.),
                //         //   createdAt: DateTime.now(),
                //         // );
                //         // await Provider.of<NotificationNotifier>(
                //         //         context,
                //         //         listen: false)
                //         //     .createNotification(noti);
                //       },
                //       child: CachedNetworkImage(
                //         imageUrl: AppAssets.nAddReaction,
                //         errorWidget: (context, url, error) => Icon(
                //           Icons.favorite,
                //           color: AppColors.novaIndigo,
                //         ),
                //       ),
                //     ),
                //   ),
                // } else if (collectionItem.reactions?.isNotEmpty ?? false) ...{
                //   Row(
                //     children: [
                //       Icon(
                //         Icons.favorite,
                //         color: AppColors.novaPink,
                //         size: 18.r,
                //       ),
                //       sizedBoxWithWidth(4),
                //       Text(
                //         (collectionItem.reactions?.length ?? '0').toString(),
                //         style: AppTextStyles.text12w400,
                //       ),
                //       sizedBoxWithWidth(16),
                //     ],
                //   ),
                // },
              ],
            ),
          },
          sizedBoxWithHeight(18),
        ],
      ),
    );
  }
}
