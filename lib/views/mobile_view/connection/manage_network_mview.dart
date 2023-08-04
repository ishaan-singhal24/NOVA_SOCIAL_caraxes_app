import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:nova_social/views/mobile_view/connection/widgets/manage_network_app_bar_mwidget.dart';
import 'package:nova_social/views/mobile_view/loading/loading_mview.dart';
import 'package:provider/provider.dart';

class ManageNetworkMView extends StatefulWidget {
  final ManageNetworkMViewArgs args;
  const ManageNetworkMView({
    super.key,
    required this.args,
  });

  @override
  State<ManageNetworkMView> createState() => _ManageNetworkMViewState();
}

class _ManageNetworkMViewState extends State<ManageNetworkMView> {
  late ScrollController _controller;
  late ProfileNotifier _profileNoti;
  late List<ConnectionModel>? _connectionList;
  InitEnum? _connectionListFetchStatus;

  void populateData() async {
    if ((widget.args.isCurrentUser ?? false) ||
        widget.args.profile?.id == _profileNoti.userProfile?.id) {
      _profileNoti.listenAllConnections(widget.args.profile?.id ?? '');
      _connectionList = _profileNoti.allConnections;
    } else {
      setState(() {
        _connectionListFetchStatus = InitEnum.initializing;
      });
      _connectionList = await _profileNoti
          .fetchOtherUserConnection(widget.args.profile?.id ?? '');
      setState(() {
        _connectionListFetchStatus = InitEnum.initialized;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    _profileNoti = Provider.of<ProfileNotifier>(context, listen: false);
    populateData();
  }

  @override
  void dispose() {
    if ((widget.args.isCurrentUser ?? false) ||
        widget.args.profile?.id == _profileNoti.userProfile?.id) {
      _profileNoti.cancellistenAllConnections();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _profileNoti = Provider.of<ProfileNotifier>(context);
    if ((widget.args.isCurrentUser ?? false) ||
        widget.args.profile?.id == _profileNoti.userProfile?.id) {
      _connectionList = _profileNoti.allConnections;
    }
    if (_connectionListFetchStatus == InitEnum.initializing) {
      return const LoadingMView();
    }
    return Scaffold(
      appBar: ManageNetworkAppBarMWidget(
        height: 60.h,
        title: (widget.args.isCurrentUser ?? false)
            ? 'Manage Network'
            : 'Connections',
      ),
      extendBody: true,
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _controller,
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBoxWithHeight(24),
              Text(
                '${_connectionList?.length ?? 0} connections',
                style: AppTextStyles.text16w600,
              ),
              sizedBoxWithHeight(24),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  if (_connectionList?.isEmpty ?? false) {
                    return const SizedBox();
                  }
                  return userRequestTile(
                    user: UserMinimum.fetchOtherFromConnection(
                      _connectionList![index],
                      widget.args.profile?.id ?? '',
                    ),
                    isCurrentUser: widget.args.isCurrentUser,
                  );
                },
                separatorBuilder: (context, index) => Column(
                  children: [
                    sizedBoxWithHeight(8),
                    Divider(
                      color: ThemeHandler.widgetColor(),
                    ),
                    sizedBoxWithHeight(8),
                  ],
                ),
                itemCount: _connectionList?.length ?? 0,
              ),
              sizedBoxWithHeight(24),
            ],
          ),
        ),
      ),
    );
  }

  Widget userRequestTile({
    required UserMinimum user,
    bool? isCurrentUser,
  }) {
    return InkWell(
      onTap: () async {
        await _profileNoti.fetchUsersById(user.id ?? '').then((value) {
          context.push(
            MobileRouter.profileRoute,
            extra: ProfileMViewArgs(isCurrentUser: false, profile: value),
          );
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 40,
            child: AppUserProfileCircle(
              imageUrl: user.profilePictureUrl ?? '',
              errorText: user.name?[0] ?? '',
              radius: 20.r,
            ),
          ),
          sizedBoxWithWidth(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name ?? '',
                  style: AppTextStyles.text14w600,
                ),
                if (user.tagline?.isNotEmpty ?? false) ...{
                  sizedBoxWithHeight(4),
                  Text(
                    user.tagline ?? '',
                    style: AppTextStyles.text12w300,
                  ),
                },
                // if (user.location != null) ...{
                //   sizedBoxWithHeight(4),
                //   Text(
                //     user.location?.parseLocation ?? '',
                //     style: AppTextStyles.text12w600,
                //   ),
                // },
              ],
            ),
          ),
          sizedBoxWithWidth(8),
          if (isCurrentUser ?? false) ...{
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Container(
                          height: 124.h,
                          width: double.maxFinite,
                          color: ThemeHandler.mutedPlusColor(nonInverse: false),
                          child: Column(
                            children: [
                              Container(
                                height: 48.w,
                                decoration: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: AppColors.novaWhite,
                                      width: 0.1,
                                    ),
                                  ),
                                ),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 24.w),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: Iconify(
                                          MaterialSymbols.close,
                                          color: AppColors.novaWhite,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: InkWell(
                                  onTap: () async {
                                    await _profileNoti
                                        .removeConnection(user.id ?? '')
                                        .then(
                                      (value) {
                                        Navigator.pop(context);
                                        appSnackBarMWidget(
                                          context: context,
                                          content: Text(
                                            'Connection removed',
                                            style: AppTextStyles.text14w400,
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 24.w),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Iconify(
                                          MaterialSymbols
                                              .group_remove_outline_rounded,
                                          color: AppColors.novaWhite,
                                        ),
                                        sizedBoxWithWidth(8),
                                        Text(
                                          'Remove connection',
                                          style: AppTextStyles.text14w600,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  child: Iconify(
                    MaterialSymbols.more_horiz,
                    color: AppColors.novaWhite,
                  ),
                ),
              ],
            ),
          },
        ],
      ),
    );
  }
}
