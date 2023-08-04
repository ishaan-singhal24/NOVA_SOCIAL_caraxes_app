import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/mobile_view/common/common.dart';

class AppStepper extends StatelessWidget {
  final int count;
  final int currIndex;
  const AppStepper({
    super.key,
    required this.count,
    this.currIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 12.h,
      width: double.maxFinite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ...List.generate(count, (_) => null).mapIndexed(
            (index, item) {
              return Center(
                child: Row(
                  children: [
                    if (index != 0) ...{
                      sizedBoxWithWidth(4),
                    },
                    Center(
                      child: CircleAvatar(
                        backgroundColor: currIndex >= index
                            ? AppColors.novaDarkIndigo
                            : ThemeHandler.mutedColor(nonInverse: false),
                        radius: 4.r,
                      ),
                    ),
                    if (index != (count - 1)) ...{
                      sizedBoxWithWidth(4),
                    },
                  ],
                ),
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}
