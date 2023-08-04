import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:provider/provider.dart';

class AppTopNavBarMWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final double height;
  final String? title;
  final List<Widget>? action;
  final String? disablePop;

  const AppTopNavBarMWidget({
    Key? key,
    this.height = kToolbarHeight,
    this.title,
    this.action,
    this.disablePop,
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
              },
              child: Iconify(
                MaterialSymbols.arrow_back_rounded,
                color: AppColors.novaWhite,
              ),
            ),
            if (title != null) ...{
              Text(
                title!,
                style: AppTextStyles.text24w500,
              ),
            },
            ButtonBar(
              children: [
                if (action?.isNotEmpty ?? false) ...{
                  ...action!,
                },
              ],
            ),
          ],
        ),
      ),
    );
  }
}
