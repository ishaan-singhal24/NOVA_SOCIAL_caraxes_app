import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';

class IntroductionStep extends StatelessWidget {
  final Function(int) onTap;
  const IntroductionStep({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Introducing your AI Friend',
                style: AppTextStyles.text24w500,
              ),
              sizedBoxWithHeight(4),
              Text(
                "Choose your AI assitance ",
                style: AppTextStyles.text14w400.mutedPlus,
              ),
            ],
          ),
          AppAssetImageHandlerMWidget(
            imagePath: AppAssets.robin,
            errorText: 'R',
            width: 200.r,
            radius: 100.r,
            boxColor: Colors.transparent,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  AppAssetImageHandlerMWidget(
                    imagePath: AppAssets.robin,
                    errorText: 'R',
                    height: 80.r,
                    radius: 12.r,
                    paddingEnabled: false,
                  ),
                  AppAssetImageHandlerMWidget(
                    imagePath: AppAssets.jarvis,
                    errorText: 'R',
                    height: 80.r,
                    radius: 8.r,
                    paddingEnabled: false,
                    boxColor: ThemeHandler.mutedColor(nonInverse: false),
                  ),
                  AppAssetImageHandlerMWidget(
                    imagePath: AppAssets.jarvis,
                    errorText: 'R',
                    height: 80.r,
                    radius: 8.r,
                    paddingEnabled: false,
                    boxColor: ThemeHandler.mutedColor(nonInverse: false),
                  ),
                ],
              ),
              sizedBoxWithHeight(24),
              CustomButton(
                text: 'Continue',
                onPressed: () {
                  onTap(1);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
