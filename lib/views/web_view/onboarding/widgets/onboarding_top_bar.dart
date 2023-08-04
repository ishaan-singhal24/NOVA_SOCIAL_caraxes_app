import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/utils/utils.dart';

class OnboardingTopBar extends StatelessWidget {
  final String head;
  final String subHead;
  const OnboardingTopBar({
    Key? key,
    required this.head,
    required this.subHead,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          head,
          style: AppTextStyles.text22w800,
          textAlign: TextAlign.center,
        ),
        sizedBoxWithHeight(16),
        Text(
          subHead,
          style: AppTextStyles.text14w400,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
