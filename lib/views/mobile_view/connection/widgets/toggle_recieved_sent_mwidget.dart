import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';

class ToggleRecievedSentMWidget extends StatelessWidget {
  final Function(int) selectToggle;
  final int selectedToggle;
  const ToggleRecievedSentMWidget({
    super.key,
    required this.selectToggle,
    required this.selectedToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              selectToggle(0);
            },
            child: SizedBox(
              width: double.maxFinite,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: selectedToggle == 0
                          ? AppColors.novaDarkIndigo
                          : ThemeHandler.backgroundColor(),
                    ),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Recieved',
                      style: selectedToggle == 0
                          ? AppTextStyles.text16w800
                          : AppTextStyles.text16w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        sizedBoxWithWidth(8),
        Expanded(
          child: GestureDetector(
            onTap: () {
              selectToggle(1);
            },
            child: SizedBox(
              width: double.maxFinite,
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: selectedToggle == 1
                          ? AppColors.novaDarkIndigo
                          : ThemeHandler.backgroundColor(),
                    ),
                  ),
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Sent',
                      style: selectedToggle == 1
                          ? AppTextStyles.text16w800
                          : AppTextStyles.text16w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
