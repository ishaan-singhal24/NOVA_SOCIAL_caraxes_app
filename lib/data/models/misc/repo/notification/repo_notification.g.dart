// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RepoNotification _$$_RepoNotificationFromJson(Map json) =>
    _$_RepoNotification(
      id: json['id'] as String?,
      to: json['to'] == null
          ? null
          : UserMinimum.fromJson(Map<String, dynamic>.from(json['to'] as Map)),
      from: json['from'] == null
          ? null
          : UserMinimum.fromJson(
              Map<String, dynamic>.from(json['from'] as Map)),
      title: json['title'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      isRead: json['isRead'] as bool?,
      type: $enumDecodeNullable(_$NotificationTypeEnumMap, json['type']),
      users: (json['users'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as bool),
      ),
      reference: json['reference'] == null
          ? null
          : RepoNotificationReference.fromJson(
              Map<String, dynamic>.from(json['reference'] as Map)),
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_RepoNotificationToJson(_$_RepoNotification instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('to', instance.to?.toJson());
  writeNotNull('from', instance.from?.toJson());
  writeNotNull('title', instance.title);
  writeNotNull('description', instance.description);
  writeNotNull('image', instance.image);
  writeNotNull('isRead', instance.isRead);
  writeNotNull('type', _$NotificationTypeEnumMap[instance.type]);
  writeNotNull('users', instance.users);
  writeNotNull('reference', instance.reference?.toJson());
  writeNotNull(
      'createdAt', const TimestampConverter().toJson(instance.createdAt));
  return val;
}

const _$NotificationTypeEnumMap = {
  NotificationType.comment: 'comment',
  NotificationType.replyToComment: 'replyToComment',
  NotificationType.reaction: 'reaction',
  NotificationType.share: 'share',
  NotificationType.connectionRequest: 'connectionRequest',
  NotificationType.viewedProfile: 'viewedProfile',
};
