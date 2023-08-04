// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_fcm_option.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepoFcmOption _$RepoFcmOptionFromJson(Map json) => RepoFcmOption(
      dryRun: json['dryRun'] as bool?,
      priorityString: json['priorityString'] as String?,
      timeToLive: (json['timeToLive'] as num?)?.toDouble(),
      collapseKeyString: json['collapseKeyString'] as String?,
      mutableContent: json['mutableContent'] as bool?,
      contentAvailable: json['contentAvailable'] as bool?,
      restrictedPackageName: json['restrictedPackageName'] as String?,
    );

Map<String, dynamic> _$RepoFcmOptionToJson(RepoFcmOption instance) =>
    <String, dynamic>{
      'dryRun': instance.dryRun,
      'priorityString': instance.priorityString,
      'timeToLive': instance.timeToLive,
      'collapseKeyString': instance.collapseKeyString,
      'mutableContent': instance.mutableContent,
      'contentAvailable': instance.contentAvailable,
      'restrictedPackageName': instance.restrictedPackageName,
    };
