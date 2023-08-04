import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AppEnvironment {
  AppEnvironment._();
  static Flavor env = kReleaseMode ? Flavor.PROD : Flavor.DEV;
  static bool get isProd => env == Flavor.PROD && kReleaseMode;
  static final isMobile = Platform.isAndroid || Platform.isIOS;
  static String apiUrl = '';

  static User? user;

  static final appTheme = ValueNotifier(AppTheme.system);

  static final brightness = SchedulerBinding.instance.window.platformBrightness;

  static bool get isDark => true;
  // appTheme.value == AppTheme.system
  //     ? brightness == Brightness.dark
  //     : appTheme.value == AppTheme.dark;

  static final rootNavigationKey = GlobalKey<NavigatorState>();

  static NavigatorState get navigator => rootNavigationKey.currentState!;

  static final swipeWidth = ValueNotifier<double>(0.7);

  static final routeObserver = RouteObserver<ModalRoute>();

  static BuildContext get ctx => rootNavigationKey.currentContext!;

  static final deepLinkPath = ValueNotifier<String>('');
  static final ValueNotifier<Object?> deepLinkArgs = ValueNotifier(null);
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static final flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static const channel = AndroidNotificationChannel(
    'default_channel', // id
    'Default Notifications', // title
    description:
        'This channel is used for default notifications.', // description
    importance: Importance.high,
  );

  static String getApiURL({
    String? apiType,
  }) {
    switch (env) {
      case Flavor.DEV:
        apiUrl = ''; //Dev Backend URL
        switch (apiType) {
          case AppKeyNames.openjourneyApi:
            apiUrl = 'https://api-inference.huggingface.co';
            break;
          case AppKeyNames.prodiaStableDiffusionApi:
            apiUrl = 'https://api.prodia.com/v1';
            break;
          case AppKeyNames.stableDiffusionApi:
            apiUrl = 'https://stablediffusionapi.com/api/v3';
            break;
          case AppKeyNames.stabilityAiApi:
            apiUrl = 'https://api.stability.ai';
            break;
        }
        break;
      case Flavor.PROD:
        apiUrl = ''; //PROD Backend URL
        switch (apiType) {
          case AppKeyNames.openjourneyApi:
            apiUrl = 'https://api-inference.huggingface.co';
            break;
          case AppKeyNames.prodiaStableDiffusionApi:
            apiUrl = 'https://api.prodia.com/v1';
            break;
          case AppKeyNames.stableDiffusionApi:
            apiUrl = 'https://stablediffusionapi.com/api/v3';
            break;
        }
        break;
    }
    return apiUrl;
  }
}
