import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';

class ChatBotMessageMTile extends StatefulWidget {
  final String? message;
  final bool isUserMessgae;
  final bool isLatestMessage;
  final bool isFetching;
  const ChatBotMessageMTile({
    super.key,
    this.message,
    this.isUserMessgae = false,
    this.isLatestMessage = false,
    this.isFetching = false,
  });

  @override
  State<ChatBotMessageMTile> createState() => _ChatBotMessageMTileState();
}

class _ChatBotMessageMTileState extends State<ChatBotMessageMTile> {
  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
    //   Timer(const Duration(seconds: 1), () {
    //     if (widget.data.isDelivered.not) {
    //       widget.isDelivered();
    //     }
    //   });
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: widget.isUserMessgae.not
          ? Alignment.centerLeft
          : Alignment.bottomRight,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.novaViolet.withOpacity(0.1),
          borderRadius: BorderRadius.only(
            topLeft: widget.isUserMessgae.not.not
                ? Radius.circular(8.r)
                : Radius.zero,
            topRight:
                widget.isUserMessgae.not ? Radius.circular(8.r) : Radius.zero,
            bottomRight: Radius.circular(8.r),
            bottomLeft: Radius.circular(8.r),
          ),
          border: Border.all(
              color: ThemeHandler.mutedColor(nonInverse: false), width: 0.5),
        ),
        margin: widget.isUserMessgae.not
            ? EdgeInsets.only(right: 48.w)
            : EdgeInsets.only(left: 48.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: widget.isFetching
            ? AnimatedTextKit(
                key: Key(widget.message ?? 'FETCH'),
                animatedTexts: [
                  FadeAnimatedText('.', textStyle: AppTextStyles.text28w600),
                  FadeAnimatedText('..', textStyle: AppTextStyles.text28w600),
                  FadeAnimatedText('...', textStyle: AppTextStyles.text28w600),
                ],
              )
            : ((widget.isUserMessgae.not && widget.isLatestMessage)
                ? AnimatedTextKit(
                    key: Key(widget.message ?? 'MSG'),
                    isRepeatingAnimation: false,
                    repeatForever: false,
                    displayFullTextOnTap: true,
                    totalRepeatCount: 0,
                    animatedTexts: [
                      TyperAnimatedText(
                        widget.message ?? '',
                        textStyle: AppTextStyles.text14w400,
                      ),
                    ],
                  )
                : Text(
                    widget.message ?? '',
                    style: AppTextStyles.text14w400,
                  )),
      ),
    );
  }
}
