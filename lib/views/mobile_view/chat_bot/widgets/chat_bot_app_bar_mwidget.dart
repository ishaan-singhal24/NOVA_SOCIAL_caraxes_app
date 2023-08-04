import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';

class ChatBotAppBarMWidget extends StatelessWidget {
  const ChatBotAppBarMWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AppIconButton(
              icon: Icons.arrow_back_ios,
              onTap: () {
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                } else {
                  context.go(MobileRouter.baseRoute);
                }
              },
            ),
            sizedBoxWithWidth(8),
            AppAssetImageHandlerMWidget(
              imagePath: AppAssets.robin,
              errorText: 'R',
              width: 24.r,
              height: 24.r,
              radius: 12.r,
            ),
            sizedBoxWithWidth(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Robin',
                    style: AppTextStyles.text28w500,
                  ),
                  sizedBoxWithHeight(4),
                  Text(
                    "I'm with you, Batman!",
                    style: AppTextStyles.text14w400.muted,
                  ),
                ],
              ),
            )
          ],
        ),
        sizedBoxWithHeight(16),
        const AppDividerMwidget(),
      ],
    );
  }
}
