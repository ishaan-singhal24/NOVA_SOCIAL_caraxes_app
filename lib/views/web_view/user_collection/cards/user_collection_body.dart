import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/add_edit_profile.dart';
import 'package:nova_social/views/web_view/user_collection/cards/widgets/user_collection_item_tile.dart';
import 'package:provider/provider.dart';

class UserCollectionBody extends StatefulWidget {
  final UserCollection? collection;
  const UserCollectionBody({
    Key? key,
    this.collection,
  }) : super(key: key);

  @override
  State<UserCollectionBody> createState() => _UserCollectionBodyState();
}

class _UserCollectionBodyState extends State<UserCollectionBody> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileNotifier>(builder: (ctx, profileNoti, _) {
      final userModel = profileNoti.profileAsPerRoute();
      final collections = userModel?.collections;
      final collectionIndex = collections
          ?.indexWhere((element) => element.id == widget.collection?.id);
      final currentCollection = collections
          ?.firstWhere((element) => element.id == widget.collection?.id);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.collection?.name ?? 'NA',
                style: AppTextStyles.text30w400,
              ),
              if (profileNoti.isCurrentUser ?? false) ...{
                CustomButton(
                  text: '+ Add',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => ProfileAddEditCollectionItem(
                        isAdd: true,
                        collectionIndex: collectionIndex,
                      ),
                    );
                  },
                ),
              },
            ],
          ),
          sizedBoxWithHeight(8),
          Text(
            '${widget.collection?.tagline ?? ''} ${currentCollection?.item?.length != null ? ' • ${currentCollection?.item?.length} ${currentCollection?.name}' : ''}',
            style: AppTextStyles.text14w300,
          ),
          sizedBoxWithHeight(24),
          if (currentCollection?.item?.isNotEmpty ?? false) ...{
            SizedBox(
              width: double.maxFinite,
              child: ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                separatorBuilder: (_, __) => Column(
                  children: [
                    sizedBoxWithHeight(24),
                  ],
                ),
                itemBuilder: (ctx, index) {
                  return UserCollectionItemTile(
                    item: currentCollection!.item![index],
                    collectionIndex: collectionIndex ?? -1,
                    editingIndex: index,
                  );
                },
                itemCount: currentCollection!.item!.length,
              ),
            ),
          } else ...{
            Center(
              child: Column(
                children: [
                  sizedBoxWithHeight(40),
                  Image.asset(
                    AppAssets.invitedToNull,
                    height: 300.h,
                  ),
                  sizedBoxWithHeight(16),
                  Text(
                    'Add your first ${widget.collection?.name ?? 'item'} to flaunt it!',
                    style: AppTextStyles.text20w400,
                  ),
                ],
              ),
            ),
          },
        ],
      );
    });
  }
}
