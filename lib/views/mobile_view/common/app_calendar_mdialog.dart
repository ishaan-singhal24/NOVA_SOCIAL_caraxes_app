import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';

Future<void> showNovaAppCalendar({
  required BuildContext context,
  Function(DateTime? selectedDate)? onSelected,
  DateTime? initialDate,
}) async {
  await showDialog(
    context: context,
    builder: (_) => AppCalendarMDialog(
      onSelected: onSelected,
    ),
  );
}

class AppCalendarMDialog extends StatefulWidget {
  final Function(DateTime selectedDate)? onSelected;
  final DateTime? initialDate;
  const AppCalendarMDialog({
    super.key,
    this.onSelected,
    this.initialDate,
  });

  @override
  State<AppCalendarMDialog> createState() => _AppCalendarMDialogState();
}

class _AppCalendarMDialogState extends State<AppCalendarMDialog> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      child: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        backgroundColor: AppColors.novaIndigo.withOpacity(0.5),
        child: FittedBox(
          child: Container(
            width: ScreenUtil.instance.screenWidth * 0.9,
            padding: EdgeInsets.all(24.r),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: ThemeHandler.backgroundColor(),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Select Date Time',
                    style: AppTextStyles.text20w600,
                  ),
                ),
                sizedBoxWithHeight(24),
                SizedBox(
                  height: 280.h,
                  child: DatePickerWidget(
                    pickerTheme: DateTimePickerTheme(
                      backgroundColor: ThemeHandler.backgroundColor(),
                      showTitle: true,
                      itemTextStyle: AppTextStyles.text14w400,
                      confirmTextStyle: AppTextStyles.text14w400.indigo,
                      cancelTextStyle: AppTextStyles.text14w400.indigo,
                      // confirm: CustomButton(
                      //   text: 'Confirm',
                      //   onPressed: () {},
                      // ),
                    ),
                    dateFormat: 'yyyy MMM',
                    onConfirm: (dateTime, selectedIndex) {
                      if (widget.onSelected != null) {
                        widget.onSelected!(dateTime);
                      }
                    },
                    initialDateTime: widget.initialDate ?? DateTime.now(),
                    onChange: (dateTime, selectedIndex) {},
                    onCancel: () {},
                  ),
                ),
                sizedBoxWithHeight(24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
