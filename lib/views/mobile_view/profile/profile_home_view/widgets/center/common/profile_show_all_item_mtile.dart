import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/utils/utils.dart';

class ProfileShowAllItemMTile extends StatelessWidget {
  const ProfileShowAllItemMTile({
    super.key,
    required this.itemCount,
    required this.itemName,
    this.open,
  });
  final int itemCount;
  final String itemName;
  final Function()? open;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: open,
          child: Text(
            'Show all $itemCount $itemName',
            style: AppTextStyles.text14w500.indigo,
          ),
        ),
      ],
    );
  }
}
