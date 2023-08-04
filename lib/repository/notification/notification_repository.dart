import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nova_social/data/constants/constants.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/utils/utils.dart';
import 'package:cloud_functions/cloud_functions.dart';

class NotificationRepository {
  final firestore = FirebaseFirestore.instance;
  final functions = FirebaseFunctions.instance;

  Future<Responser<bool?>> createNotification(
      RepoNotification notification) async {
    try {
      final DocumentReference documentRef =
          firestore.collection(AppKeyNames.notifications).doc();
      var users = notification.users;
      users ??= {};
      users[notification.from?.id ?? ''] = true;
      users[notification.to?.id ?? ''] = true;

      notification = notification.copyWith(
        users: users,
        id: documentRef.id,
        createdAt: DateTime.now(),
      );
      await documentRef.set(notification.toJson());
      // if (notification.type == NotificationType.connectionRequest) {
      //   await _sendPushNotification(notification);
      // }
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
      );
    } catch (e) {
      return ErrorHandler.error<bool>(e);
    }
  }

  Future<Responser<bool?>> deleteNotification(
      RepoNotification notification) async {
    try {
      await firestore
          .collection(AppKeyNames.notifications)
          .doc(notification.id)
          .delete();
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
      );
    } catch (e) {
      return ErrorHandler.error<bool>(e);
    }
  }

  Future<Responser<bool?>> updateNotification(
      RepoNotification notification) async {
    try {
      RepoNotification noti = notification;
      await firestore
          .collection(AppKeyNames.notifications)
          .doc(notification.id)
          .update(notification.toJson());
      return Responser(
        message: AppStrings.success,
        isSuccess: true,
      );
    } catch (e) {
      return ErrorHandler.error<bool>(e);
    }
  }

  Stream<List<RepoNotification>?> fetchNotifications(String userId,
      {DocumentSnapshot? documentSnapshot}) {
    return firestore
        .collection(AppKeyNames.notifications)
        .where(
          '${AppKeyNames.to}.${AppKeyNames.id}',
          isEqualTo: userId,
        )
        .orderBy(AppKeyNames.createdAt, descending: true)
        .snapshots()
        .map((event) => event.docs
            .map((e) => RepoNotification.fromJson(e.data()))
            .toList());
  }

  Future<void> _sendPushNotification(RepoNotification noti) async {
    final _funcSendPushNotificationRef =
        functions.httpsCallable(AppKeyNames.funcSendPushNotification);
    noti = noti.copyWith(createdAt: null);
    final req = noti.toJson();
    final res = await _funcSendPushNotificationRef.call(req);
    print(res);
  }
}
