import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/app_colors.dart';

class AppDividerMwidget extends StatelessWidget {
  final double? thickness;
  const AppDividerMwidget({
    super.key,
    this.thickness,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
      thickness: thickness ?? 0.5,
      color: AppColors.novaWhite.withOpacity(0.15),
    );
  }
}
