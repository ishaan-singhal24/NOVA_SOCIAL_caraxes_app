import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nova_social/data/constants/app_colors.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:cupertino_back_gesture/cupertino_back_gesture.dart';
import 'package:flutter/material.dart';

part 'dark_theme.dart';
part 'light_theme.dart';

ThemeData get themeData => AppEnvironment.isDark
    ? _DarkTheme.darkThemeData
    : _LightTheme.lightThemeData;
    // : _DarkTheme.darkThemeData;
