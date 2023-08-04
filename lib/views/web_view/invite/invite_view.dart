import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/user/invite/user_invite_model.dart';
import 'package:nova_social/data/models/user/user.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/routes/routes.dart';
import 'package:nova_social/views/web_view/loading/loading_screen.dart';
import 'package:provider/provider.dart';

class InviteView extends StatefulWidget {
  final InviteViewArgs? args;
  const InviteView({
    Key? key,
    this.args,
  }) : super(key: key);

  @override
  State<InviteView> createState() => _InviteViewState();
}

class _InviteViewState extends State<InviteView> {
  late UserModel? _invitedByUserModel;

  void _populate() {
    print('Invite View 2');

    ProfileNotifier profileNotifier =
        Provider.of<ProfileNotifier>(context, listen: false);
    profileNotifier.fetchProfileByUsername(widget.args?.invitedByUsername);
    print('Invite View 3');
    _invitedByUserModel = profileNotifier.invitedByUserProfile;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Invite View');
    _populate();
  }

  @override
  Widget build(BuildContext context) {
    final profileNoti = Provider.of<ProfileNotifier>(context);
    _invitedByUserModel = profileNoti.invitedByUserProfile;
    print('Invite View 4');
    if (profileNoti.invitedByUserProfileStatus == InitEnum.initialized &&
        _invitedByUserModel?.inviteCode == widget.args?.inviteCode &&
        ((_invitedByUserModel?.invitedTo?.length ?? 0) <
            (_invitedByUserModel?.maxAllowedInvites ?? 3))) {
      print('Invite View 5');
      UserInviteModel tempUserInviteModel = UserInviteModel(
        inviteCode: widget.args?.inviteCode,
        name: _invitedByUserModel?.name,
        userId: _invitedByUserModel?.id,
        userProfileImageUrl: _invitedByUserModel?.profilePictureUrl,
        username: _invitedByUserModel?.username,
      );
      profileNoti.invitedByUserInviteModel = tempUserInviteModel;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go(NovaRouter.baseRoute);
      });
      return const LoadingScreen();
    }
    print('Invite View 6');
    print(profileNoti.invitedByUserProfileStatus);

    return profileNoti.invitedByUserProfileStatus == InitEnum.initializing
        ? const LoadingScreen()
        : const Scaffold(
            body: Center(
              child: Text('The link is invalid.'),
            ),
          );
  }
}
