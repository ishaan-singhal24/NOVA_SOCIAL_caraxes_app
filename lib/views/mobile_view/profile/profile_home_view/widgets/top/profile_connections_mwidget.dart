import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/init_enum.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';

class ProfileConnectionMWidget extends StatefulWidget {
  final ProfileMViewArgs args;
  const ProfileConnectionMWidget({
    super.key,
    required this.args,
  });

  @override
  State<ProfileConnectionMWidget> createState() =>
      _ProfileConnectionMWidgetState();
}

class _ProfileConnectionMWidgetState extends State<ProfileConnectionMWidget> {
  late ProfileNotifier _profileNotifier;
  List<String>? mutualConnectionsIds;
  int _connectionCount = 0;
  InitEnum? fetchDataStatus;

  @override
  void initState() {
    super.initState();
    _profileNotifier = Provider.of<ProfileNotifier>(context, listen: false);
    // WidgetsBinding.instance.addPersistentFrameCallback((timeStamp) {
    //   fetchMutualConnections();
    // });
    fetchMutualConnections();
    fetchConnectionCount();
  }

  Future<void> fetchMutualConnections() async {
    if (widget.args.isCurrentUser ?? true) {
      return;
    }
    mutualConnectionsIds = _profileNotifier.fetchMutualConnectionsIDs(
      UserMinimum.getUserMinimum(
        widget.args.profile,
      ),
    );
    if (mutualConnectionsIds?.isEmpty ?? true) {
      return;
    }
    await _profileNotifier.fetchConnectedUsersByIds(
        widget.args.profile?.connections?.keys.toList() ?? []);
  }

  Future<void> fetchConnectionCount() async {
    setState(() {
      fetchDataStatus = InitEnum.initializing;
    });
    _connectionCount = await _profileNotifier
        .fetchUserConnectionCount(widget.args.profile?.id ?? '');
    setState(() {
      fetchDataStatus = InitEnum.initialized;
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileNoti = Provider.of<ProfileNotifier>(context);
    late int mutualConnIndex;
    if (widget.args.isCurrentUser ?? true) {
      mutualConnIndex = -1;
    } else {
      if (mutualConnectionsIds?.isNotEmpty ?? false) {
        mutualConnIndex = profileNoti.connections?.indexWhere(
              (user) => user.id == mutualConnectionsIds?.first,
            ) ??
            -1;
      } else {
        mutualConnIndex = -1;
      }
    }

    if (fetchDataStatus == InitEnum.initializing) {
      return const SizedBox();
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              context.push(
                MobileRouter.manageNetworkRoute,
                extra: ManageNetworkMViewArgs(
                  profile: widget.args.profile,
                  isCurrentUser: widget.args.isCurrentUser,
                ),
              );
            },
            child: Text(
              '$_connectionCount connections',
              style: AppTextStyles.text14w600.indigo,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if ((mutualConnectionsIds?.isNotEmpty ?? false) &&
              (mutualConnIndex > -1)) ...{
            sizedBoxWithHeight(8),
            Row(
              children: [
                AppUserProfileCircle(
                  imageUrl: profileNoti
                          .connections?[mutualConnIndex].profilePictureUrl ??
                      '',
                  errorText:
                      profileNoti.connections?[mutualConnIndex].name ?? '',
                  radius: 14.r,
                ),
                sizedBoxWithWidth(8),
                Text.rich(
                  TextSpan(
                    text: profileNoti.connections?[mutualConnIndex].name ?? '',
                    style: AppTextStyles.text12w500,
                    children: [
                      TextSpan(
                        text: (mutualConnectionsIds?.length ?? 0) > 1
                            ? ' and ${(mutualConnectionsIds?.length ?? 0) - 1} others are a mutual connection'
                            : ' is a mutual connection',
                        style: AppTextStyles.text12w300,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          },
          sizedBoxWithHeight(32),
        ],
      ),
    );
  }
}
