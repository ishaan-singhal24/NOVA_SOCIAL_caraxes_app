import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';

class ProfileAddEditAppBarMWidget extends StatelessWidget {
  final String title;
  final bool isAdd;
  final bool showAddEditPreText;
  const ProfileAddEditAppBarMWidget({
    super.key,
    required this.title,
    required this.isAdd,
    this.showAddEditPreText = true,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => context.pop(),
          child: Icon(
            Icons.arrow_back,
            size: 24.r,
            color: ThemeHandler.widgetColor(),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              showAddEditPreText.not
                  ? title
                  : (isAdd ? 'Add $title' : 'Edit $title'),
              style: AppTextStyles.text24w700,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        sizedBoxWithWidth(24),
      ],
    );
  }
}
