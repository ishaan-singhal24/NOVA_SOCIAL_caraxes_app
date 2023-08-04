import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/common/common.dart';

class AppChip extends StatefulWidget {
  final String text;
  final Color? color;
  final AppChipType type;
  final Widget? prefix;
  final Color? prefixColor;
  final Widget? leading;
  final AppChipTextColor textColor;
  final Function()? onTap;
  final bool hasPrefixSpacing;
  const AppChip({
    Key? key,
    required this.text,
    this.color,
    this.type = AppChipType.filled,
    this.prefix,
    this.leading,
    this.hasPrefixSpacing = true,
    this.textColor = AppChipTextColor.themeSupportColor,
    this.onTap,
    this.prefixColor,
  }) : super(key: key);

  @override
  State<AppChip> createState() => _AppChipState();
}

class _AppChipState extends State<AppChip> {
  TextStyle appChipTextStyle() {
    TextStyle textStyle = AppTextStyles.text14w600;
    switch (widget.textColor) {
      case AppChipTextColor.themeSupportColor:
        textStyle = textStyle.darkModeSupport;
        break;
      case AppChipTextColor.backgroundSupportColor:
        (widget.color ?? AppColors.novaGreenAccent).computeLuminance() > 0.5
            ? AppTextStyles.text14w600.black
            : AppTextStyles.text14w600.white;
        break;
      case AppChipTextColor.outlineColor:
        textStyle = textStyle.copyWith(color: widget.color);
        break;
      default:
    }
    if (isHover) {
      textStyle = textStyle.copyWith(color: widget.prefixColor);
    }
    return textStyle;
  }

  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24.r),
      ),
      onHover: (hover) {
        isHover = hover;
        setState(() {});
      },
      hoverColor: AppColors.novaDarkPurple,
      onTap: widget.onTap,
      child: FittedBox(
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 8.h,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isHover
                ? ThemeHandler.mutedColor(nonInverse: false)
                : widget.type == AppChipType.filled
                    ? (widget.color ?? AppColors.novaGreenAccent)
                    : null,
            borderRadius: BorderRadius.circular(24.r),
            border: widget.type == AppChipType.outlined
                ? Border.all(
                    color: isHover
                        ? ThemeHandler.mutedColor(nonInverse: false)
                        : widget.color ?? AppColors.novaGreenAccent,
                    width: 0.5,
                  )
                : null,
          ),
          child: Row(
            children: [
              if (widget.prefix != null) ...{
                widget.prefix!,
                if (widget.hasPrefixSpacing) ...{
                  sizedBoxWithWidth(8),
                },
              },
              Text(
                widget.text,
                style: appChipTextStyle(),
              ),
              if (widget.leading != null) ...{
                sizedBoxWithWidth(8),
                widget.leading!,
              },
            ],
          ),
        ),
      ),
    );
  }
}
