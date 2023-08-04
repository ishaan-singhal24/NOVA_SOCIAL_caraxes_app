import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/base/pages/network/widgets/widgets.dart';
import 'package:nova_social/views/web_view/common/common.dart';

class NetworkPage extends StatefulWidget {
  const NetworkPage({Key? key}) : super(key: key);

  @override
  State<NetworkPage> createState() => _NetworkPageState();
}

class _NetworkPageState extends State<NetworkPage> {
  bool isConnectionListOpen = false;
  bool isCollaborationListOpen = false;

  List<UserModel>? connectionReq;
  List<UserModel>? collaborationReq;

  @override
  void initState() {
    super.initState();
    connectionReq =
        userListModelJson.map((e) => UserModel.fromJson(e)).toList();
    collaborationReq = connectionReq;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          sizedBoxWithHeight(16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Text(
              AppStrings.network,
              style: AppTextStyles.text22w700,
            ),
          ),
          sizedBoxWithHeight(32),
          const ManageNetworkCard(),
          sizedBoxWithHeight(32),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.collectionRequest,
                  style: AppTextStyles.text16w500,
                ),
                InkWell(
                  onTap: () {
                    isConnectionListOpen = !isConnectionListOpen;
                    setState(() {});
                  },
                  child: isConnectionListOpen
                      ? Icon(
                          Iconsax.arrow_up_2,
                          size: 18.sp,
                        )
                      : Icon(
                          Iconsax.arrow_down_1,
                          size: 18.sp,
                        ),
                ),
              ],
            ),
          ),
          sizedBoxWithHeight(24),
          ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: isConnectionListOpen
                ? connectionReq?.length ?? 0
                : min(connectionReq?.length ?? 0, 2),
            separatorBuilder: (_, __) => sizedBoxWithHeight(8),
            itemBuilder: (context, index) {
              if (connectionReq?.isEmpty ?? true) {
                return const SizedBox();
              }
              return CollectionReqCard(
                user: connectionReq![index],
              );
            },
          ),
          sizedBoxWithHeight(24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppStrings.collectionRequest,
                  style: AppTextStyles.text16w500,
                ),
                InkWell(
                  onTap: () {
                    isCollaborationListOpen = !isCollaborationListOpen;
                    setState(() {});
                  },
                  child: isCollaborationListOpen
                      ? Icon(
                          Iconsax.arrow_up_2,
                          size: 18.sp,
                        )
                      : Icon(
                          Iconsax.arrow_down_1,
                          size: 18.sp,
                        ),
                ),
              ],
            ),
          ),
          sizedBoxWithHeight(24),
          ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: isCollaborationListOpen
                ? collaborationReq?.length ?? 0
                : min(collaborationReq?.length ?? 0, 2),
            separatorBuilder: (_, __) => sizedBoxWithHeight(8),
            itemBuilder: (context, index) {
              if (collaborationReq?.isEmpty ?? true) {
                return const SizedBox();
              }
              return CollaborationReqCard(
                user: collaborationReq![index],
              );
            },
          ),
          sizedBoxWithHeight(96),
        ],
      ),
    );
  }
}
