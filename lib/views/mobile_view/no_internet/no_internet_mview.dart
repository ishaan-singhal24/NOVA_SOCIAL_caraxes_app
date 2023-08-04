import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/utils/utils.dart';

class NoInternetMView extends StatefulWidget {
  const NoInternetMView({super.key});

  @override
  State<NoInternetMView> createState() => _NoInternetMViewState();
}

class _NoInternetMViewState extends State<NoInternetMView> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance.init(context);
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'No Internet Connection',
                  style: AppTextStyles.text16w400,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
