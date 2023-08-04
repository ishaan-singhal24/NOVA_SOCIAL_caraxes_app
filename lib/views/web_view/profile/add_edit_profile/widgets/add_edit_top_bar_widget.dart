import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';

class AddEditTopBarWidget extends StatelessWidget {
  final String title;
  final bool isAdd;
  final bool? isUserOnboarding;
  final Function()? onDelete;

  const AddEditTopBarWidget({
    Key? key,
    required this.title,
    this.onDelete,
    this.isAdd = true,
    this.isUserOnboarding = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${isAdd ? 'Add' : 'Edit'} $title',
          style: AppTextStyles.text20w400.darkModeSupport,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        Row(
          children: [
            if (isAdd.not && onDelete != null) ...{
              AppIconButton(
                onTap: onDelete!,
                icon: Icons.delete,
              ),
              sizedBoxWithWidth(16),
            },
            if (isUserOnboarding?.not ?? false) ...{
              AppIconButton(
                icon: Icons.close,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            },
          ],
        ),
      ],
    );
  }
}
