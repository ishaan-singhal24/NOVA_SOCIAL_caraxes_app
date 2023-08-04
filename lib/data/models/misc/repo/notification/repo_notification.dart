import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/models/misc/converters/converters.dart';
import 'package:nova_social/data/models/misc/repo/notification/repo_notification_reference.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
import 'package:nova_social/data/enums/enums.dart';
part 'repo_notification.freezed.dart';
part 'repo_notification.g.dart';

@freezed
class RepoNotification with _$RepoNotification {
  @JsonSerializable(includeIfNull: false)
  const factory RepoNotification({
    String? id,
    UserMinimum? to,
    UserMinimum? from,
    String? title,
    String? description,
    String? image,
    bool? isRead,
    NotificationType? type,
    Map<String, bool>? users,
    RepoNotificationReference? reference,
    @TimestampConverter() DateTime? createdAt,
  }) = _RepoNotification;

  factory RepoNotification.fromJson(Map<String, dynamic> json) =>
      _$RepoNotificationFromJson(json);
}
