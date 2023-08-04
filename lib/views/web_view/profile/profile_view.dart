import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/notifiers/auth/auth_notifier.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/routes/routes.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/loading/loading_screen.dart';
import 'package:nova_social/views/web_view/mobile/mobile_web_screen.dart';
import 'package:nova_social/views/web_view/profile/profile_home/screen/tablet/tablet_screen.dart';
import 'package:nova_social/views/web_view/profile/profile_home/screen/web/profile_web_screen.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatefulWidget {
  final ProfileViewArgs? args;
  const ProfileView({
    Key? key,
    this.args,
  }) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  bool _init = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final profileNoti = context.read<ProfileNotifier>();
    if (profileNoti.authStatus != null &&
        _init.not &&
        (profileNoti.userProfileStatus != null &&
            profileNoti.userProfileStatus != InitEnum.initializing) &&
        (widget.args?.username != null)) {
      profileNoti.isCurrentUser =
          (profileNoti.userProfile?.username ?? false) ==
              (widget.args?.username);
      if (profileNoti.isCurrentUser?.not ?? false) {
        profileNoti.populateOtherUser(widget.args?.username);
      }
      _init = true;
    }
    if (profileNoti.otherUserProfile == null &&
        profileNoti.otherUserProfileStatus == InitEnum.uninitialized) {
      context.go(NovaRouter.notFoundRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    final profileNoti = context.watch<ProfileNotifier>();
    if (widget.args?.showLoading ?? false) {
      return const LoadingScreen();
    }
    if (((profileNoti.isCurrentUser?.not ?? false) &&
            profileNoti.otherUserProfile == null) ||
        ((profileNoti.isCurrentUser ?? false) &&
            profileNoti.userProfile == null)) {
      return const LoadingScreen();
    }
    return ResponsiveWidget(
      largeScreen: ProfileWebScreen(
        isCurrentUser: profileNoti.isCurrentUser,
      ),
      mediumScreen:
          ProfileTabletScreen(isCurrentUser: profileNoti.isCurrentUser),
      smallScreen: const MobileWebScreen(),
    );
  }
}
