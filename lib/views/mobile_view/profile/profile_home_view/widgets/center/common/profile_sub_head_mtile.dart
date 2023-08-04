import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';

class ProfileSubHeadMTile extends StatelessWidget {
  final String title;
  final Function()? onAdd;
  final Function()? onEdit;
  final bool? isCurrentUser;
  const ProfileSubHeadMTile({
    super.key,
    required this.title,
    this.onAdd,
    this.onEdit,
    this.isCurrentUser = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.text20w500,
          ),
        ),
        if (isCurrentUser ?? false) ...{
          Row(
            children: [
              AppIconButton(
                size: 20.r,
                color: AppColors.novaWhite.withOpacity(0.8),
                icon: Icons.add,
                onTap: onAdd ?? () {},
              ),
              sizedBoxWithWidth(8),
              AppIconButton(
                size: 20.r,
                color: AppColors.novaWhite.withOpacity(0.8),
                icon: Icons.edit,
                onTap: onEdit ?? () {},
              ),
            ],
          ),
        },
      ],
    );
  }
}
