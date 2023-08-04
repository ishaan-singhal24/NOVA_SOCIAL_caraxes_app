import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/utils/formatter/time_duration_calculator.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/add_edit_profile.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:nova_social/views/web_view/common/common.dart';
// import 'dart:html';
import 'package:universal_html/html.dart' as html;
import 'package:uuid/uuid.dart';

class UserCollectionItemTile extends StatefulWidget {
  final UserCollectionItem item;
  final int collectionIndex;
  final int editingIndex;
  const UserCollectionItemTile({
    Key? key,
    required this.item,
    required this.collectionIndex,
    required this.editingIndex,
  }) : super(key: key);

  @override
  State<UserCollectionItemTile> createState() => _UserCollectionItemTileState();
}

class _UserCollectionItemTileState extends State<UserCollectionItemTile> {
  @override
  Widget build(BuildContext context) {
    final profileNoti = context.watch<ProfileNotifier>();
    final isCurrentUser = profileNoti.isCurrentUser ?? false;
    final UserReaction? myReaction =
        widget.item.reactions?.cast<UserReaction?>().firstWhere(
              (element) => element?.id == profileNoti.userProfile?.id,
              orElse: () => null,
            );
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: ThemeHandler.widgetColor().withOpacity(0.1),
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (widget.item.thumbnailUrl?.isNotEmpty ?? false) ...{
            CachedNetworkImage(
              imageUrl: widget.item.thumbnailUrl ?? '',
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
          sizedBoxWithHeight(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.item.name?.isNotEmpty ?? false) ...{
                      sizedBoxWithHeight(6),
                      Text(
                        widget.item.name!,
                        style: AppTextStyles.text16w600,
                        overflow: TextOverflow.ellipsis,
                      ),
                    },
                    if (widget.item.tagline?.isNotEmpty ?? false) ...{
                      sizedBoxWithHeight(6),
                      Text(
                        widget.item.tagline!,
                        style: AppTextStyles.text14w300,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    },
                    if (widget.item.startDate != null) ...{
                      sizedBoxWithHeight(6),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            widget.item.startDate?.abrMMMyyyy ?? 'NA',
                            style: AppTextStyles.text14w300,
                          ),
                          sizedBoxWithWidth(4),
                          Text(
                            '-',
                            style: AppTextStyles.text14w300,
                          ),
                          sizedBoxWithWidth(4),
                          Text(
                            widget.item.endDate?.abrMMMyyyy ?? 'Present',
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
                                widget.item.startDate, widget.item.endDate),
                            style: AppTextStyles.text14w300,
                          ),
                        ],
                      ),
                    },
                  ],
                ),
              ),
              // const Spacer(),
              sizedBoxWithWidth(16),
              if (isCurrentUser.not &&
                  myReaction == null &&
                  profileNoti.userProfile != null) ...{
                InkWell(
                  onTap: () async {
                    appLoadingPopup(context);
                    var userModel = profileNoti.profileAsPerRoute();
                    final UserReaction reaction = UserReaction(
                      id: profileNoti.userProfile?.id,
                      name: profileNoti.userProfile?.name,
                      username: profileNoti.userProfile?.username,
                      profilePictureUrl:
                          profileNoti.userProfile?.profilePictureUrl,
                      reaction: ReactionEnum.upvote,
                    );
                    var collections = userModel?.collections?.toList() ?? [];
                    var collection = collections[widget.collectionIndex];
                    var items = collection.item?.toList() ?? [];
                    var tempItem = widget.item;
                    var reactions = widget.item.reactions?.toList() ?? [];
                    reactions.add(reaction);
                    tempItem = tempItem.copyWith(reactions: reactions);
                    items[widget.editingIndex] = tempItem;
                    collection = collection.copyWith(item: items);
                    collections[widget.collectionIndex] = collection;
                    userModel = userModel?.copyWith(collections: collections);
                    await profileNoti
                        .saveToOtherProfile(userModel!)
                        .then((value) {
                      Navigator.pop(context);
                    });
                  },
                  child: CachedNetworkImage(
                    imageUrl: AppAssets.nAddReaction,
                    errorWidget: (context, url, error) => Icon(
                      Iconsax.like_1,
                      color: AppColors.novaIndigo,
                    ),
                  ),
                ),
                sizedBoxWithWidth(16),
              } else if (widget.item.reactions?.isNotEmpty ?? false) ...{
                Row(
                  children: [
                    Icon(
                      Iconsax.like_1,
                      color: ThemeHandler.widgetColor(),
                      size: 18.r,
                    ),
                    sizedBoxWithWidth(4),
                    Text(
                      (widget.item.reactions?.length ?? '23').toString(),
                      style: AppTextStyles.text12w400,
                    ),
                  ],
                ),
                sizedBoxWithWidth(16),
              },
              if (isCurrentUser) ...{
                AppIconButton(
                  icon: Icons.edit,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => ProfileAddEditCollectionItem(
                        collectionIndex: widget.collectionIndex,
                        editingIndex: widget.editingIndex,
                        isAdd: false,
                      ),
                    );
                  },
                ),
              },
            ],
          ),
          if (widget.item.description?.isNotEmpty ?? false) ...{
            sizedBoxWithHeight(12),
            ReadMoreText(
              widget.item.description ?? '',
              trimLines: 2,
              colorClickableText: AppColors.novaIndigo,
              trimMode: TrimMode.Line,
              trimCollapsedText: ' Show more',
              trimExpandedText: ' Show less',
              style: AppTextStyles.text14w400.darkModeSupport.copyWith(
                height: 1.4,
              ),
              moreStyle: AppTextStyles.text14w400.indigo,
            ),
          },
          sizedBoxWithHeight(12),
          AppChip(
            text: 'Reference Link',
            leading: SizedBox(
              height: 18.r,
              child: Icon(
                Iconsax.link,
                color: AppColors.novaIndigo,
                size: 16.r,
              ),
            ),
            prefixColor: AppColors.novaIndigo,
            type: AppChipType.outlined,
            color: AppColors.novaDarkIndigo,
            onTap: () {
              html.window.open(widget.item.fileUrl ?? '', '_blank');
            },
          ),
        ],
      ),
    );
  }
}
