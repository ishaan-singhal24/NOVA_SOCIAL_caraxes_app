import 'package:flutter/material.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';

class AppMaterialInputField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextStyle? inputStyle;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final int? maxLines;
  final int? maxLength;
  final bool isRequired;
  final bool? isLinkTypeInput;
  final Function(String? value)? onChanged;
  final Function(String? value)? onSubmit;
  final Function(DateTime?)? dateTimeCallBack;
  final List<DateTime>? firstLastDate;
  final bool? isSpecialCharInvalid;
  final TextInputAction? textInputAction;

  const AppMaterialInputField({
    super.key,
    this.label,
    this.hint,
    this.inputStyle,
    this.suffixIcon,
    required this.controller,
    this.maxLength,
    this.maxLines,
    this.isLinkTypeInput,
    required this.isRequired,
    this.onChanged,
    this.onSubmit,
    this.dateTimeCallBack,
    this.firstLastDate,
    this.isSpecialCharInvalid,
    this.textInputAction,
  });

  Future<void> _selectDateTime(BuildContext context) async {
    DateTime? selectedDate = await showMonthYearPicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: firstLastDate?.first ?? DateTime(1960),
      lastDate: firstLastDate?.last ?? DateTime(2040),
    );
    controller.text = selectedDate?.abrMMMyyyy ?? '';
    dateTimeCallBack!(selectedDate);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      maxLength: maxLength,
      textInputAction: textInputAction,
      style: inputStyle ?? AppTextStyles.text20w400,
      keyboardType: maxLines != null ? TextInputType.multiline : null,
      readOnly: dateTimeCallBack != null,
      decoration: InputDecoration(
        contentPadding: maxLines != null
            ? EdgeInsets.only(
                bottom: 4.h,
              )
            : null,
        labelText: '$label${isRequired ? '*' : ''}',
        counterStyle: AppTextStyles.text8w400.novaMuted,
        labelStyle: AppTextStyles.text20w400.novaMuted,
        floatingLabelStyle: AppTextStyles.text14w400.novaMuted,
        hintText: hint,
        hintStyle: AppTextStyles.text20w400.novaMuted,
        suffixIcon: suffixIcon,
        suffixIconColor: ThemeHandler.novaMutedColor(),
        // isDense: true,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: ThemeHandler.novaMutedColor(),
          ),
        ),
      ),
      onChanged: onChanged,
      onFieldSubmitted: onSubmit,
      onTap: () {
        if (dateTimeCallBack != null) {
          _selectDateTime(context);
        }
      },
      validator: (s) {
        if ((isSpecialCharInvalid ?? false) &&
            RegExp(r'^[a-zA-Z0-9_.]*$').hasMatch(s!).not) {
          return 'Only alphabets, numbers, underscore (/) and dot (.) are allowed';
        }
        if ((s?.isNotEmpty ?? false) && (isLinkTypeInput ?? false)) {
          if ((Uri.tryParse(s ?? '')?.isAbsolute ?? false)) return null;
          return AppStrings.enterValidLink;
        }
        if (isRequired && (s?.isEmpty ?? false)) {
          return AppStrings.inputRequired;
        }
        return null;
      },
    );
  }
}
