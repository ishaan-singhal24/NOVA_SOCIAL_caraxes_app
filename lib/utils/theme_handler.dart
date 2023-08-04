import 'package:flutter/material.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/utils/app_environment.dart';

class ThemeHandler {
  static Color backgroundColor() {
    if (AppEnvironment.isDark) {
      return AppColors.darkBackground;
    }
    return AppColors.lightBackground;
  }

  static Color widgetColor({bool? nonInverse = true}) {
    if (AppEnvironment.isDark && nonInverse!) {
      return AppColors.novaWhite;
    }
    return AppColors.novaBlack;
  }

  static Color mutedColor({bool? nonInverse = true}) {
    if (AppEnvironment.isDark && nonInverse!) {
      return AppColors.novaLightMuted;
    }
    return AppColors.novaDarkMuted;
  }

  static Color mutedPlusColor({bool? nonInverse = true}) {
    if (AppEnvironment.isDark && nonInverse!) {
      return AppColors.novaLightMutedPlus;
    }
    return AppColors.novaDarkMutedPlus;
  }

  static Color novaMutedColor() {
    if (AppEnvironment.isDark) {
      return AppColors.novaMuted;
    }
    return AppColors.novaMuted;
  }
}
