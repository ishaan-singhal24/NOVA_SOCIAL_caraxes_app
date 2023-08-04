// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_fcm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepoFcm _$RepoFcmFromJson(Map json) => RepoFcm(
      registrationTokenOrTokens:
          (json['registrationTokenOrTokens'] as List<dynamic>)
              .map((e) => e as String?)
              .toList(),
      payload: RepoFcmPayload.fromJson(
          Map<String, dynamic>.from(json['payload'] as Map)),
      options: json['options'] == null
          ? null
          : RepoFcmOption.fromJson(
              Map<String, dynamic>.from(json['options'] as Map)),
    );

Map<String, dynamic> _$RepoFcmToJson(RepoFcm instance) {
  final val = <String, dynamic>{
    'registrationTokenOrTokens': instance.registrationTokenOrTokens,
    'payload': instance.payload.toJson(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('options', instance.options?.toJson());
  return val;
}
