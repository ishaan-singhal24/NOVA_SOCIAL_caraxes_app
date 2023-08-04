import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';

class ProfileShowAllAppBarMWidget extends StatelessWidget {
  final String title;
  final Function() add;
  final bool? isCurrentUser;
  const ProfileShowAllAppBarMWidget({
    super.key,
    required this.title,
    required this.add,
    this.isCurrentUser = false,
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
              title,
              style: AppTextStyles.text24w700,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        if (isCurrentUser ?? false) ...{
          GestureDetector(
            onTap: add,
            child: Icon(
              Icons.add,
              size: 24.r,
              color: ThemeHandler.widgetColor(),
            ),
          ),
        },
      ],
    );
  }
}
