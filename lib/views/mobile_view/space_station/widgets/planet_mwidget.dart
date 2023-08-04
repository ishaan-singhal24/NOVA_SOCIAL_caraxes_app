import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';

class PlanetMWidget extends StatelessWidget {
  final String imagePath;
  final String title;
  final TextStyle? titleStyle;
  const PlanetMWidget({
    super.key,
    required this.imagePath,
    required this.title,
    this.titleStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          imagePath,
          fit: BoxFit.fitHeight,
        ),
        Text(
          title,
          style: titleStyle ?? AppTextStyles.text14w400.cCClobberinTime,
        ),
      ],
    );
  }
}
