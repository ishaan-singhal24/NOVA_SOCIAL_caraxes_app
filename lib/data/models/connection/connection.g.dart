// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ConnectionModel _$$_ConnectionModelFromJson(Map json) => _$_ConnectionModel(
      id: json['id'] as String?,
      user1: json['user1'] == null
          ? null
          : UserMinimum.fromJson(
              Map<String, dynamic>.from(json['user1'] as Map)),
      user2: json['user2'] == null
          ? null
          : UserMinimum.fromJson(
              Map<String, dynamic>.from(json['user2'] as Map)),
      users: (json['users'] as Map?)?.map(
        (k, e) => MapEntry(k as String, e as bool),
      ),
      status: $enumDecodeNullable(_$ConnectionStatusEnumMap, json['status']),
      isSeen: json['isSeen'] as bool?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
      updatedAt:
          const TimestampConverter().fromJson(json['updatedAt'] as Timestamp?),
      blocked: json['blocked'] == null
          ? null
          : ConnectionBlockedUser.fromJson(
              Map<String, dynamic>.from(json['blocked'] as Map)),
    );

Map<String, dynamic> _$$_ConnectionModelToJson(_$_ConnectionModel instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('user1', instance.user1?.toJson());
  writeNotNull('user2', instance.user2?.toJson());
  writeNotNull('users', instance.users);
  writeNotNull('status', _$ConnectionStatusEnumMap[instance.status]);
  writeNotNull('isSeen', instance.isSeen);
  writeNotNull(
      'createdAt', const TimestampConverter().toJson(instance.createdAt));
  writeNotNull(
      'updatedAt', const TimestampConverter().toJson(instance.updatedAt));
  writeNotNull('blocked', instance.blocked?.toJson());
  return val;
}

const _$ConnectionStatusEnumMap = {
  ConnectionStatus.pending: 'pending',
  ConnectionStatus.accepted: 'accepted',
  ConnectionStatus.blocked: 'blocked',
};
