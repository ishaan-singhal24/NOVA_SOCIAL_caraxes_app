import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/routes/routes.dart';
import 'package:nova_social/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future<void> _initialize() async {
    var initStartTime = DateTime.now();

    /// calculate splash anim time
    var initEndTime = DateTime.now();
    var initTime = initEndTime.difference(initStartTime).inMilliseconds;
    var animTime = 3570 - initTime;
    animTime = animTime.isNegative ? 0 : animTime;
    await Future.delayed(Duration(milliseconds: animTime)).then((value) {
      context.go(NovaRouter.baseRoute);
    });
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance.init(context);
    return Scaffold(
      backgroundColor: ThemeHandler.backgroundColor(),
      body: Center(
        child: Text(
          "WELCOME",
          style: AppTextStyles.text32w900.darkModeSupport,
        ),
      ),
    );
  }
}
