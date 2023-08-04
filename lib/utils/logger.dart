import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'app_environment.dart';

class Logger {
  static void logMsg(dynamic obj, dynamic msg) {
    if (AppEnvironment.env == ENV.prod && kReleaseMode) {
      return;
    }

    var className = obj.runtimeType.toString();
    className = className == 'String' ? obj as String : className;
    debugPrint('$className msg : $msg', wrapWidth: 2048);
  }

  static void logError(dynamic obj, dynamic msg,
      {StackTrace? stackTrace, bool isFatalError = false}) async {
    if (AppEnvironment.env == ENV.prod && kReleaseMode) {
      await FirebaseCrashlytics.instance.recordError(
        msg ?? '',
        stackTrace,
        reason: isFatalError ? 'a fatal error' : 'a non fatal error',
        fatal: isFatalError,
      );
      return;
    }

    var str = 'Error : ${msg?.toString()}';
    logMsg(obj, str);
  }
}
