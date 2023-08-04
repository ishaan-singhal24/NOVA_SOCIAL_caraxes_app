import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nova_social/routes/web/nova_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:provider/provider.dart';
// import 'dart:html' as html;
import 'package:universal_html/html.dart' as html;

class ProfileInviteDialog extends StatefulWidget {
  const ProfileInviteDialog({Key? key}) : super(key: key);

  @override
  State<ProfileInviteDialog> createState() => _ProfileInviteDialogState();
}

class _ProfileInviteDialogState extends State<ProfileInviteDialog> {
  var _pageIndex = 0;
  var _showCopiedText = false;
  Widget _buildPage0Widget({
    required String userName,
    required String inviteLink,
  }) {
    return Column(
      children: [
        SizedBox(
          width: 480.w,
          child: Text(
            'Hey $userName, Want to show your friends what Nova is? '
            'You can share your personalized link below and invite them! '
            'You will get credit for the invite on their profile',
            style: AppTextStyles.text16w400,
            textAlign: TextAlign.center,
          ),
        ),
        sizedBoxWithHeight(32),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 40.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: AppColors.novaIndigo,
                ),
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 8.h,
              ),
              child: Text(
                inviteLink,
                style: AppTextStyles.text14w500,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            sizedBoxWithWidth(8),
            CustomButton(
              height: 40.h,
              text: 'Copy',
              onPressed: () {
                Clipboard.setData(
                  ClipboardData(
                    text: inviteLink,
                  ),
                ).then((value) {
                  setState(() {
                    _showCopiedText = true;
                  });
                  Future.delayed(
                    const Duration(
                      seconds: 1,
                    ),
                  ).then((value) {
                    setState(() {
                      _showCopiedText = false;
                    });
                  });
                });
              },
              width: 100.w,
            ),
          ],
        ),
        if (_showCopiedText) ...{
          sizedBoxWithHeight(16),
          Container(
            decoration: BoxDecoration(
              color: ThemeHandler.mutedPlusColor(nonInverse: false),
              borderRadius: BorderRadius.circular(8.r),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 8.w,
              vertical: 8.h,
            ),
            child: Text(
              'Link Copied',
              style: AppTextStyles.text14w300,
            ),
          ),
        },
        sizedBoxWithHeight(16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool kIsLargeScreen = !ResponsiveWidget.isSmallScreen();
    final user = Provider.of<ProfileNotifier>(context).profileAsPerRoute();

    final invitedToLength = user?.invitedTo?.length ?? 0;
    final inviteCount = (user?.maxAllowedInvites ?? 3) - invitedToLength;
    final username = user?.username ?? 'NA';
    final userName = user?.name ?? '';
    final inviteCode = user?.inviteCode ?? 'NA';
    final inviteLink =
        'https://app.novasocial.club/invite/$username/$inviteCode';

    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: AppColors.novaIndigo.withOpacity(0.5),
        child: FittedBox(
          child: Container(
            constraints: BoxConstraints(
              maxWidth: kIsLargeScreen
                  ? ScreenUtil.instance.width * 0.5
                  : ScreenUtil.instance.width * 0.8,
            ),
            padding: EdgeInsets.all(16.r),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ThemeHandler.backgroundColor(),
              boxShadow: [
                BoxShadow(),
              ],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Spacer(),
                    Text(
                      'You have $inviteCount invites left!',
                      style: AppTextStyles.text16w500,
                    ),
                    const Spacer(),
                    InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: Icon(
                        Icons.close,
                        size: 16,
                        color: ThemeHandler.widgetColor(),
                      ),
                    ),
                  ],
                ),
                sizedBoxWithHeight(16),
                Divider(
                  height: 0.2,
                  color: ThemeHandler.novaMutedColor(),
                ),
                sizedBoxWithHeight(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _pageIndex = 0;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(bottom: 8.h),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: _pageIndex == 0
                                  ? AppColors.novaIndigo
                                  : AppColors.darkBackground,
                            ),
                          ),
                        ),
                        child: Text(
                          'Invite Link',
                          style: _pageIndex == 0
                              ? AppTextStyles.text16w600
                              : AppTextStyles.text16w400,
                        ),
                      ),
                    ),
                    sizedBoxWithWidth(16),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _pageIndex = 1;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.only(bottom: 8.h),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: _pageIndex == 1
                                  ? AppColors.novaIndigo
                                  : AppColors.darkBackground,
                            ),
                          ),
                        ),
                        child: Text(
                          'Invited',
                          style: _pageIndex == 1
                              ? AppTextStyles.text16w600
                              : AppTextStyles.text16w400,
                        ),
                      ),
                    ),
                  ],
                ),
                sizedBoxWithHeight(40),
                if (_pageIndex == 0) ...{
                  _buildPage0Widget(
                    userName: userName,
                    inviteLink: inviteLink,
                  ),
                } else if (_pageIndex == 1) ...{
                  const Page1Widget(),
                }
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Page1Widget extends StatelessWidget {
  const Page1Widget({Key? key}) : super(key: key);

  Widget _buildProfileTile(
      {required UserInviteModel profile, required BuildContext context}) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 32.w,
        vertical: 16.h,
      ),
      child: InkWell(
        onTap: () {
          html.window.open(
            '${Uri.base.origin}${NovaRouter.userRoute}/${profile.username}',
            '_blank',
          );
        },
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(2.r),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: AppColors.novaIndigo,
                ),
              ),
              width: 60.h,
              height: 60.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(32.r),
                child: CachedNetworkImage(
                  imageUrl: profile.userProfileImageUrl ??
                      AppAssets.sampleUserProfilePic,
                  width: double.maxFinite,
                  height: double.maxFinite,
                  fit: BoxFit.cover,
                  errorWidget: (context, err, v) => Container(
                    color: AppColors.novaPurple,
                    width: double.maxFinite,
                    height: double.maxFinite,
                    alignment: Alignment.center,
                    child: Text(
                      profile.name?[0] ?? '',
                      style: AppTextStyles.text28w400.white,
                    ),
                  ),
                ),
              ),
            ),
            sizedBoxWithWidth(8),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile.name ?? 'Name not available',
                  style: AppTextStyles.text16w600,
                ),
                sizedBoxWithHeight(8),
                Text(
                  '@${profile.username ?? 'Username not available'}',
                  style: AppTextStyles.text14w300,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileNotifier>(context).profileAsPerRoute();
    final invitedToList = user?.invitedTo;
    return (invitedToList?.isNotEmpty ?? false)
        ? Wrap(
            runSpacing: 8.r,
            spacing: 16.r,
            children: [
              ...invitedToList!.map(
                (profile) => _buildProfileTile(
                  profile: profile,
                  context: context,
                ),
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AppAssets.invitedToNull,
                height: 160.h,
              ),
              sizedBoxWithHeight(16),
              Text(
                'Once someone uses your invite link, they will appear here.',
                style: AppTextStyles.text14w300,
              ),
              sizedBoxWithHeight(16),
            ],
          );
  }
}
