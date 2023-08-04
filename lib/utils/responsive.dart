import 'package:flutter/material.dart';
import 'package:nova_social/utils/app_environment.dart';

class ResponsiveWidget extends StatelessWidget {
  const ResponsiveWidget({
    Key? key,
    required this.largeScreen,
    this.mediumScreen,
    this.smallScreen,
  }) : super(key: key);

  final Widget largeScreen;
  final Widget? mediumScreen;
  final Widget? smallScreen;

  static bool isSmallScreen() =>
      MediaQuery.of(AppEnvironment.ctx).size.width < 800;

  static bool isLargeScreen() {
    return MediaQuery.of(AppEnvironment.ctx).size.width > 1200;
  }

  static bool isMediumScreen() {
    return MediaQuery.of(AppEnvironment.ctx).size.width >= 800 &&
        MediaQuery.of(AppEnvironment.ctx).size.width <= 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 1200) {
          return largeScreen;
        } else if (constraints.maxWidth <= 1200 &&
            constraints.maxWidth >= 800) {
          return mediumScreen ?? largeScreen;
        } else {
          return smallScreen ?? largeScreen;
        }
      },
    );
  }
}
