import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_strings.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/utils/utils.dart';

class AddEditTextFieldWidget extends StatefulWidget {
  final String? columnHead;
  final String textFieldHintText;
  final bool? hasBorder;
  final TextEditingController textEditingController;
  final int? maxLines;
  final int? maxLength;
  final bool isRequiredField;
  final bool? isLinkTypeInput;
  final Function(String? value)? onChanged;
  const AddEditTextFieldWidget({
    Key? key,
    this.columnHead,
    required this.textFieldHintText,
    required this.textEditingController,
    this.maxLength,
    required this.isRequiredField,
    this.maxLines,
    this.onChanged,
    this.isLinkTypeInput,
    this.hasBorder = false,
  }) : super(key: key);

  @override
  State<AddEditTextFieldWidget> createState() => _AddEditTextFieldWidgetState();
}

class _AddEditTextFieldWidgetState extends State<AddEditTextFieldWidget> {
  final FocusNode _textFieldFocus = FocusNode();
  Color _color = ThemeHandler.mutedPlusColor(nonInverse: false);

  bool isValid = true;

  bool showHintText = true;

  @override
  void initState() {
    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        showHintText = false;
        setState(() {
          _color = ThemeHandler.backgroundColor();
        });
      } else {
        showHintText = true;
        setState(() {
          _color = ThemeHandler.mutedPlusColor(nonInverse: false);
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.columnHead != null) ...{
          Text(
            widget.columnHead!,
            style: AppTextStyles.text14w600,
          ),
          sizedBoxWithHeight(8),
        },
        Container(
          height: isValid
              ? (widget.maxLength ?? 0) > 1
                  ? null
                  : 48.h
              : null,
          margin: EdgeInsets.only(bottom: isValid ? 0.0 : 16.h),
          child: TextFormField(
            controller: widget.textEditingController,
            focusNode: _textFieldFocus,
            maxLines: widget.maxLines,
            maxLength: widget.maxLength,
            style: AppTextStyles.text14w600,
            keyboardType:
                widget.maxLines != null ? TextInputType.multiline : null,
            // textInputAction: TextInputAction.done,
            onChanged: widget.onChanged,
            validator: (s) {
              if ((s?.isNotEmpty ?? false) &&
                  (widget.isLinkTypeInput ?? false)) {
                if ((Uri.tryParse(s ?? '')?.isAbsolute ?? false)) return null;
                isValid = false;
                setState(() {});
                return AppStrings.enterValidLink;
              }
              if (widget.isRequiredField && (s?.isEmpty ?? false)) {
                isValid = false;
                setState(() {});
                return AppStrings.inputRequired;
              }
              isValid = true;
              setState(() {});
              return null;
            },
            decoration: InputDecoration(
              counterStyle: AppTextStyles.text10w400.muted,
              filled: true,
              fillColor: _color,
              hoverColor: ThemeHandler.mutedPlusColor(nonInverse: false),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: (widget.maxLength ?? 0) > 1 ? 16.h : 0,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppColors.novaIndigo,
                  width: 1,
                ),
              ),
              border: widget.hasBorder == null && widget.hasBorder!.not
                  ? null
                  : OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4),
                      borderSide: BorderSide(
                        color: AppColors.novaIndigo,
                        width: 1,
                      ),
                    ),
              hintText: showHintText ? widget.textFieldHintText : '',
              hintStyle: AppTextStyles.text14w400.muted,
            ),
          ),
        ),
      ],
    );
  }
}
