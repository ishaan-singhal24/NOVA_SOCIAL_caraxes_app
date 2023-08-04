// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_notification_reference.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RepoNotificationReference _$$_RepoNotificationReferenceFromJson(Map json) =>
    _$_RepoNotificationReference(
      type:
          $enumDecodeNullable(_$NotificationReferenceTypeEnumMap, json['type']),
      id: json['id'] as String?,
      subIds:
          (json['subIds'] as List<dynamic>?)?.map((e) => e as String).toList(),
      subTypes: (json['subTypes'] as List<dynamic>?)
          ?.map((e) => $enumDecode(_$NotificationReferenceTypeEnumMap, e))
          .toList(),
    );

Map<String, dynamic> _$$_RepoNotificationReferenceToJson(
    _$_RepoNotificationReference instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$NotificationReferenceTypeEnumMap[instance.type]);
  writeNotNull('id', instance.id);
  writeNotNull('subIds', instance.subIds);
  writeNotNull(
      'subTypes',
      instance.subTypes
          ?.map((e) => _$NotificationReferenceTypeEnumMap[e]!)
          .toList());
  return val;
}

const _$NotificationReferenceTypeEnumMap = {
  NotificationReferenceType.collection: 'collection',
  NotificationReferenceType.post: 'post',
  NotificationReferenceType.aiArt: 'aiArt',
  NotificationReferenceType.connectionSent: 'connectionSent',
  NotificationReferenceType.connectionAccept: 'connectionAccept',
  NotificationReferenceType.comment: 'comment',
};
