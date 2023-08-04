import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:provider/provider.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/add_edit_profile.dart';

class ProfileTaglineWidget extends StatefulWidget {
  const ProfileTaglineWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileTaglineWidget> createState() => _ProfileTaglineWidgetState();
}

class _ProfileTaglineWidgetState extends State<ProfileTaglineWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileNotifier>(context).profileAsPerRoute();
    final isCurrentUser = Provider.of<ProfileNotifier>(context).isCurrentUser;

    if (user?.tagline?.isNotEmpty ?? false) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: Text(
              user?.tagline ?? '',
              style: AppTextStyles.text18w500,
            ),
          ),
          // if (isCurrentUser) ...{
          //   AppIconButton(
          //     icon: Icons.edit,
          //     onTap: () {
          //       showDialog(
          //         context: context,
          //         builder: (context) => const ProfileAddEditTagline(
          //           isAdd: false,
          //         ),
          //       );
          //     },
          //   ),
          // },
        ],
      );
    }
    return isCurrentUser ?? false
        ? AppChip(
            text: '+ ${AppStrings.addTagline}',
            type: AppChipType.outlined,
            color: AppColors.novaWhite.withOpacity(0.4),
            textColor: AppChipTextColor.outlineColor,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const ProfileAddEditIntro(
                  isAdd: false,
                ),
              );
            },
          )
        : const SizedBox();
  }
}
