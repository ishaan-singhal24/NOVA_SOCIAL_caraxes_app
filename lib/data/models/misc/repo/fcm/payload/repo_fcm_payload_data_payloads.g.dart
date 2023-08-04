// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_fcm_payload_data_payloads.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepoFcmPayloadDataPayloads _$RepoFcmPayloadDataPayloadsFromJson(Map json) =>
    RepoFcmPayloadDataPayloads(
      tag: json['tag'] as String?,
      body: json['body'] as String?,
      icon: json['icon'] as String?,
      badge: json['badge'] as String?,
      color: json['color'] as String?,
      sound: json['sound'] as String?,
      title: json['title'] as String?,
      bodyLocKey: json['bodyLocKey'] as String?,
      bodyLocArgs: json['bodyLocArgs'] as String?,
      clickAction: json['clickAction'] as String?,
      titleLocKey: json['titleLocKey'] as String?,
      titleLocArgs: json['titleLocArgs'] as String?,
    );

Map<String, dynamic> _$RepoFcmPayloadDataPayloadsToJson(
        RepoFcmPayloadDataPayloads instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'body': instance.body,
      'icon': instance.icon,
      'badge': instance.badge,
      'color': instance.color,
      'sound': instance.sound,
      'title': instance.title,
      'bodyLocKey': instance.bodyLocKey,
      'bodyLocArgs': instance.bodyLocArgs,
      'clickAction': instance.clickAction,
      'titleLocKey': instance.titleLocKey,
      'titleLocArgs': instance.titleLocArgs,
    };
