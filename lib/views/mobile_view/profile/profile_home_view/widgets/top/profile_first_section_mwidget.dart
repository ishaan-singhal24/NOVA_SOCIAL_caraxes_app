import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/connection/connection.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/add_edit_routes.dart/add_edit_mroutes.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';

class ProfileFirstSectionMWidget extends StatefulWidget {
  final ProfileMViewArgs args;
  const ProfileFirstSectionMWidget({
    super.key,
    required this.args,
  });

  @override
  State<ProfileFirstSectionMWidget> createState() =>
      _ProfileFirstSectionMWidgetState();
}

class _ProfileFirstSectionMWidgetState
    extends State<ProfileFirstSectionMWidget> {
  bool _showAccountSettingsDialog = false;
  late ProfileNotifier _profileNoti;

  @override
  void initState() {
    super.initState();
    _profileNoti = Provider.of<ProfileNotifier>(context, listen: false);
    //Fetch if there exists a connection between the other user and you
    if ((widget.args.isCurrentUser?.not ?? true) ||
        widget.args.profile?.id != _profileNoti.userProfile?.id) {
      _profileNoti.startConnectionStream(widget.args.profile?.id ?? '');

      // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      //   .then((value) {
      //     _showConnectionButton = true;
      //     setState(() {});
      //   })
      // });
    }
  }

  String? connectButtonName;
  Color? connectButtonColor;
  bool isTapped = false;

  void populateIsUserConnectionData(ConnectionModel? connection) {
    switch (connection?.status) {
      case null:
        connectButtonName = 'Connect';
        connectButtonColor = AppColors.novaDarkIndigo;
        break;
      case ConnectionStatus.blocked:
        connectButtonName = 'Connect';
        connectButtonColor = AppColors.novaDarkIndigo;
        break;
      case ConnectionStatus.pending:
        if (connection?.user1?.id == widget.args.profile?.id) {
          connectButtonName = 'Accept';
          connectButtonColor = AppColors.novaIndigo;
        } else {
          connectButtonName = 'Pending';
          connectButtonColor = AppColors.novaDarkGrey;
        }
        break;
      default:
    }
  }

  void connectionButtonApiCall() async {
    isTapped = true;
    setState(() {});
    final noti = Provider.of<ProfileNotifier>(context, listen: false);
    ConnectionModel? connection = noti.isUserConnection;
    switch (connection?.status) {
      case null:
        await noti.sendConnectionRequest(
            UserMinimum.getUserMinimum(widget.args.profile));
        break;
      case ConnectionStatus.accepted:
        Map<String, bool>? tmp =
            Map.fromEntries(connection?.users?.entries ?? {});
        tmp.removeWhere((key, value) => key == _profileNoti.userProfile?.id);
        String removeConnectedUserId = tmp.entries.first.key;
        await noti.removeConnection(removeConnectedUserId);
        break;
      case ConnectionStatus.blocked:
        await noti.sendConnectionRequest(
            UserMinimum.getUserMinimum(widget.args.profile));
        break;
      case ConnectionStatus.pending:
        if (connection?.user1?.id == widget.args.profile?.id) {
          await noti.acceptConnectionRequest(connection!);
        } else {
          // await noti.removeConnectionRequest(connection!);
        }
        break;
      default:
    }
    isTapped = false;
    setState(() {});
  }

  @override
  void dispose() {
    _profileNoti.cancelConnectionStream();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileNoti = Provider.of<ProfileNotifier>(context);
    populateIsUserConnectionData(profileNoti.isUserConnection);
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            context.push(
              AddEditMRouter.addEditWallpaperImageRoute,
              extra: ProfileMViewArgs(
                isCurrentUser: widget.args.isCurrentUser,
                profile: widget.args.profile,
              ),
            );
          },
          child: SizedBox(
            width: double.maxFinite,
            height: 264.h,
            child: CachedNetworkImage(
              width: double.maxFinite,
              height: double.maxFinite,
              imageUrl: widget.args.profile?.profileWallpaperUrl ??
                  AppAssets.nDefaultWallpaper,
              fit: BoxFit.cover,
              progressIndicatorBuilder: (context, _, __) => Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.novaIndigo,
                ),
              ),
              errorWidget: (context, url, error) => Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                  color: AppColors.novaIndigo,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          child: Container(
            height: 72.h,
            width: ScreenUtil.instance.screenWidth,
            decoration: BoxDecoration(
              color: ThemeHandler.backgroundColor(),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8.r),
                topRight: Radius.circular(8.r),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 8.h,
          left: 24.w,
          child: SizedBox(
            width: ScreenUtil.instance.screenWidth - 48.w,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    context.push(
                      AddEditMRouter.addEditProfileImageRoute,
                      extra: ProfileMViewArgs(
                        isCurrentUser: widget.args.isCurrentUser,
                        profile: widget.args.profile,
                      ),
                    );
                  },
                  child: AppUserProfileCircle(
                    imageUrl: widget.args.profile?.profilePictureUrl ?? '',
                    errorText: widget.args.profile?.name?[0] ?? '',
                    radius: 72.r,
                    borderEnabled: false,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      if (kDebugMode) ...{
                        IconButton(
                          onPressed: () async {
                            await Provider.of<AuthNotifier>(
                              context,
                              listen: false,
                            ).signOut();
                          },
                          icon: Icon(
                            Icons.logout,
                            color: ThemeHandler.widgetColor(),
                          ),
                        ),
                      },
                      if (widget.args.isCurrentUser ?? false) ...{
                        Column(
                          children: [
                            CustomButton(
                              hoverColor: ThemeHandler.mutedPlusColor(
                                  nonInverse: false),
                              hoverTextColor: AppColors.novaIndigo,
                              color: AppColors.novaDarkIndigo,

                              // color: ThemeHandler.mutedPlusColor(
                              //     nonInverse: false),
                              text: 'Edit Profile',
                              onPressed: () {
                                context.push(
                                  AddEditMRouter.addEditIntroRoute,
                                  extra: false,
                                );
                              },
                              height: 40.h,
                              width: 120.w,
                            ),
                            sizedBoxWithHeight(16),
                            CustomButton(
                              hoverColor: ThemeHandler.mutedPlusColor(
                                  nonInverse: false),
                              hoverTextColor: AppColors.novaIndigo,
                              color: AppColors.novaDarkIndigo,
                              text: 'SOP Generator',
                              onPressed: () {
                                context.push(MobileRouter.sopGeneratorRoute
                                    // AddEditMRouter.addEditIntroRoute,
                                    // extra: false,
                                    );
                              },
                              height: 40.h,
                              width: 120.w,
                            ),
                          ],
                        ),
                      },
                      if ((widget.args.isCurrentUser?.not ?? false) &&
                          (profileNoti.isUserConnectionStreamInitialized ==
                              true) &&
                          isTapped != true &&
                          (profileNoti.isUserConnection?.status !=
                              ConnectionStatus.accepted)) ...{
                        CustomButton(
                          hoverColor:
                              ThemeHandler.mutedPlusColor(nonInverse: false),
                          hoverTextColor: AppColors.novaIndigo,
                          color: connectButtonName == 'Pending'
                              ? Colors.transparent
                              : connectButtonColor,
                          text: connectButtonName ?? 'Connect',
                          onPressed: () {
                            connectionButtonApiCall();
                          },
                          height: 40.h,
                          width: 120.w,
                        ),
                      }
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        if (Navigator.canPop(context)) ...{
          Positioned(
            left: 16.w,
            top: 16.h,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.novaWhite.withOpacity(0.8),
              ),
            ),
          ),
        },
        if ((widget.args.isCurrentUser?.not ?? false)) ...{
          Positioned(
            right: 24.w,
            top: 16.h,
            child: IconButton(
              onPressed: () {
                setState(() {
                  _showAccountSettingsDialog = _showAccountSettingsDialog.not;
                });
              },
              icon: Icon(
                Icons.more_vert,
                color: AppColors.novaWhite.withOpacity(0.8),
              ),
            ),
          ),
        },
        if (_showAccountSettingsDialog &&
            (widget.args.isCurrentUser?.not ?? false)) ...{
          Positioned(
            right: 32.w,
            top: 56.h,
            child: Container(
              width: 168.w,
              decoration: BoxDecoration(
                color: ThemeHandler.mutedPlusColor(nonInverse: false),
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.all(16.r),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (widget.args.isCurrentUser?.not ?? false) ...{
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AppConfirmationDialog(
                            buttonName: 'Block',
                            title: 'Block User',
                            message:
                                'Are you sure you want to block this user?\nYou will not be able to see feeds/comments/messages or search this user.',
                            onConfirm: () {
                              profileNoti
                                  .blockUser(
                                fromUserModel: profileNoti.userProfile,
                                toUserModel: widget.args.profile,
                              )
                                  .then((value) {
                                //       profileNoti
                                //     .connection(
                                //   fromUserModel: profileNoti.userProfile,
                                //   toUserModel: widget.args.profile,
                                // )
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);
                                }
                                if (Navigator.canPop(context)) {
                                  Navigator.pop(context);
                                }
                              });
                            },
                          ),
                        );
                      },
                      child: Text(
                        'Block User',
                        style: AppTextStyles.text12w600,
                      ),
                    ),
                  },
                ],
              ),
            ),
          ),
        },
      ],
    );
  }
}
