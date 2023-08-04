import 'dart:async';

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/onboarding/onboarding_steps/onboarding_steps.dart';

class ChatBotMessageMWidget extends StatefulWidget {
  final ChatBotConversationStepsMessageModal data;
  final Function() isDelivered;
  final bool isLatestMessage;
  const ChatBotMessageMWidget({
    super.key,
    required this.data,
    required this.isDelivered,
    this.isLatestMessage = false,
  });

  @override
  State<ChatBotMessageMWidget> createState() => _ChatBotMessageMWidgetState();
}

class _ChatBotMessageMWidgetState extends State<ChatBotMessageMWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Timer(const Duration(seconds: 1), () {
        if (widget.data.isDelivered.not) {
          widget.isDelivered();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.data.isMessageFromAi
          ? Alignment.centerLeft
          : Alignment.bottomRight,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.novaViolet.withOpacity(0.1),
          borderRadius: BorderRadius.only(
            topLeft: widget.data.isMessageFromAi.not
                ? Radius.circular(8.r)
                : Radius.zero,
            topRight: widget.data.isMessageFromAi
                ? Radius.circular(8.r)
                : Radius.zero,
            bottomRight: Radius.circular(8.r),
            bottomLeft: Radius.circular(8.r),
          ),
          border: Border.all(
              color: ThemeHandler.mutedColor(nonInverse: false), width: 0.5),
        ),
        margin: widget.data.isMessageFromAi
            ? EdgeInsets.only(right: 48.w)
            : EdgeInsets.only(left: 48.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: (widget.data.isMessageFromAi && widget.isLatestMessage)
            ? AnimatedTextKit(
                key: Key(widget.data.message),
                isRepeatingAnimation: false,
                repeatForever: false,
                displayFullTextOnTap: true,
                totalRepeatCount: 0,
                animatedTexts: [
                  TyperAnimatedText(
                    widget.data.message,
                    textStyle: AppTextStyles.text14w400,
                  ),
                ],
              )
            : Text(
                widget.data.message,
                style: AppTextStyles.text14w400,
              ),
      ),
    );
  }
}
