// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_blocked_users.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserBlockedUsers _$UserBlockedUsersFromJson(Map<String, dynamic> json) {
  return _UserBlockedUsers.fromJson(json);
}

/// @nodoc
mixin _$UserBlockedUsers {
  Map<String, bool>? get from => throw _privateConstructorUsedError;
  Map<String, bool>? get to => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserBlockedUsersCopyWith<UserBlockedUsers> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBlockedUsersCopyWith<$Res> {
  factory $UserBlockedUsersCopyWith(
          UserBlockedUsers value, $Res Function(UserBlockedUsers) then) =
      _$UserBlockedUsersCopyWithImpl<$Res, UserBlockedUsers>;
  @useResult
  $Res call({Map<String, bool>? from, Map<String, bool>? to});
}

/// @nodoc
class _$UserBlockedUsersCopyWithImpl<$Res, $Val extends UserBlockedUsers>
    implements $UserBlockedUsersCopyWith<$Res> {
  _$UserBlockedUsersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_value.copyWith(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserBlockedUsersCopyWith<$Res>
    implements $UserBlockedUsersCopyWith<$Res> {
  factory _$$_UserBlockedUsersCopyWith(
          _$_UserBlockedUsers value, $Res Function(_$_UserBlockedUsers) then) =
      __$$_UserBlockedUsersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Map<String, bool>? from, Map<String, bool>? to});
}

/// @nodoc
class __$$_UserBlockedUsersCopyWithImpl<$Res>
    extends _$UserBlockedUsersCopyWithImpl<$Res, _$_UserBlockedUsers>
    implements _$$_UserBlockedUsersCopyWith<$Res> {
  __$$_UserBlockedUsersCopyWithImpl(
      _$_UserBlockedUsers _value, $Res Function(_$_UserBlockedUsers) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_$_UserBlockedUsers(
      from: freezed == from
          ? _value._from
          : from // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      to: freezed == to
          ? _value._to
          : to // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_UserBlockedUsers implements _UserBlockedUsers {
  const _$_UserBlockedUsers(
      {final Map<String, bool>? from, final Map<String, bool>? to})
      : _from = from,
        _to = to;

  factory _$_UserBlockedUsers.fromJson(Map<String, dynamic> json) =>
      _$$_UserBlockedUsersFromJson(json);

  final Map<String, bool>? _from;
  @override
  Map<String, bool>? get from {
    final value = _from;
    if (value == null) return null;
    if (_from is EqualUnmodifiableMapView) return _from;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  final Map<String, bool>? _to;
  @override
  Map<String, bool>? get to {
    final value = _to;
    if (value == null) return null;
    if (_to is EqualUnmodifiableMapView) return _to;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'UserBlockedUsers(from: $from, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserBlockedUsers &&
            const DeepCollectionEquality().equals(other._from, _from) &&
            const DeepCollectionEquality().equals(other._to, _to));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_from),
      const DeepCollectionEquality().hash(_to));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserBlockedUsersCopyWith<_$_UserBlockedUsers> get copyWith =>
      __$$_UserBlockedUsersCopyWithImpl<_$_UserBlockedUsers>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserBlockedUsersToJson(
      this,
    );
  }
}

abstract class _UserBlockedUsers implements UserBlockedUsers {
  const factory _UserBlockedUsers(
      {final Map<String, bool>? from,
      final Map<String, bool>? to}) = _$_UserBlockedUsers;

  factory _UserBlockedUsers.fromJson(Map<String, dynamic> json) =
      _$_UserBlockedUsers.fromJson;

  @override
  Map<String, bool>? get from;
  @override
  Map<String, bool>? get to;
  @override
  @JsonKey(ignore: true)
  _$$_UserBlockedUsersCopyWith<_$_UserBlockedUsers> get copyWith =>
      throw _privateConstructorUsedError;
}
