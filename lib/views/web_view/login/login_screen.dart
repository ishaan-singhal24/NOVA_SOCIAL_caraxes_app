import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/notifiers/auth/auth_notifier.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:nova_social/views/web_view/login/cards/login_card.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    // webViewXController = WebViewXController();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance.init(context);
    final bool kIsLargeScreen = !ResponsiveWidget.isSmallScreen();
    final deviceSize = MediaQuery.of(context).size;
    final authNoti = Provider.of<AuthNotifier>(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.novaBlack,
        body: authNoti.authStatus == InitEnum.initializing
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Positioned.fill(
                    child: Container(
                      width: double.maxFinite,
                      height: double.maxFinite,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            AppAssets.landingPage,
                          ),
                          colorFilter: ColorFilter.mode(
                            Colors.black.withOpacity(0.5),
                            BlendMode.dstATop,
                          ),
                        ),
                      ),
                    ),
                  ),
                  BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                    child: Center(
                      child: FittedBox(
                        child: Container(
                          constraints: BoxConstraints(
                            maxWidth: kIsLargeScreen ? 320.w : double.maxFinite,
                            // maxHeight: kIsLargeScreen
                            //     ? deviceSize.height * 0.55
                            //     : double.maxFinite,
                          ),
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(
                            horizontal: 8.w,
                            vertical: 16.h,
                          ),
                          decoration: BoxDecoration(
                            color: ThemeHandler.backgroundColor(),
                            boxShadow: [
                              BoxShadow(),
                            ],
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.w,
                              vertical: 16.h,
                            ),
                            child: LoginCard(),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
