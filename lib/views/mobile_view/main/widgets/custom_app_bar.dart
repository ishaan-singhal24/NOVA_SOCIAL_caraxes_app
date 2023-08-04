import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';
import 'package:provider/provider.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final double height;
  final String head;

  const CustomAppBar({
    Key? key,
    this.height = kToolbarHeight,
    required this.scaffoldKey,
    required this.head,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileNotifier>(context).userProfile;
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
          color: ThemeHandler.backgroundColor(),
          border: Border(
            bottom: BorderSide(
              color: ThemeHandler.widgetColor(),
              width: 0.1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                scaffoldKey.currentState!.openDrawer();
              },
              child: AppUserProfileCircle(
                imageUrl: profile?.profilePictureUrl ?? '',
                errorText: profile?.name?[0] ?? '',
                radius: 20.r,
              ),
            ),
            Expanded(
              child: Center(
                child: GestureDetector(
                  onTap: () {
                    context.push(MobileRouter.searchRoute);
                  },
                  child: Text(
                    head,
                    style: AppTextStyles.text24w600,
                  ),
                ),
              ),
            ),
            sizedBoxWithWidth(40),
            // ButtonBar(
            //   children: [
            //     InkWell(
            //       onTap: () {
            //         //Navigate
            //       },
            //       child: Iconify(
            //         MaterialSymbols.search,
            //         color: AppColors.novaWhite,
            //       ),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
