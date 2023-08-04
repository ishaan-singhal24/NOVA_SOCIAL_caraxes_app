// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'repo_notification.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RepoNotification _$RepoNotificationFromJson(Map<String, dynamic> json) {
  return _RepoNotification.fromJson(json);
}

/// @nodoc
mixin _$RepoNotification {
  String? get id => throw _privateConstructorUsedError;
  UserMinimum? get to => throw _privateConstructorUsedError;
  UserMinimum? get from => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get image => throw _privateConstructorUsedError;
  bool? get isRead => throw _privateConstructorUsedError;
  NotificationType? get type => throw _privateConstructorUsedError;
  Map<String, bool>? get users => throw _privateConstructorUsedError;
  RepoNotificationReference? get reference =>
      throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RepoNotificationCopyWith<RepoNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RepoNotificationCopyWith<$Res> {
  factory $RepoNotificationCopyWith(
          RepoNotification value, $Res Function(RepoNotification) then) =
      _$RepoNotificationCopyWithImpl<$Res, RepoNotification>;
  @useResult
  $Res call(
      {String? id,
      UserMinimum? to,
      UserMinimum? from,
      String? title,
      String? description,
      String? image,
      bool? isRead,
      NotificationType? type,
      Map<String, bool>? users,
      RepoNotificationReference? reference,
      @TimestampConverter() DateTime? createdAt});

  $UserMinimumCopyWith<$Res>? get to;
  $UserMinimumCopyWith<$Res>? get from;
  $RepoNotificationReferenceCopyWith<$Res>? get reference;
}

/// @nodoc
class _$RepoNotificationCopyWithImpl<$Res, $Val extends RepoNotification>
    implements $RepoNotificationCopyWith<$Res> {
  _$RepoNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? to = freezed,
    Object? from = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? isRead = freezed,
    Object? type = freezed,
    Object? users = freezed,
    Object? reference = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as UserMinimum?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as UserMinimum?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType?,
      users: freezed == users
          ? _value.users
          : users // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as RepoNotificationReference?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserMinimumCopyWith<$Res>? get to {
    if (_value.to == null) {
      return null;
    }

    return $UserMinimumCopyWith<$Res>(_value.to!, (value) {
      return _then(_value.copyWith(to: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $UserMinimumCopyWith<$Res>? get from {
    if (_value.from == null) {
      return null;
    }

    return $UserMinimumCopyWith<$Res>(_value.from!, (value) {
      return _then(_value.copyWith(from: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $RepoNotificationReferenceCopyWith<$Res>? get reference {
    if (_value.reference == null) {
      return null;
    }

    return $RepoNotificationReferenceCopyWith<$Res>(_value.reference!, (value) {
      return _then(_value.copyWith(reference: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RepoNotificationCopyWith<$Res>
    implements $RepoNotificationCopyWith<$Res> {
  factory _$$_RepoNotificationCopyWith(
          _$_RepoNotification value, $Res Function(_$_RepoNotification) then) =
      __$$_RepoNotificationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      UserMinimum? to,
      UserMinimum? from,
      String? title,
      String? description,
      String? image,
      bool? isRead,
      NotificationType? type,
      Map<String, bool>? users,
      RepoNotificationReference? reference,
      @TimestampConverter() DateTime? createdAt});

  @override
  $UserMinimumCopyWith<$Res>? get to;
  @override
  $UserMinimumCopyWith<$Res>? get from;
  @override
  $RepoNotificationReferenceCopyWith<$Res>? get reference;
}

/// @nodoc
class __$$_RepoNotificationCopyWithImpl<$Res>
    extends _$RepoNotificationCopyWithImpl<$Res, _$_RepoNotification>
    implements _$$_RepoNotificationCopyWith<$Res> {
  __$$_RepoNotificationCopyWithImpl(
      _$_RepoNotification _value, $Res Function(_$_RepoNotification) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? to = freezed,
    Object? from = freezed,
    Object? title = freezed,
    Object? description = freezed,
    Object? image = freezed,
    Object? isRead = freezed,
    Object? type = freezed,
    Object? users = freezed,
    Object? reference = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_RepoNotification(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      to: freezed == to
          ? _value.to
          : to // ignore: cast_nullable_to_non_nullable
              as UserMinimum?,
      from: freezed == from
          ? _value.from
          : from // ignore: cast_nullable_to_non_nullable
              as UserMinimum?,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: freezed == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType?,
      users: freezed == users
          ? _value._users
          : users // ignore: cast_nullable_to_non_nullable
              as Map<String, bool>?,
      reference: freezed == reference
          ? _value.reference
          : reference // ignore: cast_nullable_to_non_nullable
              as RepoNotificationReference?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

@JsonSerializable(includeIfNull: false)
class _$_RepoNotification implements _RepoNotification {
  const _$_RepoNotification(
      {this.id,
      this.to,
      this.from,
      this.title,
      this.description,
      this.image,
      this.isRead,
      this.type,
      final Map<String, bool>? users,
      this.reference,
      @TimestampConverter() this.createdAt})
      : _users = users;

  factory _$_RepoNotification.fromJson(Map<String, dynamic> json) =>
      _$$_RepoNotificationFromJson(json);

  @override
  final String? id;
  @override
  final UserMinimum? to;
  @override
  final UserMinimum? from;
  @override
  final String? title;
  @override
  final String? description;
  @override
  final String? image;
  @override
  final bool? isRead;
  @override
  final NotificationType? type;
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
  final RepoNotificationReference? reference;
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'RepoNotification(id: $id, to: $to, from: $from, title: $title, description: $description, image: $image, isRead: $isRead, type: $type, users: $users, reference: $reference, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepoNotification &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.to, to) || other.to == to) &&
            (identical(other.from, from) || other.from == from) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.image, image) || other.image == image) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._users, _users) &&
            (identical(other.reference, reference) ||
                other.reference == reference) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      to,
      from,
      title,
      description,
      image,
      isRead,
      type,
      const DeepCollectionEquality().hash(_users),
      reference,
      createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RepoNotificationCopyWith<_$_RepoNotification> get copyWith =>
      __$$_RepoNotificationCopyWithImpl<_$_RepoNotification>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RepoNotificationToJson(
      this,
    );
  }
}

abstract class _RepoNotification implements RepoNotification {
  const factory _RepoNotification(
      {final String? id,
      final UserMinimum? to,
      final UserMinimum? from,
      final String? title,
      final String? description,
      final String? image,
      final bool? isRead,
      final NotificationType? type,
      final Map<String, bool>? users,
      final RepoNotificationReference? reference,
      @TimestampConverter() final DateTime? createdAt}) = _$_RepoNotification;

  factory _RepoNotification.fromJson(Map<String, dynamic> json) =
      _$_RepoNotification.fromJson;

  @override
  String? get id;
  @override
  UserMinimum? get to;
  @override
  UserMinimum? get from;
  @override
  String? get title;
  @override
  String? get description;
  @override
  String? get image;
  @override
  bool? get isRead;
  @override
  NotificationType? get type;
  @override
  Map<String, bool>? get users;
  @override
  RepoNotificationReference? get reference;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_RepoNotificationCopyWith<_$_RepoNotification> get copyWith =>
      throw _privateConstructorUsedError;
}
