import 'package:nova_social/utils/app_environment.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static bool get isDark => AppEnvironment.isDark;

  static Color get darkBackground => const Color(0xff1E1E1E);
  static Color get lightBackground => const Color(0xffffffff);

  static Color get novaBlack => const Color(0xff000000);

  static Color get novaWhite => const Color(0xffffffff);
  static Color get novaLightMuted => const Color(0xffF3F3F3);
  static Color get novaLightMutedPlus => const Color(0xffDAD9DE);

  static Color get novaIndigo => const Color(0xff6770F8);
  static Color get novaDarkIndigo => const Color(0xff582BE8);

  static Color get novaYellow => const Color(0xffFFC200);
  static Color get novaMellon => const Color(0xffFF837B);
  static Color get novaSkyBlue => const Color(0xff017FE8);
  static Color get novaGreenAccent => const Color(0xff31BC61);
  static Color get novaDarkMuted => const Color(0xff343434);
  static Color get novaDarkMutedPlus => const Color(0xff292929);

  static Color get novaGrey => const Color.fromRGBO(255, 255, 255, 0.4);
  static Color get novaDarkGrey => const Color(0xff242424);

  static Color get novaLightPurple => const Color.fromRGBO(231, 141, 254, 1);
  static Color get novaDarkPurple => const Color.fromRGBO(98, 0, 123, 1);

  static Color get novaMuted => const Color.fromRGBO(255, 255, 255, 0.4);

  static Color get novaViolet => const Color(0xff6770F8);

  static Color get novaRed => const Color(0xffD22D2D);

  //Onboarding Tile Colors
  static Color get novaOrange => const Color.fromRGBO(255, 132, 92, 1);
  static Color get novaPurple => const Color.fromRGBO(137, 76, 255, 1);
  static Color get novaPink => const Color.fromRGBO(255, 83, 129, 1);
  static Color get novaLightGreen => const Color.fromRGBO(54, 197, 171, 1);
  static Color get novaDarkGreen => const Color.fromRGBO(0, 184, 92, 1);
  static Color get novaBlue => const Color.fromRGBO(51, 138, 255, 1);
  static Color get novaDarkYellow => const Color.fromRGBO(252, 154, 0, 1);
  static Color get novaPeach => const Color.fromRGBO(255, 116, 115, 1);
  static Color get novaBrilliantRose => const Color(0xfffc46b3);
  static Color get novaElectricVoilet => const Color(0xff5135ff);

  static Color get novaBrown => const Color(0xffff837B);
  static Color get novaMatPink => const Color(0xffff5381);
  static Color get novaMatGreen => const Color(0xff78DA9D);

  //Gradient
  static LinearGradient get novaBlueGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xff7bdaf1),
          Color(0xff4e8b9a),
        ],
      );
  static LinearGradient get novaIndigoGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xff767ef9),
          Color(0xff42489e),
        ],
      );
  static LinearGradient get novaYellowGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xffffd029),
          Color(0xff826a15),
        ],
      );
  static LinearGradient get novaGreenGradient => const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          Color(0xff78da9d),
          Color(0xff32784c),
        ],
      );

  static LinearGradient get novaRoseVoiletGlowGradient => LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          novaBrilliantRose,
          novaElectricVoilet,
        ],
      );
}
