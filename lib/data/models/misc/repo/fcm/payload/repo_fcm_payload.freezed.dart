// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repo_fcm_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepoFcmPayload _$RepoFcmPayloadFromJson(Map<String, dynamic> json) {
  return _RepoFcmPayload.fromJson(json);
}

/// @nodoc
mixin _$RepoFcmPayload {
  @RepoFcmPayloadDataConverter()
  RepoFcmPayloadData? get data => throw _privateConstructorUsedError;
  RepoFcmPayloadNotification? get notification =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepoFcmPayloadCopyWith<RepoFcmPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoFcmPayloadCopyWith<$Res> {
  factory $RepoFcmPayloadCopyWith(
          RepoFcmPayload value, $Res Function(RepoFcmPayload) then) =
      _$RepoFcmPayloadCopyWithImpl<$Res, RepoFcmPayload>;
  @useResult
  $Res call(
      {@RepoFcmPayloadDataConverter() RepoFcmPayloadData? data,
      RepoFcmPayloadNotification? notification});
}

/// @nodoc
class _$RepoFcmPayloadCopyWithImpl<$Res, $Val extends RepoFcmPayload>
    implements $RepoFcmPayloadCopyWith<$Res> {
  _$RepoFcmPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? notification = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as RepoFcmPayloadData?,
      notification: freezed == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as RepoFcmPayloadNotification?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RepoFcmPayloadCopyWith<$Res>
    implements $RepoFcmPayloadCopyWith<$Res> {
  factory _$$_RepoFcmPayloadCopyWith(
          _$_RepoFcmPayload value, $Res Function(_$_RepoFcmPayload) then) =
      __$$_RepoFcmPayloadCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@RepoFcmPayloadDataConverter() RepoFcmPayloadData? data,
      RepoFcmPayloadNotification? notification});
}

/// @nodoc
class __$$_RepoFcmPayloadCopyWithImpl<$Res>
    extends _$RepoFcmPayloadCopyWithImpl<$Res, _$_RepoFcmPayload>
    implements _$$_RepoFcmPayloadCopyWith<$Res> {
  __$$_RepoFcmPayloadCopyWithImpl(
      _$_RepoFcmPayload _value, $Res Function(_$_RepoFcmPayload) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? notification = freezed,
  }) {
    return _then(_$_RepoFcmPayload(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as RepoFcmPayloadData?,
      notification: freezed == notification
          ? _value.notification
          : notification // ignore: cast_nullable_to_non_nullable
              as RepoFcmPayloadNotification?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_RepoFcmPayload implements _RepoFcmPayload {
  const _$_RepoFcmPayload(
      {@RepoFcmPayloadDataConverter() this.data, this.notification});

  factory _$_RepoFcmPayload.fromJson(Map<String, dynamic> json) =>
      _$$_RepoFcmPayloadFromJson(json);

  @override
  @RepoFcmPayloadDataConverter()
  final RepoFcmPayloadData? data;
  @override
  final RepoFcmPayloadNotification? notification;

  @override
  String toString() {
    return 'RepoFcmPayload(data: $data, notification: $notification)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepoFcmPayload &&
            (identical(other.data, data) || other.data == data) &&
            (identical(other.notification, notification) ||
                other.notification == notification));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data, notification);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RepoFcmPayloadCopyWith<_$_RepoFcmPayload> get copyWith =>
      __$$_RepoFcmPayloadCopyWithImpl<_$_RepoFcmPayload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RepoFcmPayloadToJson(
      this,
    );
  }
}

abstract class _RepoFcmPayload implements RepoFcmPayload {
  const factory _RepoFcmPayload(
      {@RepoFcmPayloadDataConverter() final RepoFcmPayloadData? data,
      final RepoFcmPayloadNotification? notification}) = _$_RepoFcmPayload;

  factory _RepoFcmPayload.fromJson(Map<String, dynamic> json) =
      _$_RepoFcmPayload.fromJson;

  @override
  @RepoFcmPayloadDataConverter()
  RepoFcmPayloadData? get data;
  @override
  RepoFcmPayloadNotification? get notification;
  @override
  @JsonKey(ignore: true)
  _$$_RepoFcmPayloadCopyWith<_$_RepoFcmPayload> get copyWith =>
      throw _privateConstructorUsedError;
}
