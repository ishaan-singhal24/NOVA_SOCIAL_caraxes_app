import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';

class SuggestionInputModel {
  final Color? iconColor;
  final String? iconUrl;
  final String? id;
  final String? name;
  const SuggestionInputModel({
    this.id,
    this.name,
    this.iconUrl,
    this.iconColor,
  });
}

class AppMaterialAutofillInputField extends StatefulWidget {
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
  final Function(DateTime?)? dateTimeCallBack;
  final List<DateTime>? firstLastDate;
  final bool? isSpecialCharInvalid;
  final TextInputAction? textInputAction;

  final List<SuggestionInputModel>? suggestions;
  final Function(SuggestionInputModel)? onSuggestionSelected;

  const AppMaterialAutofillInputField({
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
    this.firstLastDate,
    this.isSpecialCharInvalid,
    this.textInputAction,
    this.suggestions,
    this.onSuggestionSelected,
  });

  @override
  State<AppMaterialAutofillInputField> createState() =>
      _AppMaterialAutofillInputFieldState();
}

class _AppMaterialAutofillInputFieldState
    extends State<AppMaterialAutofillInputField> {
  final FocusNode _focusNode = FocusNode();
  Color _fillColor = AppColors.novaViolet.withOpacity(0.1);

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _fillColor = ThemeHandler.backgroundColor();
        });
      } else {
        setState(() {
          _fillColor = AppColors.novaViolet.withOpacity(0.1);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TypeAheadFormField<SuggestionInputModel>(
      direction: AxisDirection.up,
      hideSuggestionsOnKeyboardHide: true,
      suggestionsBoxDecoration: SuggestionsBoxDecoration(
        color: ThemeHandler.mutedColor(nonInverse: true),
      ),
      textFieldConfiguration: TextFieldConfiguration(
        focusNode: _focusNode,
        controller: widget.controller,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        maxLength: widget.maxLength,
        textInputAction: widget.textInputAction,
        style: widget.inputStyle ?? AppTextStyles.text14w400,
        keyboardType: widget.maxLines != null
            ? TextInputType.multiline
            : TextInputType.text,
        decoration: InputDecoration(
          filled: true,
          fillColor: _fillColor,
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.novaDarkIndigo,
            ),
            borderRadius: BorderRadius.circular(8.r),
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
        ),
        onChanged: widget.onChanged,
      ),
      suggestionsCallback: (pattern) {
        final recommendation = widget.suggestions?.where((suggestion) =>
            (suggestion.name?.toLowerCase() ?? '')
                .contains(pattern.toLowerCase()));
        return recommendation?.toList() ?? [];
      },
      itemBuilder: (context, suggestion) {
        return ListTile(
          tileColor: ThemeHandler.mutedColor(nonInverse: false),
          leading: (suggestion.iconUrl?.isNotEmpty ?? false)
              ? Image.network(
                  suggestion.iconUrl ?? '',
                  height: 16.h,
                  color: suggestion.iconColor,
                )
              : null,
          title: Text(
            suggestion.name.toString(),
            style: AppTextStyles.text14w400,
          ),
        );
      },
      transitionBuilder: (context, suggestionsBox, controller) {
        return suggestionsBox;
      },
      onSuggestionSelected: (suggestion) {
        widget.controller.text = suggestion.name.toString();
        widget.onSuggestionSelected!(suggestion);
      },
      validator: (value) {
        if (widget.isRequired && (value?.isEmpty ?? true)) {
          return 'Please add ${widget.label}';
        }
        return null;
      },
      noItemsFoundBuilder: (context) => const SizedBox(),
      onSaved: (value) {
        // this._selectedCity = value;
      },
    );
  }
}
