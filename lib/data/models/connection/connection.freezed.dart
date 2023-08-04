// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConnectionModel _$ConnectionModelFromJson(Map<String, dynamic> json) {
  return _ConnectionModel.fromJson(json);
}

/// @nodoc
mixin _$ConnectionModel {
  String? get id => throw _privateConstructorUsedError;
  UserMinimum? get user1 => throw _privateConstructorUsedError;
  UserMinimum? get user2 => throw _privateConstructorUsedError;
  Map<String, bool>? get users => throw _privateConstructorUsedError;
  ConnectionStatus? get status => throw _privateConstructorUsedError;
  bool? get isSeen => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get updatedAt => throw _privateConstructorUsedError;
  ConnectionBlockedUser? get blocked => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConnectionModelCopyWith<ConnectionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionModelCopyWith<$Res> {
  factory $ConnectionModelCopyWith(
          ConnectionModel value, $Res Function(ConnectionModel) then) =
      _$ConnectionModelCopyWithImpl<$Res, ConnectionModel>;
  @useResult
  $Res call(
      {String? id,
      UserMinimum? user1,
      UserMinimum? user2,
      Map<String, bool>? users,
      ConnectionStatus? status,
      bool? isSeen,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      ConnectionBlockedUser? blocked});

  $UserMinimumCopyWith<$Res>? get user1;
  $UserMinimumCopyWith<$Res>? get user2;
  $ConnectionBlockedUserCopyWith<$Res>? get blocked;
}

/// @nodoc
class _$ConnectionModelCopyWithImpl<$Res, $Val extends ConnectionModel>
    implements $ConnectionModelCopyWith<$Res> {
  _$ConnectionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user1 = freezed,
    Object? user2 = freezed,
    Object? users = freezed,
    Object? status = freezed,
    Object? isSeen = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? blocked = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user1: freezed == user1
          ? _value.user1
          : user1 // ignore: cast_nullable_to_non_nullable
              as UserMinimum?,
      user2: freezed == user2
          ? _value.user2
          : user2 // ignore: cast_nullable_to_non_nullable
              as UserMinimum?,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectionStatus?,
      isSeen: freezed == isSeen
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      blocked: freezed == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as ConnectionBlockedUser?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserMinimumCopyWith<$Res>? get user1 {
    if (_value.user1 == null) {
      return null;
    }

    return $UserMinimumCopyWith<$Res>(_value.user1!, (value) {
      return _then(_value.copyWith(user1: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserMinimumCopyWith<$Res>? get user2 {
    if (_value.user2 == null) {
      return null;
    }

    return $UserMinimumCopyWith<$Res>(_value.user2!, (value) {
      return _then(_value.copyWith(user2: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ConnectionBlockedUserCopyWith<$Res>? get blocked {
    if (_value.blocked == null) {
      return null;
    }

    return $ConnectionBlockedUserCopyWith<$Res>(_value.blocked!, (value) {
      return _then(_value.copyWith(blocked: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_ConnectionModelCopyWith<$Res>
    implements $ConnectionModelCopyWith<$Res> {
  factory _$$_ConnectionModelCopyWith(
          _$_ConnectionModel value, $Res Function(_$_ConnectionModel) then) =
      __$$_ConnectionModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      UserMinimum? user1,
      UserMinimum? user2,
      Map<String, bool>? users,
      ConnectionStatus? status,
      bool? isSeen,
      @TimestampConverter() DateTime? createdAt,
      @TimestampConverter() DateTime? updatedAt,
      ConnectionBlockedUser? blocked});

  @override
  $UserMinimumCopyWith<$Res>? get user1;
  @override
  $UserMinimumCopyWith<$Res>? get user2;
  @override
  $ConnectionBlockedUserCopyWith<$Res>? get blocked;
}

/// @nodoc
class __$$_ConnectionModelCopyWithImpl<$Res>
    extends _$ConnectionModelCopyWithImpl<$Res, _$_ConnectionModel>
    implements _$$_ConnectionModelCopyWith<$Res> {
  __$$_ConnectionModelCopyWithImpl(
      _$_ConnectionModel _value, $Res Function(_$_ConnectionModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? user1 = freezed,
    Object? user2 = freezed,
    Object? users = freezed,
    Object? status = freezed,
    Object? isSeen = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
    Object? blocked = freezed,
  }) {
    return _then(_$_ConnectionModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      user1: freezed == user1
          ? _value.user1
          : user1 // ignore: cast_nullable_to_non_nullable
              as UserMinimum?,
      user2: freezed == user2
          ? _value.user2
          : user2 // ignore: cast_nullable_to_non_nullable
              as UserMinimum?,
      users: freezed == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ConnectionStatus?,
      isSeen: freezed == isSeen
          ? _value.isSeen
          : isSeen // ignore: cast_nullable_to_non_nullable
              as bool?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      blocked: freezed == blocked
          ? _value.blocked
          : blocked // ignore: cast_nullable_to_non_nullable
              as ConnectionBlockedUser?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_ConnectionModel implements _ConnectionModel {
  const _$_ConnectionModel(
      {this.id,
      this.user1,
      this.user2,
      final Map<String, bool>? users,
      this.status,
      this.isSeen,
      @TimestampConverter() this.createdAt,
      @TimestampConverter() this.updatedAt,
      this.blocked})
      : _users = users;

  factory _$_ConnectionModel.fromJson(Map<String, dynamic> json) =>
      _$$_ConnectionModelFromJson(json);

  @override
  final String? id;
  @override
  final UserMinimum? user1;
  @override
  final UserMinimum? user2;
  final Map<String, bool>? _users;
  @override
  Map<String, bool>? get users {
    final value = _users;
    if (value == null) return null;
    if (_users is EqualUnmodifiableMapView) return _users;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final ConnectionStatus? status;
  @override
  final bool? isSeen;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  @TimestampConverter()
  final DateTime? updatedAt;
  @override
  final ConnectionBlockedUser? blocked;

  @override
  String toString() {
    return 'ConnectionModel(id: $id, user1: $user1, user2: $user2, users: $users, status: $status, isSeen: $isSeen, createdAt: $createdAt, updatedAt: $updatedAt, blocked: $blocked)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectionModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.user1, user1) || other.user1 == user1) &&
            (identical(other.user2, user2) || other.user2 == user2) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.isSeen, isSeen) || other.isSeen == isSeen) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.blocked, blocked) || other.blocked == blocked));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      user1,
      user2,
      const DeepCollectionEquality().hash(_users),
      status,
      isSeen,
      createdAt,
      updatedAt,
      blocked);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConnectionModelCopyWith<_$_ConnectionModel> get copyWith =>
      __$$_ConnectionModelCopyWithImpl<_$_ConnectionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConnectionModelToJson(
      this,
    );
  }
}

abstract class _ConnectionModel implements ConnectionModel {
  const factory _ConnectionModel(
      {final String? id,
      final UserMinimum? user1,
      final UserMinimum? user2,
      final Map<String, bool>? users,
      final ConnectionStatus? status,
      final bool? isSeen,
      @TimestampConverter() final DateTime? createdAt,
      @TimestampConverter() final DateTime? updatedAt,
      final ConnectionBlockedUser? blocked}) = _$_ConnectionModel;

  factory _ConnectionModel.fromJson(Map<String, dynamic> json) =
      _$_ConnectionModel.fromJson;

  @override
  String? get id;
  @override
  UserMinimum? get user1;
  @override
  UserMinimum? get user2;
  @override
  Map<String, bool>? get users;
  @override
  ConnectionStatus? get status;
  @override
  bool? get isSeen;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @TimestampConverter()
  DateTime? get updatedAt;
  @override
  ConnectionBlockedUser? get blocked;
  @override
  @JsonKey(ignore: true)
  _$$_ConnectionModelCopyWith<_$_ConnectionModel> get copyWith =>
      throw _privateConstructorUsedError;
}
