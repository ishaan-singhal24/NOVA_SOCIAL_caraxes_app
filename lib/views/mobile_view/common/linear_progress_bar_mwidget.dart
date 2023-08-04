import 'dart:async';
import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';

class LinearProgressBarMWidget extends StatefulWidget {
  const LinearProgressBarMWidget({super.key});

  @override
  State<LinearProgressBarMWidget> createState() =>
      _LinearProgressBarMWidgetState();
}

class _LinearProgressBarMWidgetState extends State<LinearProgressBarMWidget> {
  double _progressValue = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    Timer.periodic(
        const Duration(
          seconds: 1,
        ), (timer) {
      setState(() {
        _progressValue += 1 / 12;
        if (_progressValue >= 1) {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: ScreenUtil.instance.screenWidth * 0.75,
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Center(
          child: LinearProgressIndicator(
            minHeight: 4.h,
            value: _progressValue,
            backgroundColor: AppColors.novaDarkIndigo.withOpacity(0.5),
            valueColor: AlwaysStoppedAnimation<Color>(
              AppColors.novaDarkIndigo,
            ),
          ),
        ),
      ),
    );
  }
}
