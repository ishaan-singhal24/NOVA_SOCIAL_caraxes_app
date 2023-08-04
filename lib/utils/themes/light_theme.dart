part of 'themes.dart';

class _LightTheme {
  static ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    textTheme: GoogleFonts.interTextTheme(),
  ).copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS:
            CupertinoPageTransitionsBuilderCustomBackGestureWidth(),
      },
    ),
    // toggleableActiveColor: AppColors.novaYellow,
    appBarTheme: AppBarTheme(color: AppColors.lightBackground),
    scaffoldBackgroundColor: AppColors.lightBackground,
    focusColor: AppColors.novaYellow,
    hoverColor: AppColors.novaSkyBlue,
    disabledColor: Colors.black38,
    primaryColorLight: AppColors.lightBackground,
    scrollbarTheme: ScrollbarThemeData(
      thumbColor: MaterialStateProperty.all(AppColors.novaIndigo),
    ),
    colorScheme: const ColorScheme.light().copyWith(
      background: AppColors.lightBackground,
      error: AppColors.novaMellon,
      primary: AppColors.novaIndigo,
      secondary: AppColors.novaSkyBlue,
    ),
  );
}
