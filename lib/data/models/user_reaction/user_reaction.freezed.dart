// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_reaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserReaction _$UserReactionFromJson(Map<String, dynamic> json) {
  return _UserReaction.fromJson(json);
}

/// @nodoc
mixin _$UserReaction {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get profilePictureUrl => throw _privateConstructorUsedError;
  ReactionEnum? get reaction => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserReactionCopyWith<UserReaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserReactionCopyWith<$Res> {
  factory $UserReactionCopyWith(
          UserReaction value, $Res Function(UserReaction) then) =
      _$UserReactionCopyWithImpl<$Res, UserReaction>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? username,
      String? profilePictureUrl,
      ReactionEnum? reaction});
}

/// @nodoc
class _$UserReactionCopyWithImpl<$Res, $Val extends UserReaction>
    implements $UserReactionCopyWith<$Res> {
  _$UserReactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? profilePictureUrl = freezed,
    Object? reaction = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePictureUrl: freezed == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      reaction: freezed == reaction
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as ReactionEnum?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserReactionCopyWith<$Res>
    implements $UserReactionCopyWith<$Res> {
  factory _$$_UserReactionCopyWith(
          _$_UserReaction value, $Res Function(_$_UserReaction) then) =
      __$$_UserReactionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? username,
      String? profilePictureUrl,
      ReactionEnum? reaction});
}

/// @nodoc
class __$$_UserReactionCopyWithImpl<$Res>
    extends _$UserReactionCopyWithImpl<$Res, _$_UserReaction>
    implements _$$_UserReactionCopyWith<$Res> {
  __$$_UserReactionCopyWithImpl(
      _$_UserReaction _value, $Res Function(_$_UserReaction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? username = freezed,
    Object? profilePictureUrl = freezed,
    Object? reaction = freezed,
  }) {
    return _then(_$_UserReaction(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePictureUrl: freezed == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      reaction: freezed == reaction
          ? _value.reaction
          : reaction // ignore: cast_nullable_to_non_nullable
              as ReactionEnum?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserReaction implements _UserReaction {
  const _$_UserReaction(
      {this.id,
      this.name,
      this.username,
      this.profilePictureUrl,
      this.reaction});

  factory _$_UserReaction.fromJson(Map<String, dynamic> json) =>
      _$$_UserReactionFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? username;
  @override
  final String? profilePictureUrl;
  @override
  final ReactionEnum? reaction;

  @override
  String toString() {
    return 'UserReaction(id: $id, name: $name, username: $username, profilePictureUrl: $profilePictureUrl, reaction: $reaction)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserReaction &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.profilePictureUrl, profilePictureUrl) ||
                other.profilePictureUrl == profilePictureUrl) &&
            (identical(other.reaction, reaction) ||
                other.reaction == reaction));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, username, profilePictureUrl, reaction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserReactionCopyWith<_$_UserReaction> get copyWith =>
      __$$_UserReactionCopyWithImpl<_$_UserReaction>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserReactionToJson(
      this,
    );
  }
}

abstract class _UserReaction implements UserReaction {
  const factory _UserReaction(
      {final String? id,
      final String? name,
      final String? username,
      final String? profilePictureUrl,
      final ReactionEnum? reaction}) = _$_UserReaction;

  factory _UserReaction.fromJson(Map<String, dynamic> json) =
      _$_UserReaction.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get username;
  @override
  String? get profilePictureUrl;
  @override
  ReactionEnum? get reaction;
  @override
  @JsonKey(ignore: true)
  _$$_UserReactionCopyWith<_$_UserReaction> get copyWith =>
      throw _privateConstructorUsedError;
}
