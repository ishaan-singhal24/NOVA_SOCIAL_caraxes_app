import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nova_social/data/constants/app_assets.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/add_edit_routes.dart/add_edit_mroutes.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/profile/user_collection_item/user_collection_item_home/widgets/user_collection_item_long_press_modal_msheet.dart';
import 'package:nova_social/views/mobile_view/profile/user_collection_item/user_collection_item_home/widgets/user_collection_item_mtile.dart';
import 'package:provider/provider.dart';

class UserCollectionItemMView extends StatefulWidget {
  final UserCollectionItemMViewArgs args;
  const UserCollectionItemMView({
    super.key,
    required this.args,
  });

  @override
  State<UserCollectionItemMView> createState() =>
      _UserCollectionItemMViewState();
}

class _UserCollectionItemMViewState extends State<UserCollectionItemMView> {
  @override
  Widget build(BuildContext context) {
    var collections = widget.args.profileArgs.profile?.collections;
    var collectionIndex = collections
        ?.indexWhere((element) => element.id == widget.args.collectionId);
    var currentCollection = collections
        ?.firstWhere((element) => element.id == widget.args.collectionId);
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                sizedBoxWithHeight(36),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIconButton(
                      color: AppColors.novaWhite,
                      icon: Icons.arrow_back,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Text(
                      currentCollection?.name ?? 'NA',
                      style: AppTextStyles.text30w400,
                    ),
                    if (widget.args.profileArgs.isCurrentUser ?? false) ...{
                      AppIconButton(
                        color: AppColors.novaWhite,
                        icon: Icons.add,
                        onTap: () {
                          context.push(
                            AddEditMRouter.addEditCollectionRoute,
                            extra: AddEditCollectionItemMViewArgs(
                              isAdd: true,
                              collectionName: currentCollection?.name ?? '',
                              collectionIndex: collectionIndex,
                            ),
                          );
                        },
                      ),
                    } else ...{
                      const SizedBox(),
                    },
                  ],
                ),
                sizedBoxWithHeight(16),
                Text(
                  '${currentCollection?.tagline ?? ''} ${currentCollection?.item?.length != null ? ' • ${currentCollection?.item?.length} ${currentCollection?.name}' : ''}',
                  style: AppTextStyles.text14w300,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                sizedBoxWithHeight(24),
                Consumer<ProfileNotifier>(
                  builder: (context, profileNotifier, child) {
                    if (widget.args.profileArgs.isCurrentUser ?? false) {
                      collections = profileNotifier.userProfile?.collections;
                    } else {
                      collections =
                          widget.args.profileArgs.profile?.collections;
                    }
                    collectionIndex = collections?.indexWhere(
                        (element) => element.id == widget.args.collectionId);
                    currentCollection = collections?.firstWhere(
                        (element) => element.id == widget.args.collectionId);
                    if (currentCollection?.item?.isNotEmpty ?? false) {
                      return ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        separatorBuilder: (_, __) => Column(
                          children: [
                            sizedBoxWithHeight(24),
                          ],
                        ),
                        itemBuilder: (ctx, index) {
                          return UserCollectionItemMTile(
                            collectionName: currentCollection?.name ?? '',
                            collectionItem: currentCollection!.item![index],
                            collectionIndex: collectionIndex ?? -1,
                            editingIndex: index,
                            profileArgs: widget.args.profileArgs,
                            onLongPress: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) =>
                                    UserCollectionItemLongPressModalMSheet(
                                  onDelete: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) =>
                                          AppConfirmationDialog(
                                        title: 'Delete Item',
                                        message:
                                            'Are you sure you want to delete this collection item?',
                                        buttonName: 'Delete',
                                        onConfirm: () {
                                          if (collections != null &&
                                              collectionIndex != null) {
                                            List<UserCollectionItem>? items =
                                                currentCollection?.item
                                                        ?.toList() ??
                                                    [];
                                            items.removeAt(index);
                                            currentCollection =
                                                currentCollection?.copyWith(
                                                    item: items);
                                            List<UserCollection> tmpCollection =
                                                collections?.toList() ?? [];
                                            tmpCollection[collectionIndex!] =
                                                currentCollection!;
                                            UserModel? userModel =
                                                profileNotifier.userProfile;
                                            userModel = userModel?.copyWith(
                                                collections: tmpCollection);
                                            Provider.of<ProfileNotifier>(
                                                    context,
                                                    listen: false)
                                                .saveProfile(userModel!);
                                            Navigator.pop(context);
                                            Navigator.pop(context);
                                          }
                                        },
                                      ),
                                    );
                                  },
                                ),
                              );
                            },
                          );
                        },
                        itemCount: currentCollection!.item!.length,
                      );
                    } else {
                      return Center(
                        child: Column(
                          children: [
                            sizedBoxWithHeight(40),
                            Image.asset(
                              AppAssets.invitedToNull,
                              height: 300.h,
                            ),
                            sizedBoxWithHeight(16),
                            Text(
                              'Add your first ${currentCollection?.name ?? 'item'} to flaunt it!',
                              style: AppTextStyles.text20w400,
                            ),
                          ],
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
