import 'dart:convert';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;
import 'package:nova_social/data/enums/notification_enums.dart';
import 'package:nova_social/data/models/misc/misc.dart';
import 'package:nova_social/routes/mobile/feed_routes/feed_mroutes.dart';
import 'package:nova_social/routes/mobile/mobile_router.dart';
import 'package:nova_social/utils/app_environment.dart';
import 'package:nova_social/utils/logger.dart';
import 'package:path_provider/path_provider.dart';

class CommonUtils {
  CommonUtils._();

  static Future<String> downloadAndSaveFile(String url) async {
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/${DateTime.now()}';
    final response = await http.get(Uri.parse(url));
    final file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);
    return filePath;
  }

  ///Set up the deep link path and move to that particular path [must]
  /// call [_setDeepLinkArgs] before this if there is some data you need
  /// from notification
  // static void setDeepLink(String route) {
  //   Logger.logMsg('Utils', 'setting deep link path : $route');
  //   AppEnvironment.deepLinkPath.value = route;
  // }

  ///Set up the deep args [if any]
  static void setDeepLinkArgs(Map data) {
    ///..
    var path = '';
    if (data.containsKey('\$deeplink_path')) {
      path = data['\$deeplink_path'].toString();
    } else if (data.containsKey('type')) {
      path = data['type'].toString();
    }

    switch (path) {
      /// [EXAMPLE] code for future understanding
      //// case Routes.transactionCategoryDetail:
      //  // AppEnvironment.deepLinkArgs.value =
      //      // CategoryDetailArguments(categoryName: data['category'] as String);
      //  // debugPrint('setting deep link args for $type: ${data['category']}');
      //  // break;
      // //case Routes.wealthPotRequest:
      //  // AppEnvironment.deepLinkArgs.value = data['potId'] as String;
      //  // debugPrint('setting deep link args for $type: ${data['potId']}');
      //  // break;
      default:
    }

    ///..
    var tempMap = json.decode(data['body']);
    tempMap['createdAt'] = Timestamp(
        tempMap['createdAt']['_seconds'], tempMap['createdAt']['_nanoseconds']);
    // print(json.decode(data['body']['createdAt']));

    RepoNotification repoNotification = RepoNotification.fromJson(tempMap);

    if (repoNotification.reference == null) {
      return;
    }

    AppEnvironment.deepLinkArgs.value = repoNotification.reference?.id;

    switch (repoNotification.reference!.type) {
      case NotificationReferenceType.post:
        AppEnvironment.deepLinkPath.value = FeedMRouter.feedDetailedViewRoute;
        break;
      case NotificationReferenceType.collection:
        break;
      case NotificationReferenceType.connectionAccept:
        AppEnvironment.deepLinkPath.value = MobileRouter.notificationRoute;
        break;
      case NotificationReferenceType.connectionSent:
        AppEnvironment.deepLinkPath.value = MobileRouter.notificationRoute;
        break;
      default:
    }
  }
}
