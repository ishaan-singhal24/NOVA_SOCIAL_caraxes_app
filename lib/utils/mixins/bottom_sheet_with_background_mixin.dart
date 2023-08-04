import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';

abstract class BottomSheetWithBackgroundMixinInterface {
  Widget buildBody();
}

mixin BottomSheetWithBackgroundMixin<T extends StatefulWidget> on State<T>
    implements BottomSheetWithBackgroundMixinInterface {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          height: ScreenUtil.instance.height * 0.9,
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: ThemeHandler.backgroundColor(),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8.r),
              topRight: Radius.circular(8.r),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                bottom: -180.r,
                left: -180.r,
                child: Container(
                  width: 360.r,
                  height: 360.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.novaPurple.withOpacity(0.2),
                        blurRadius: 1600.r,
                        spreadRadius: 4.r,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: -180.r,
                right: -180.r,
                child: Container(
                  width: 360.r,
                  height: 360.r,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.novaPurple.withOpacity(0.2),
                        blurRadius: 1600.r,
                        spreadRadius: 4.r,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                child: SingleChildScrollView(
                  child: buildBody(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
