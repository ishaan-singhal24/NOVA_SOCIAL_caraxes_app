import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/data/constants/app_text_styles.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/views/web_view/common/common.dart';
import 'package:nova_social/utils/utils.dart';

class AddEditDateFieldWidget extends StatefulWidget {
  final String columnHead;
  final String textFieldHintText;
  final TextEditingController textEditingController;
  final bool isRequiredField;
  final DateTime firstDate;
  final DateTime lastDate;
  final Function(DateTime?) callback;
  const AddEditDateFieldWidget({
    Key? key,
    required this.columnHead,
    required this.textFieldHintText,
    required this.textEditingController,
    required this.isRequiredField,
    required this.firstDate,
    required this.lastDate,
    required this.callback,
  }) : super(key: key);

  @override
  State<AddEditDateFieldWidget> createState() => _AddEditDateFieldWidgetState();
}

class _AddEditDateFieldWidgetState extends State<AddEditDateFieldWidget> {
  DateTime? selectedDate;
  final FocusNode _textFieldFocus = FocusNode();
  Color _color = ThemeHandler.mutedPlusColor(nonInverse: false);
  bool isValid = true;

  @override
  void initState() {
    _textFieldFocus.addListener(() {
      if (_textFieldFocus.hasFocus) {
        setState(() {
          _color = ThemeHandler.backgroundColor();
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.columnHead,
          style: AppTextStyles.text14w600,
        ),
        sizedBoxWithHeight(8),
        SizedBox(
          height: isValid ? null : 48.h,
          child: TextFormField(
            keyboardType: TextInputType.none,
            readOnly: true,
            controller: widget.textEditingController,
            onTap: () async {
              selectedDate = await showMonthYearPicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: widget.firstDate,
                lastDate: widget.lastDate,
              );
              widget.textEditingController.text =
                  selectedDate?.abrMMMyyyy ?? '';
              widget.textEditingController;
              widget.callback(selectedDate);
            },
            focusNode: _textFieldFocus,
            style: AppTextStyles.text14w600,
            textInputAction: TextInputAction.done,
            validator: (s) {
              if (widget.isRequiredField &&
                  widget.textEditingController.text.isEmpty) {
                return AppStrings.inputRequired;
              }
              return null;
            },
            decoration: InputDecoration(
              filled: true,
              fillColor: _color,
              hoverColor: ThemeHandler.mutedPlusColor(nonInverse: false),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16.w,
              ),
              suffixIcon: selectedDate == null
                  ? Icon(
                      Iconsax.arrow_down_1,
                      color: ThemeHandler.mutedPlusColor(nonInverse: false),
                    )
                  : null,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                  color: AppColors.novaIndigo,
                  width: 1,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              hintText: widget.textFieldHintText,
              hintStyle: AppTextStyles.text12w400.muted,
            ),
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
