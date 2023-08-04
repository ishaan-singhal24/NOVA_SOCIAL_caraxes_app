import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;

  const TopAppBar({
    Key? key,
    this.height = kToolbarHeight,
  }) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: preferredSize.height,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Iconsax.menu_1),
            ButtonBar(
              children: [
                const Icon(Iconsax.search_normal_1),
                sizedBoxWithWidth(16),
                const Icon(Iconsax.notification),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
