// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'connection_blocked_user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ConnectionBlockedUser _$ConnectionBlockedUserFromJson(
    Map<String, dynamic> json) {
  return _ConnectionBlockedUser.fromJson(json);
}

/// @nodoc
mixin _$ConnectionBlockedUser {
  String? get from => throw _privateConstructorUsedError;
  String? get to => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ConnectionBlockedUserCopyWith<ConnectionBlockedUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ConnectionBlockedUserCopyWith<$Res> {
  factory $ConnectionBlockedUserCopyWith(ConnectionBlockedUser value,
          $Res Function(ConnectionBlockedUser) then) =
      _$ConnectionBlockedUserCopyWithImpl<$Res, ConnectionBlockedUser>;
  @useResult
  $Res call({String? from, String? to});
}

/// @nodoc
class _$ConnectionBlockedUserCopyWithImpl<$Res,
        $Val extends ConnectionBlockedUser>
    implements $ConnectionBlockedUserCopyWith<$Res> {
  _$ConnectionBlockedUserCopyWithImpl(this._value, this._then);

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
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ConnectionBlockedUserCopyWith<$Res>
    implements $ConnectionBlockedUserCopyWith<$Res> {
  factory _$$_ConnectionBlockedUserCopyWith(_$_ConnectionBlockedUser value,
          $Res Function(_$_ConnectionBlockedUser) then) =
      __$$_ConnectionBlockedUserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? from, String? to});
}

/// @nodoc
class __$$_ConnectionBlockedUserCopyWithImpl<$Res>
    extends _$ConnectionBlockedUserCopyWithImpl<$Res, _$_ConnectionBlockedUser>
    implements _$$_ConnectionBlockedUserCopyWith<$Res> {
  __$$_ConnectionBlockedUserCopyWithImpl(_$_ConnectionBlockedUser _value,
      $Res Function(_$_ConnectionBlockedUser) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? from = freezed,
    Object? to = freezed,
  }) {
    return _then(_$_ConnectionBlockedUser(
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_ConnectionBlockedUser implements _ConnectionBlockedUser {
  const _$_ConnectionBlockedUser({this.from, this.to});

  factory _$_ConnectionBlockedUser.fromJson(Map<String, dynamic> json) =>
      _$$_ConnectionBlockedUserFromJson(json);

  @override
  final String? from;
  @override
  final String? to;

  @override
  String toString() {
    return 'ConnectionBlockedUser(from: $from, to: $to)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ConnectionBlockedUser &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.to, to) || other.to == to));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, from, to);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ConnectionBlockedUserCopyWith<_$_ConnectionBlockedUser> get copyWith =>
      __$$_ConnectionBlockedUserCopyWithImpl<_$_ConnectionBlockedUser>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ConnectionBlockedUserToJson(
      this,
    );
  }
}

abstract class _ConnectionBlockedUser implements ConnectionBlockedUser {
  const factory _ConnectionBlockedUser({final String? from, final String? to}) =
      _$_ConnectionBlockedUser;

  factory _ConnectionBlockedUser.fromJson(Map<String, dynamic> json) =
      _$_ConnectionBlockedUser.fromJson;

  @override
  String? get from;
  @override
  String? get to;
  @override
  @JsonKey(ignore: true)
  _$$_ConnectionBlockedUserCopyWith<_$_ConnectionBlockedUser> get copyWith =>
      throw _privateConstructorUsedError;
}
