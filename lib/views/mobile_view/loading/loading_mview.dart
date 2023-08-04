import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';

class LoadingMView extends StatelessWidget {
  final Color? color;
  const LoadingMView({
    Key? key,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(
            color: color ?? AppColors.novaDarkIndigo,
          ),
        ),
      ),
    );
  }
}
