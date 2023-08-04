import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/material_symbols.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';

class UserCollectionItemLongPressModalMSheet extends StatelessWidget {
  final VoidCallback? onDelete;
  const UserCollectionItemLongPressModalMSheet({super.key, this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 124.h,
      width: double.maxFinite,
      color: ThemeHandler.mutedPlusColor(nonInverse: false),
      child: Column(
        children: [
          Container(
            height: 48.w,
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: AppColors.novaWhite,
                  width: 0.1,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Iconify(
                      MaterialSymbols.close,
                      color: AppColors.novaWhite,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: onDelete,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Iconify(
                      MaterialSymbols.delete_forever_outline_rounded,
                      color: AppColors.novaWhite,
                    ),
                    sizedBoxWithWidth(8),
                    Text(
                      'Remove collection item',
                      style: AppTextStyles.text14w600,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
