import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/utils/utils.dart';

class OnboardingTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final Function(String? value)? onChanged;
  final String? Function(String? value)? validator;
  final String? hintText;
  final Icon? icon;
  const OnboardingTextField({
    Key? key,
    this.hintText,
    this.icon,
    this.validator,
    required this.textEditingController,
    this.onChanged,
  }) : super(key: key);

  @override
  State<OnboardingTextField> createState() => _OnboardingTextFieldState();
}

class _OnboardingTextFieldState extends State<OnboardingTextField> {
  final FocusNode _textFieldFocus = FocusNode();
  Color _color = ThemeHandler.mutedPlusColor(nonInverse: false);

  @override
  void initState() {
    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        setState(() {
          _color = ThemeHandler.mutedColor(nonInverse: false);
        });
      } else {
        setState(() {
          _color = ThemeHandler.mutedPlusColor(nonInverse: false);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _textFieldFocus,
      controller: widget.textEditingController,
      style: AppTextStyles.text14w500.darkModeSupport,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
        filled: true,
        fillColor: _color,
        hoverColor: ThemeHandler.mutedPlusColor(nonInverse: false),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        hintText: widget.hintText ?? '',
        hintStyle: AppTextStyles.text14w400.mutedPlus,
        prefixIcon: widget.icon,
        prefixIconColor: widget.textEditingController.text.isNotEmpty
            ? AppColors.novaBlack
            : AppColors.novaLightMuted,
      ),
      onChanged: widget.onChanged,
      validator: widget.validator,
    );
  }
}
