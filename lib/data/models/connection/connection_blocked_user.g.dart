// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_blocked_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConnectionBlockedUser _$$_ConnectionBlockedUserFromJson(Map json) =>
    _$_ConnectionBlockedUser(
      from: json['from'] as String?,
      to: json['to'] as String?,
    );

Map<String, dynamic> _$$_ConnectionBlockedUserToJson(
    _$_ConnectionBlockedUser instance) {
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
