// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_fcm_payload_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepoFcmPayloadData _$RepoFcmPayloadDataFromJson(Map json) => RepoFcmPayloadData(
      scheduleTime: (json['scheduleTime'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      payloads: (json['payloads'] as List<dynamic>?)
          ?.map((e) => RepoFcmPayloadDataPayloads.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList(),
      pushFrom: json['pushFrom'] as String?,
      gcmImageUrl: json['gcmImageUrl'] as String?,
      gcmSubtext: json['gcmSubtext'] as String?,
      body: json['body'] as String?,
    );

Map<String, dynamic> _$RepoFcmPayloadDataToJson(RepoFcmPayloadData instance) =>
    <String, dynamic>{
      'scheduleTime': instance.scheduleTime,
      'payloads': instance.payloads?.map((e) => e.toJson()).toList(),
      'pushFrom': instance.pushFrom,
      'gcmSubtext': instance.gcmSubtext,
      'gcmImageUrl': instance.gcmImageUrl,
      'body': instance.body,
    };
