import 'package:flutter/cupertino.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/utils/app_environment.dart';

extension TextStyleExtension on TextStyle {
  TextStyle setOpacity(double opacity) {
    return copyWith(
      color: color!.withOpacity(opacity),
    );
  }

  TextStyle get white => copyWith(color: AppColors.novaWhite);

  TextStyle get black => copyWith(color: AppColors.novaBlack);

  TextStyle get darkPurple => copyWith(color: AppColors.novaDarkPurple);

  TextStyle get novaMellon => copyWith(color: AppColors.novaMellon);

  TextStyle get indigo => copyWith(color: AppColors.novaDarkIndigo);

  TextStyle get novaLightMuted => copyWith(color: AppColors.novaLightMuted);

  TextStyle get novaDarkMuted => copyWith(color: AppColors.novaDarkMuted);

  TextStyle get novaRed => copyWith(color: AppColors.novaRed);

  TextStyle get novaBrilliantRose =>
      copyWith(color: AppColors.novaBrilliantRose);

  TextStyle get novaRoseVioletGlowGradient => copyWith(
        foreground: Paint()
          ..shader = AppColors.novaRoseVoiletGlowGradient.createShader(
            const Rect.fromLTWH(
              100,
              25,
              200.0,
              50.0,
            ),
          ),
      );

  TextStyle get subHead => AppEnvironment.isDark
      ? copyWith(color: AppColors.novaGrey)
      : copyWith(color: AppColors.novaLightMuted);

  TextStyle get darkModeSupport => copyWith(
        color:
            AppEnvironment.isDark ? AppColors.novaWhite : AppColors.novaBlack,
      );

  TextStyle get muted => copyWith(
      color: AppEnvironment.isDark
          ? AppColors.novaLightMuted
          : AppColors.novaDarkMuted);

  TextStyle get mutedPlus => copyWith(
      color: AppEnvironment.isDark
          ? AppColors.novaLightMuted
          : AppColors.novaDarkMuted);

  TextStyle get novaMuted => copyWith(
        color:
            AppEnvironment.isDark ? AppColors.novaMuted : AppColors.novaMuted,
      );

  TextStyle get italic => copyWith(
        fontStyle: FontStyle.italic,
      );
  TextStyle get inverse => copyWith(
        color: _copyInverseColor(color),
      );

  TextStyle get cCClobberinTime => copyWith(
        fontFamily: 'CCClobberinTime',
      );

  Color? _copyInverseColor(Color? color) {
    if (color == AppColors.novaLightMuted) {
      return AppColors.novaDarkMuted;
    }
    if (color == AppColors.novaDarkMuted) {
      return AppColors.novaLightMuted;
    }
    if (color == AppColors.novaLightMutedPlus) {
      return AppColors.novaDarkMutedPlus;
    }
    if (color == AppColors.novaDarkMutedPlus) {
      return AppColors.novaLightMutedPlus;
    }
    if (color == AppColors.novaBlack) {
      return AppColors.novaWhite;
    }
    if (color == AppColors.novaWhite) {
      return AppColors.novaBlack;
    }
    return color;
  }
}
