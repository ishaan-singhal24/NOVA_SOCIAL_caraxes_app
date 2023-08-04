// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repo_notification_reference.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepoNotificationReference _$RepoNotificationReferenceFromJson(
    Map<String, dynamic> json) {
  return _RepoNotificationReference.fromJson(json);
}

/// @nodoc
mixin _$RepoNotificationReference {
  NotificationReferenceType? get type => throw _privateConstructorUsedError;
  String? get id => throw _privateConstructorUsedError;
  List<String>? get subIds => throw _privateConstructorUsedError;
  List<NotificationReferenceType>? get subTypes =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepoNotificationReferenceCopyWith<RepoNotificationReference> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoNotificationReferenceCopyWith<$Res> {
  factory $RepoNotificationReferenceCopyWith(RepoNotificationReference value,
          $Res Function(RepoNotificationReference) then) =
      _$RepoNotificationReferenceCopyWithImpl<$Res, RepoNotificationReference>;
  @useResult
  $Res call(
      {NotificationReferenceType? type,
      String? id,
      List<String>? subIds,
      List<NotificationReferenceType>? subTypes});
}

/// @nodoc
class _$RepoNotificationReferenceCopyWithImpl<$Res,
        $Val extends RepoNotificationReference>
    implements $RepoNotificationReferenceCopyWith<$Res> {
  _$RepoNotificationReferenceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? id = freezed,
    Object? subIds = freezed,
    Object? subTypes = freezed,
  }) {
    return _then(_value.copyWith(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationReferenceType?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      subIds: freezed == subIds
          ? _value.subIds
          : subIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      subTypes: freezed == subTypes
          ? _value.subTypes
          : subTypes // ignore: cast_nullable_to_non_nullable
              as List<NotificationReferenceType>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RepoNotificationReferenceCopyWith<$Res>
    implements $RepoNotificationReferenceCopyWith<$Res> {
  factory _$$_RepoNotificationReferenceCopyWith(
          _$_RepoNotificationReference value,
          $Res Function(_$_RepoNotificationReference) then) =
      __$$_RepoNotificationReferenceCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {NotificationReferenceType? type,
      String? id,
      List<String>? subIds,
      List<NotificationReferenceType>? subTypes});
}

/// @nodoc
class __$$_RepoNotificationReferenceCopyWithImpl<$Res>
    extends _$RepoNotificationReferenceCopyWithImpl<$Res,
        _$_RepoNotificationReference>
    implements _$$_RepoNotificationReferenceCopyWith<$Res> {
  __$$_RepoNotificationReferenceCopyWithImpl(
      _$_RepoNotificationReference _value,
      $Res Function(_$_RepoNotificationReference) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = freezed,
    Object? id = freezed,
    Object? subIds = freezed,
    Object? subTypes = freezed,
  }) {
    return _then(_$_RepoNotificationReference(
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationReferenceType?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      subIds: freezed == subIds
          ? _value._subIds
          : subIds // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      subTypes: freezed == subTypes
          ? _value._subTypes
          : subTypes // ignore: cast_nullable_to_non_nullable
              as List<NotificationReferenceType>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_RepoNotificationReference implements _RepoNotificationReference {
  const _$_RepoNotificationReference(
      {this.type,
      this.id,
      final List<String>? subIds,
      final List<NotificationReferenceType>? subTypes})
      : _subIds = subIds,
        _subTypes = subTypes;

  factory _$_RepoNotificationReference.fromJson(Map<String, dynamic> json) =>
      _$$_RepoNotificationReferenceFromJson(json);

  @override
  final NotificationReferenceType? type;
  @override
  final String? id;
  final List<String>? _subIds;
  @override
  List<String>? get subIds {
    final value = _subIds;
    if (value == null) return null;
    if (_subIds is EqualUnmodifiableListView) return _subIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<NotificationReferenceType>? _subTypes;
  @override
  List<NotificationReferenceType>? get subTypes {
    final value = _subTypes;
    if (value == null) return null;
    if (_subTypes is EqualUnmodifiableListView) return _subTypes;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RepoNotificationReference(type: $type, id: $id, subIds: $subIds, subTypes: $subTypes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepoNotificationReference &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._subIds, _subIds) &&
            const DeepCollectionEquality().equals(other._subTypes, _subTypes));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      type,
      id,
      const DeepCollectionEquality().hash(_subIds),
      const DeepCollectionEquality().hash(_subTypes));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RepoNotificationReferenceCopyWith<_$_RepoNotificationReference>
      get copyWith => __$$_RepoNotificationReferenceCopyWithImpl<
          _$_RepoNotificationReference>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RepoNotificationReferenceToJson(
      this,
    );
  }
}

abstract class _RepoNotificationReference implements RepoNotificationReference {
  const factory _RepoNotificationReference(
          {final NotificationReferenceType? type,
          final String? id,
          final List<String>? subIds,
          final List<NotificationReferenceType>? subTypes}) =
      _$_RepoNotificationReference;

  factory _RepoNotificationReference.fromJson(Map<String, dynamic> json) =
      _$_RepoNotificationReference.fromJson;

  @override
  NotificationReferenceType? get type;
  @override
  String? get id;
  @override
  List<String>? get subIds;
  @override
  List<NotificationReferenceType>? get subTypes;
  @override
  @JsonKey(ignore: true)
  _$$_RepoNotificationReferenceCopyWith<_$_RepoNotificationReference>
      get copyWith => throw _privateConstructorUsedError;
}
