import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';

abstract class BackgroundCornerOvalsMixinInterface {
  Widget buildBody();
}

mixin BackgroundCornerOvalsMixin<T extends StatefulWidget> on State<T>
    implements BackgroundCornerOvalsMixinInterface {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: SafeArea(
          child: Stack(
            children: [
              // Positioned(
              //   bottom: -180.r,
              //   left: -180.r,
              //   child: Container(
              //     width: 360.r,
              //     height: 360.r,
              //     decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       boxShadow: [
              //         BoxShadow(
              //           color: AppColors.novaPurple.withOpacity(0.2),
              //           blurRadius: 1600.r,
              //           spreadRadius: 4.r,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Positioned(
              //   top: -180.r,
              //   right: -180.r,
              //   child: Container(
              //     width: 360.r,
              //     height: 360.r,
              //     decoration: BoxDecoration(
              //       shape: BoxShape.circle,
              //       boxShadow: [
              //         BoxShadow(
              //           color: AppColors.novaPurple.withOpacity(0.2),
              //           blurRadius: 1600.r,
              //           spreadRadius: 4.r,
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              Positioned.fill(
                child: SingleChildScrollView(
                  child: buildBody(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
