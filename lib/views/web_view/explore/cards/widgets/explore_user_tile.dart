import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/routes/routes.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
// import 'dart:html';
import 'package:universal_html/html.dart' as html;

class ExploreUserTile extends StatelessWidget {
  final UserModel profile;
  const ExploreUserTile({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        html.window.open(
            '${Uri.base.origin}${NovaRouter.userRoute}/${profile.username}',
            '_blank');
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppNetworkImage(
            url: profile.profilePictureUrl ?? '',
            width: 60.r,
            height: 60.r,
          ),
          sizedBoxWithWidth(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (profile.name?.isNotEmpty ?? false) ...{
                  sizedBoxWithHeight(4),
                  Text(
                    profile.name!,
                    style: AppTextStyles.text14w600,
                    overflow: TextOverflow.ellipsis,
                  ),
                },
                if (profile.tagline?.isNotEmpty ?? false) ...{
                  sizedBoxWithHeight(8),
                  Text(
                    profile.tagline!,
                    style: AppTextStyles.text12w300,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                },
                if (profile.educations?.isNotEmpty ?? false) ...{
                  sizedBoxWithHeight(8),
                  Row(
                    children: [
                      Icon(
                        Icons.school,
                        color: ThemeHandler.widgetColor(),
                        size: 12.r,
                      ),
                      sizedBoxWithWidth(4),
                      Text(
                        profile.educations?.first.school ??
                            'School name not available',
                        style: AppTextStyles.text12w300,
                      ),
                    ],
                  ),
                },
              ],
            ),
          ),
        ],
      ),
    );
  }
}
