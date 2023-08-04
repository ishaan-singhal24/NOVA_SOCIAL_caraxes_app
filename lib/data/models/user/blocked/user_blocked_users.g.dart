// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_blocked_users.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserBlockedUsers _$$_UserBlockedUsersFromJson(Map json) =>
    _$_UserBlockedUsers(
      from: (json['from'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as bool),
      ),
      to: (json['to'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as bool),
      ),
    );

Map<String, dynamic> _$$_UserBlockedUsersToJson(_$_UserBlockedUsers instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('from', instance.from);
  writeNotNull('to', instance.to);
  return val;
}
