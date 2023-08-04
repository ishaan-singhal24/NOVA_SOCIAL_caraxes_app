import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/app_calendar_mdialog.dart';

class AppMaterialInputField extends StatefulWidget {
  final String? label;
  final String? hint;
  final TextStyle? inputStyle;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final int? minLines;
  final int? maxLines;
  final int? maxLength;
  final bool isRequired;
  final bool? isLinkTypeInput;
  final Function(String? value)? onChanged;
  final Function(String? value)? onSubmit;
  final String? validateValueWith;
  final String? validateSocialWith;
  final Function(DateTime?)? dateTimeCallBack;
  final List<DateTime>? firstLastDate;
  final bool? isSpecialCharInvalid;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final bool? showBorder;
  final String? prefixText;
  final TextStyle? prefixTextStyle;
  final Color? focusFillColor;
  final Color? nonFocusFillColor;

  const AppMaterialInputField({
    super.key,
    this.label,
    this.hint,
    this.inputStyle,
    this.suffixIcon,
    required this.controller,
    this.maxLength,
    this.maxLines,
    this.minLines,
    this.isLinkTypeInput,
    required this.isRequired,
    this.onChanged,
    this.onSubmit,
    this.dateTimeCallBack,
    this.validateValueWith,
    this.validateSocialWith,
    this.firstLastDate,
    this.isSpecialCharInvalid,
    this.textInputAction,
    this.focusNode,
    this.showBorder,
    this.prefixText,
    this.prefixTextStyle,
    this.focusFillColor,
    this.nonFocusFillColor,
  });

  @override
  State<AppMaterialInputField> createState() => _AppMaterialInputFieldState();
}

class _AppMaterialInputFieldState extends State<AppMaterialInputField> {
  FocusNode _focusNode = FocusNode();
  Color _fillColor = AppColors.novaViolet.withOpacity(0.1);

  @override
  void initState() {
    super.initState();
    _fillColor =
        widget.nonFocusFillColor ?? AppColors.novaViolet.withOpacity(0.1);
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _fillColor = widget.focusFillColor ?? ThemeHandler.backgroundColor();
        });
      } else {
        setState(() {
          _fillColor =
              widget.nonFocusFillColor ?? AppColors.novaViolet.withOpacity(0.1);
        });
      }
    });
  }

  Future<void> _selectDateTime(BuildContext context) async {
    await showNovaAppCalendar(
      context: context,
      onSelected: (selectedDate) {
        widget.controller.text = selectedDate?.abrMMMyyyy ?? '';
        widget.dateTimeCallBack!(selectedDate);
        // context.pop();
      },
    );
    // DateTime? selectedDate = await showMonthYearPicker(
    //   context: context,
    //   initialDate: DateTime.now(),
    //   firstDate: widget.firstLastDate?.first ?? DateTime(1960),
    //   lastDate: widget.firstLastDate?.last ?? DateTime(2040),
    // );
    // widget.controller.text = selectedDate?.abrMMMyyyy ?? '';
    // widget.dateTimeCallBack!(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: widget.controller,
      minLines: widget.minLines,
      maxLines: widget.maxLines,
      maxLength: widget.maxLength,
      textInputAction: widget.textInputAction,
      textAlignVertical: TextAlignVertical.top,
      style: widget.inputStyle ?? AppTextStyles.text14w400,
      keyboardType: widget.maxLines != null ? TextInputType.multiline : null,
      readOnly: widget.dateTimeCallBack != null,
      decoration: InputDecoration(
        filled: true,
        fillColor: _fillColor,
        border: (widget.showBorder ?? false)
            ? OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.novaDarkIndigo,
                ),
                borderRadius: BorderRadius.circular(8.r),
              )
            : const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        labelText: (widget.label?.isEmpty ?? true)
            ? ''
            : '${widget.label}', // ${widget.isRequired ? '*' : ''}',
        counterStyle: AppTextStyles.text8w400.novaMuted,
        labelStyle: AppTextStyles.text14w400.novaMuted,
        alignLabelWithHint: true,
        floatingLabelStyle: AppTextStyles.text12w400,
        hintText: widget.hint,
        hintStyle: AppTextStyles.text14w400.novaMuted,
        suffixIcon: widget.suffixIcon,
        suffixIconColor: ThemeHandler.novaMutedColor(),
        isDense: true,
        prefixText: widget.prefixText,
        prefixStyle: widget.prefixTextStyle ?? AppTextStyles.text14w600,
      ),
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmit,
      onTap: () {
        if (widget.dateTimeCallBack != null) {
          _selectDateTime(context);
        }
      },
      validator: (s) {
        if ((widget.isSpecialCharInvalid ?? false) &&
            RegExp(r'^[a-zA-Z0-9_.]*$').hasMatch(s!).not) {
          return 'Only alphabets, numbers, underscore (/) and dot (.) are allowed';
        }
        if ((s?.isNotEmpty ?? false) && (widget.isLinkTypeInput ?? false)) {
          if ((Uri.tryParse(s ?? '')?.isAbsolute ?? false)) return null;
          return AppStrings.enterValidLink;
        }
        if (widget.isRequired && (s?.isEmpty ?? false)) {
          return AppStrings.inputRequired;
        }
        if ((widget.validateValueWith?.isNotEmpty ?? false) &&
            (widget.validateValueWith != s)) {
          return 'The input you provided doesn\'t match with the expected value';
        }

        if ((widget.validateSocialWith?.isNotEmpty ?? false) &&
            (s?.isNotEmpty ?? false) &&
            (s?.contains(widget.validateSocialWith ?? '') == false)) {
          return 'The input you provided is not a valid ${widget.validateSocialWith} link';
        }
        return null;
      },
    );
  }
}
