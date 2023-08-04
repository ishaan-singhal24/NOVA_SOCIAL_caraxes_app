// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_fcm_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RepoFcmPayload _$$_RepoFcmPayloadFromJson(Map json) => _$_RepoFcmPayload(
      data:
          const RepoFcmPayloadDataConverter().fromJson(json['data'] as String?),
      notification: json['notification'] == null
          ? null
          : RepoFcmPayloadNotification.fromJson(
              Map<String, dynamic>.from(json['notification'] as Map)),
    );

Map<String, dynamic> _$$_RepoFcmPayloadToJson(_$_RepoFcmPayload instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull(
      'data', const RepoFcmPayloadDataConverter().toJson(instance.data));
  writeNotNull('notification', instance.notification?.toJson());
  return val;
}
