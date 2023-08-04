import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:provider/provider.dart';

class ProfileSubHeadTile extends StatelessWidget {
  const ProfileSubHeadTile({
    Key? key,
    this.iconUrl,
    this.headText,
    this.buttonText,
    this.onButtonPress,
  }) : super(key: key);

  final String? iconUrl;
  final String? headText;
  final String? buttonText;
  final Function()? onButtonPress;

  @override
  Widget build(BuildContext context) {
    final isCurrentUser = Provider.of<ProfileNotifier>(context).isCurrentUser;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          headText ?? '',
          style: AppTextStyles.text22w500.darkModeSupport,
        ),
        if (isCurrentUser ?? false) ...{
          AppIconButton(
            icon: Icons.add,
            onTap: onButtonPress ?? () {},
          ),
        },
      ],
    );
  }
}
