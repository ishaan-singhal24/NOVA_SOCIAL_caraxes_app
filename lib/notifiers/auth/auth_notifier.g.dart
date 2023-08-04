// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_notifier.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthNotifier _$AuthNotifierFromJson(Map json) => AuthNotifier()
  ..authStatus = $enumDecodeNullable(_$InitEnumEnumMap, json['authStatus'])
  ..appleAuthStatus =
      $enumDecodeNullable(_$InitEnumEnumMap, json['appleAuthStatus'])
  ..deleteActionResponse = json['deleteActionResponse'] as String?;

Map<String, dynamic> _$AuthNotifierToJson(AuthNotifier instance) =>
    <String, dynamic>{
      'authStatus': _$InitEnumEnumMap[instance.authStatus],
      'appleAuthStatus': _$InitEnumEnumMap[instance.appleAuthStatus],
      'deleteActionResponse': instance.deleteActionResponse,
    };

const _$InitEnumEnumMap = {
  InitEnum.uninitialized: 'uninitialized',
  InitEnum.initializing: 'initializing',
  InitEnum.initialized: 'initialized',
};
