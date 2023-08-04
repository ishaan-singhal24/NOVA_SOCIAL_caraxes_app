// import 'dart:js' as js;
// import 'dart:html' as js;
import 'package:universal_html/js.dart' as js;

import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:provider/provider.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/add_edit_profile.dart';

class ProfileSocialWidget extends StatefulWidget {
  const ProfileSocialWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileSocialWidget> createState() => _ProfileSocialWidgetState();
}

class _ProfileSocialWidgetState extends State<ProfileSocialWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileNotifier>(context).profileAsPerRoute();
    final isCurrentUser = Provider.of<ProfileNotifier>(context).isCurrentUser;

    if (user?.socials?.isNotEmpty ?? false) {
      return Row(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              ...user!.socials!
                  .map(
                    (e) => Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: AppIconButton(
                        size: 32.r,
                        icon: socialIcon(e.platform),
                        onTap: () {
                          js.context.callMethod('open', [e.url]);
                        },
                        color: AppColors.novaIndigo,
                        hoverColor: AppColors.novaDarkIndigo,
                      ),
                    ),
                  )
                  .toList()
            ],
          ),
          sizedBoxWithWidth(8),
          if (isCurrentUser ?? false) ...{
            Padding(
              padding: EdgeInsets.only(right: 8.w),
              child: AppChip(
                text: ((user.socials?.length ?? 0) <= 4)
                    ? AppStrings.addSocial
                    : AppStrings.editSocial,
                prefix: SizedBox(
                  height: 18.r,
                  width: 18.r,
                  child: Icon(
                    Icons.add,
                    color: AppColors.novaWhite.withOpacity(0.4),
                    size: 16.r,
                  ),
                ),
                type: AppChipType.outlined,
                color: AppColors.novaWhite.withOpacity(0.4),
                textColor: AppChipTextColor.outlineColor,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ProfileAddEditSocial(
                      isAdd: false,
                    ),
                  );
                },
              ),
            ),
          },
        ],
      );
    }
    return isCurrentUser ?? false
        ? AppChip(
            text: '+ ${AppStrings.addSocial}',
            type: AppChipType.outlined,
            color: AppColors.novaWhite.withOpacity(0.4),
            textColor: AppChipTextColor.outlineColor,
            onTap: () {
              showDialog(
                context: context,
                builder: (context) => const ProfileAddEditSocial(),
              );
            },
          )
        : const SizedBox();
  }
}
