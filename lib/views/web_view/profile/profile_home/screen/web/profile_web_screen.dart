import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/views/web_view/profile/profile_home/cards/cards.dart';
import 'package:provider/provider.dart';

class ProfileWebScreen extends StatelessWidget {
  final bool? isCurrentUser;
  const ProfileWebScreen({
    Key? key,
    this.isCurrentUser = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<ProfileNotifier>(context).profileAsPerRoute();
    final profileWallpaperUrl = user?.profileWallpaperUrl;
    final bool isDreamsEmpty = (user?.dreamColleges?.isEmpty ?? true) &&
        (user?.dreamCountries?.isEmpty ?? true) &&
        (user?.dreamCareers?.isEmpty ?? true);
    ScreenUtil.instance.init(context);
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (profileWallpaperUrl?.isNotEmpty ?? false) ...{
              SizedBox(
                width: ScreenUtil.instance.width * 1.0,
                height: 200.h,
                child: CachedNetworkImage(
                  imageUrl: profileWallpaperUrl ?? '',
                  errorWidget: (context, url, error) => Container(
                    color: AppColors.novaIndigo,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            } else ...{
              SizedBox(
                width: ScreenUtil.instance.width * 1.0,
                height: 200.h,
                child: Image.asset(
                  AppAssets.profileBackground,
                  fit: BoxFit.cover,
                ),
              ),
            },
            Transform.translate(
              offset: Offset(0.0, -100.h),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: ScreenUtil.instance.width * 0.55,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    decoration: BoxDecoration(
                      color: ThemeHandler.backgroundColor(),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.r),
                        topRight: Radius.circular(16.r),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        ProfileBioWidget(),
                        ProfileBodyWidget(),
                      ],
                    ),
                  ),
                  if (isDreamsEmpty && (isCurrentUser?.not ?? true))
                    ...{}
                  else ...{
                    sizedBoxWithWidth(32),
                    Container(
                      width: ScreenUtil.instance.width * 0.25,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      decoration: BoxDecoration(
                        color: ThemeHandler.backgroundColor(),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16.r),
                          topRight: Radius.circular(16.r),
                        ),
                      ),
                      child: const ProfileRightWidget(),
                    ),
                  },
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
