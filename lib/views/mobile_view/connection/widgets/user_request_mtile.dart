import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/connection/connection.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/routes/route_arguments.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';

class UserRequestMTile extends StatelessWidget {
  final UserMinimum? user;
  final ConnectionModel connection;
  final int selectedToggle;
  const UserRequestMTile({
    super.key,
    required this.user,
    required this.connection,
    required this.selectedToggle,
  });

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      return const SizedBox();
    }
    final profileNoti = Provider.of<ProfileNotifier>(context, listen: false);
    final mutualConn = profileNoti.fetchMutualConnectionsIDs(user!);
    return InkWell(
      onTap: () async {
        // appLoadingMPopup(context);
        final profile = await profileNoti.fetchUsersById(user?.id ?? '');
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          // Navigator.pop(context);
          context.push(
            MobileRouter.profileRoute,
            extra: ProfileMViewArgs(
              isCurrentUser: profileNoti.userProfile?.id == user?.id,
              profile: profile,
            ),
          );
        });
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 40,
            child: AppUserProfileCircle(
              imageUrl: user?.profilePictureUrl ?? '',
              errorText: user?.name?[0] ?? '',
              radius: 20.r,
            ),
          ),
          sizedBoxWithWidth(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user?.name ?? '',
                  style: AppTextStyles.text14w600,
                ),
                if (user?.tagline?.isNotEmpty ?? false) ...{
                  sizedBoxWithHeight(4),
                  Text(
                    user?.tagline ?? '',
                    style: AppTextStyles.text12w300,
                  ),
                },
                if (mutualConn?.isNotEmpty ?? false) ...{
                  sizedBoxWithHeight(4),
                  Text(
                    '${mutualConn?.length} mutual connections',
                    style: AppTextStyles.text12w600,
                  ),
                },
              ],
            ),
          ),
          sizedBoxWithWidth(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (selectedToggle == 0) ...{
                InkWell(
                  onTap: () {
                    profileNoti.acceptConnectionRequest(connection);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.novaIndigo,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Iconify(
                      MaterialSymbols.check,
                      color: AppColors.novaIndigo,
                    ),
                  ),
                ),
                sizedBoxWithWidth(8),
                InkWell(
                  onTap: () {
                    profileNoti.removeConnectionRequest(connection);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.novaWhite,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Iconify(
                      MaterialSymbols.close,
                      color: AppColors.novaWhite,
                    ),
                  ),
                ),
              } else ...{
                CustomButton(
                  onPressed: () {
                    profileNoti.removeConnectionRequest(connection);
                    appSnackBarMWidget(
                      context: context,
                      content: Text(
                        'Connection request withdrawn',
                        style: AppTextStyles.text14w400,
                      ),
                    );
                  },
                  text: 'Withdraw',
                  height: 32,
                  width: 104,
                  color: ThemeHandler.mutedPlusColor(nonInverse: false),
                ),
              },
            ],
          ),
        ],
      ),
    );
  }
}
