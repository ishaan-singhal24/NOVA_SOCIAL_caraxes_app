import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/screen_config.dart';
import 'package:nova_social/utils/theme_handler.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:provider/provider.dart';
import 'package:nova_social/views/web_view/profile/add_edit_profile/profile_add_edit_about.dart';
import 'package:readmore/readmore.dart';

class ProfileAboutWidget extends StatefulWidget {
  const ProfileAboutWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileAboutWidget> createState() => _ProfileAboutWidgetState();
}

class _ProfileAboutWidgetState extends State<ProfileAboutWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileNotifier>(context).profileAsPerRoute();
    final isCurrentUser = Provider.of<ProfileNotifier>(context).isCurrentUser;

    if ((user?.about?.isEmpty ?? true) && (isCurrentUser?.not ?? false)) {
      return const SizedBox();
    }

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            if (user?.about?.isNotEmpty ?? false) ...{
              Expanded(
                child: ReadMoreText(
                  user?.about ?? '',
                  trimLines: 5,
                  colorClickableText: AppColors.novaIndigo,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: ' Show more',
                  trimExpandedText: ' Show less',
                  style: AppTextStyles.text16w400.darkModeSupport.copyWith(
                    height: 1.4,
                    wordSpacing: 1.2,
                  ),
                  moreStyle: AppTextStyles.text16w400.indigo,
                ),
              ),
            } else if (user?.about?.isEmpty ??
                true && (isCurrentUser ?? false)) ...{
              Expanded(
                child: InkWell(
                  borderRadius: BorderRadius.circular(8.r),
                  hoverColor: ThemeHandler.mutedPlusColor(nonInverse: false),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => const ProfileAddEditAbout(
                        isAdd: true,
                      ),
                    );
                  },
                  child: Container(
                    height: 64.h,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: ThemeHandler.mutedPlusColor(nonInverse: false),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Text(
                      'Write something about yourself...',
                      style: AppTextStyles.text14w400,
                    ),
                  ),
                ),
              ),
            },
            if (isCurrentUser ?? false) ...{
              AppIconButton(
                icon: Icons.edit,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => const ProfileAddEditAbout(
                      isAdd: false,
                    ),
                  );
                },
              ),
            },
          ],
        ),
        sizedBoxWithHeight(16),
        Divider(
          color: ThemeHandler.novaMutedColor(),
          thickness: 0.2,
        ),
        sizedBoxWithHeight(16),
      ],
    );
  }
}
