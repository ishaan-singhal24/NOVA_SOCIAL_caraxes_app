import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/utils/common_utils.dart';
import 'package:nova_social/utils/utils.dart';

class FirebaseNotificationService {
  FirebaseNotificationService() {
    _init();
  }

  Future<void> _init() async {
    await AppEnvironment.firebaseMessaging.setAutoInitEnabled(true);
    final token = await AppEnvironment.firebaseMessaging.getToken();
    print(token);
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    _listenFcm();
    await _handleInitialNotificationClick();
    final isInitialized = await _initializeLocalNotification();
    if (isInitialized ?? false) {
      _handleLocalNotificationClick();
    }
  }

  ///Listen for fcm notification
  void _listenFcm() {
    FirebaseMessaging.onMessage.listen(
      (message) => _firebaseMessagingBackgroundHandler(
        message,
        isForeground: true,
      ),
    );
  }

  ///[Initializing] local notification and setting up basic config for local notification to build
  Future<bool?> _initializeLocalNotification() {
    return AppEnvironment.flutterLocalNotificationsPlugin.initialize(
      const InitializationSettings(
        android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        iOS: DarwinInitializationSettings(),
      ),

      ///Handles the local notification click when app is not in memory

      onDidReceiveNotificationResponse: (notiResponse) {
        _performLocalNotificationAction(notiResponse);
      },
    );
  }

  ///Handles the local notification click when app is in background or foreground
  void _handleLocalNotificationClick() async {
    await AppEnvironment.flutterLocalNotificationsPlugin
        .getNotificationAppLaunchDetails()
        .then((value) {
      if (value?.didNotificationLaunchApp ?? false) {
        _performLocalNotificationAction(value?.notificationResponse);
      }
    });
  }

  ///Performs the Notification action of local notification
  void _performLocalNotificationAction(NotificationResponse? notiResponse) {
    if (notiResponse?.payload != null) {
      Logger.logMsg(this, notiResponse?.payload);
      final data =
          jsonDecode(notiResponse?.payload ?? '') as Map<String, dynamic>;
      notificationAction(RemoteMessage(data: data));
    }
  }

  ///Handle the initial message from fcm when app is [not in memory] and notification is clicked
  Future _handleInitialNotificationClick() async {
    return FirebaseMessaging.instance
        .getInitialMessage()
        .then((RemoteMessage? message) {
      if (message != null) {
        notificationAction(message);
      }
    });
  }

  ///Performs the notification action for fcm and local notification
  void notificationAction(RemoteMessage message) {
    try {
      final data = message.data;
      CommonUtils.setDeepLinkArgs(data);
      // CommonUtils.setDeepLink(data['type']?.toString() ?? '');
    } catch (e) {
      Logger.logError(this, e.toString());
    }
  }
}

Future<void> _firebaseMessagingBackgroundHandler(
  RemoteMessage message, {
  bool isForeground = false,
}) async {
  Logger.logMsg(
    '_firebaseMessagingBackgroundHandler',
    'fcm msg : ${message.toString()}',
  );

  // await Firebase.initializeApp();  already initialized in main.dart

  final notification = message.notification;

  final data = RepoFcmPayloadData.fromJson(message.data);

  if (data.pushFrom == 'moengage') {
    // MoengageService.init();
    // MoengageService().moe?.passFCMPushPayload(data);
    return;
  }

  Logger.logMsg(
    '_firebaseMessagingBackgroundHandler',
    'fcm msg : ${data.toString()}',
  );
  String? filePath;
  if (data.gcmImageUrl != null) {
    filePath = await CommonUtils.downloadAndSaveFile(
      data.gcmImageUrl!,
    );
  }

  AppEnvironment.flutterLocalNotificationsPlugin.show(
    notification.hashCode,
    notification?.title,
    notification?.body ?? data.body,
    NotificationDetails(
      android: AndroidNotificationDetails(
        AppEnvironment.channel.id,
        AppEnvironment.channel.name,
        channelDescription: AppEnvironment.channel.description,
        icon: '@mipmap/ic_launcher',
        subText: data.gcmSubtext,
        color: AppColors.novaIndigo,
        styleInformation: filePath != null
            ? BigPictureStyleInformation(
                FilePathAndroidBitmap(filePath),
                contentTitle: notification?.title ?? '',
                summaryText: notification?.body ?? data.body,
              )
            : BigTextStyleInformation(notification?.body ?? ''),
      ),
      iOS: DarwinNotificationDetails(
        subtitle: data.gcmSubtext,
      ),
    ),
    payload: jsonEncode(data),
  );
}
