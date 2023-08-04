part of 'themes.dart';

class _DarkTheme {
  // ignore: unused_field
  static ThemeData darkThemeData = ThemeData(
    brightness: Brightness.dark,
    fontFamily: 'Inter',
    textTheme: GoogleFonts.interTextTheme(),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColors.novaDarkIndigo,
      secondary: AppColors.novaIndigo,
    ),
    toggleableActiveColor: AppColors.novaYellow,
    appBarTheme: AppBarTheme(color: AppColors.darkBackground),
    scaffoldBackgroundColor: AppColors.darkBackground,
    errorColor: AppColors.novaMellon,
    focusColor: AppColors.novaYellow,
    hoverColor: AppColors.novaSkyBlue,
    disabledColor: Colors.white30,
    primaryColorLight: AppColors.darkBackground,
    backgroundColor: AppColors.darkBackground,
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(AppColors.novaIndigo),
    ),
  );
}
