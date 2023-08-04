import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';

class ChatBottomMessageBox extends StatefulWidget {
  const ChatBottomMessageBox({Key? key}) : super(key: key);

  @override
  State<ChatBottomMessageBox> createState() => _ChatBottomMessageBoxState();
}

class _ChatBottomMessageBoxState extends State<ChatBottomMessageBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 24.w,
        vertical: 8.h,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.novaWhite,
            blurRadius: 2.r,
            spreadRadius: 4.r,
            offset: Offset(0.0, 2.h),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: const TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Type your message...',
              ),
            ),
          ),
          sizedBoxWithWidth(16),
          Container(
            decoration: BoxDecoration(
              color: AppColors.novaIndigo,
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.novaIndigo),
            ),
            padding: EdgeInsets.all(6.r),
            child: Icon(
              Iconsax.send_2,
              color: AppColors.novaWhite,
            ),
          ),
        ],
      ),
    );
  }
}
