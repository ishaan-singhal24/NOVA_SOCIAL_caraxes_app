import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/notifiers/notifiers.dart';
import 'package:nova_social/repository/repository.dart';
import 'package:nova_social/utils/utils.dart';

class NotificationNotifier with ChangeNotifier {
  late NotificationRepository _notificationRepo;
  late ProfileNotifier _profileNotifier;

  @JsonKey(includeFromJson: false, includeToJson: false)
  List<QueryDocumentSnapshot>? notificationsDocs;
  List<RepoNotification>? notifications;

  StreamSubscription? _notificationsStream;

  static NotificationNotifier initialize(NotificationRepository repo) {
    late NotificationNotifier instance;
    try {
      instance = NotificationNotifier();
    } catch (e) {
      Logger.logError('Initialization failed NotificationNotifier', e);
      instance = NotificationNotifier();
    }
    instance._notificationRepo = repo;
    return instance;
  }

  update(ProfileNotifier prof) {
    _profileNotifier = prof;
    notifyListeners();
  }

  Future<void> createNotification(RepoNotification noti) async {
    final res = await _notificationRepo.createNotification(noti);
    if (res.isSuccess) {}
  }

  Future<void> deleteNotification(RepoNotification noti) async {
    final res = await _notificationRepo.deleteNotification(noti);
    if (res.isSuccess) {}
  }

  Future<void> updateNotification(RepoNotification noti) async {
    final res = await _notificationRepo.updateNotification(noti);
    if (res.isSuccess) {}
  }

  void fetchNotifications() async {
    _notificationsStream = _notificationRepo
        .fetchNotifications(
      _profileNotifier.userProfile?.id ?? _profileNotifier.user?.uid ?? '',
      documentSnapshot:
          (notificationsDocs?.isEmpty ?? true) ? null : notificationsDocs?.last,
    )
        .listen((event) {
      notifications = event;
      notifications = notifications?.where((element) {
        return ((_profileNotifier
                    .userProfile?.blocked?.from?[element.from?.id] !=
                true) &&
            (_profileNotifier.userProfile?.blocked?.to?[element.from?.id] !=
                true));
      }).toList();
      notifyListeners();
    });
  }

  void cancelNotifications() {
    _notificationsStream?.cancel();
  }
}
