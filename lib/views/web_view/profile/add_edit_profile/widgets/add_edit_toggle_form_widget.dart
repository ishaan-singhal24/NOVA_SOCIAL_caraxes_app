import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';

class AddEditToggleFormWidget extends StatelessWidget {
  final List items;
  final Function(int)? onTap;
  final int selected;
  final MainAxisAlignment? align;
  final double? fixWidth;
  final TextStyle? textStyle;
  final bool showDivider;
  const AddEditToggleFormWidget({
    super.key,
    required this.items,
    required this.selected,
    this.onTap,
    this.align,
    this.fixWidth,
    this.textStyle,
    this.showDivider = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: showDivider
            ? Border(
                bottom: BorderSide(
                  color: ThemeHandler.novaMutedColor(),
                  width: 0.5,
                ),
              )
            : null,
      ),
      child: Row(
        mainAxisAlignment: align ?? MainAxisAlignment.center,
        children: [
          ...items
              .mapIndexed(
                (int index, e) => InkWell(
                  onTap: onTap != null
                      ? () {
                          onTap!(index);
                        }
                      : null,
                  child: Container(
                    width: fixWidth,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 4.h,
                    ),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: index == selected
                            ? BorderSide(
                                color: AppColors.novaIndigo,
                                width: 2.r,
                              )
                            : BorderSide.none,
                      ),
                    ),
                    child: Text(
                      e.toString().firstCap,
                      style: textStyle ?? AppTextStyles.text20w600,
                    ),
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
