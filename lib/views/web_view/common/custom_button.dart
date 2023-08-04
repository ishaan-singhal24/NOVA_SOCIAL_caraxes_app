import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';

class CustomButton extends StatefulWidget {
  final String text;
  final Function() onPressed;
  final Color? color;
  final Color? hoverColor;
  final double? width;
  final double? height;
  final Color? hoverTextColor;
  final IconData? trailingIcon;
  const CustomButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.color,
    this.hoverColor,
    this.width,
    this.height,
    this.hoverTextColor,
    this.trailingIcon,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHover = false;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onHover: (value) {
          _isHover = value;
          setState(() {});
        },
        hoverColor:
            widget.hoverColor ?? (widget.color ?? AppColors.novaDarkIndigo),
        borderRadius: BorderRadius.circular(4.r),
        onTap: widget.onPressed,
        child: FittedBox(
          child: Container(
              width: widget.width,
              height: widget.height,
              padding: (widget.width == null && widget.height == null)
                  ? EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    )
                  : const EdgeInsets.all(0),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: _isHover
                    ? (widget.hoverColor ?? AppColors.novaDarkIndigo)
                    : widget.color ?? AppColors.novaIndigo,
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.text,
                    style: _isHover
                        ? AppTextStyles.text14w600.copyWith(
                            color: widget.hoverTextColor ?? AppColors.novaWhite)
                        : AppTextStyles.text14w600.white,
                  ),
                  if (widget.trailingIcon != null) ...{
                    sizedBoxWithWidth(8),
                    Icon(
                      widget.trailingIcon,
                      size: 14,
                      color: _isHover
                          ? widget.hoverTextColor ?? ThemeHandler.widgetColor()
                          : ThemeHandler.widgetColor(),
                    ),
                  },
                ],
              )),
        ),
      ),
    );
  }
}
