// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playground_feed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaygroundFeedModel _$PlaygroundFeedModelFromJson(Map<String, dynamic> json) {
  return _PlaygroundFeedModel.fromJson(json);
}

/// @nodoc
mixin _$PlaygroundFeedModel {
  String? get id => throw _privateConstructorUsedError;
  String? get prompt => throw _privateConstructorUsedError;
  String? get generatedFeedUrl => throw _privateConstructorUsedError;
  UserMinimum? get userDetails => throw _privateConstructorUsedError;
  List<PlaygroundFeedCommentModel>? get comments =>
      throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  List<UserReaction>? get reactions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaygroundFeedModelCopyWith<PlaygroundFeedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaygroundFeedModelCopyWith<$Res> {
  factory $PlaygroundFeedModelCopyWith(
          PlaygroundFeedModel value, $Res Function(PlaygroundFeedModel) then) =
      _$PlaygroundFeedModelCopyWithImpl<$Res, PlaygroundFeedModel>;
  @useResult
  $Res call(
      {String? id,
      String? prompt,
      String? generatedFeedUrl,
      UserMinimum? userDetails,
      List<PlaygroundFeedCommentModel>? comments,
      @TimestampConverter() DateTime? createdAt,
      List<UserReaction>? reactions});

  $UserMinimumCopyWith<$Res>? get userDetails;
}

/// @nodoc
class _$PlaygroundFeedModelCopyWithImpl<$Res, $Val extends PlaygroundFeedModel>
    implements $PlaygroundFeedModelCopyWith<$Res> {
  _$PlaygroundFeedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? prompt = freezed,
    Object? generatedFeedUrl = freezed,
    Object? userDetails = freezed,
    Object? comments = freezed,
    Object? createdAt = freezed,
    Object? reactions = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      prompt: freezed == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String?,
      generatedFeedUrl: freezed == generatedFeedUrl
          ? _value.generatedFeedUrl
          : generatedFeedUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserMinimum?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<PlaygroundFeedCommentModel>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reactions: freezed == reactions
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<UserReaction>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserMinimumCopyWith<$Res>? get userDetails {
    if (_value.userDetails == null) {
      return null;
    }

    return $UserMinimumCopyWith<$Res>(_value.userDetails!, (value) {
      return _then(_value.copyWith(userDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PlaygroundFeedModelCopyWith<$Res>
    implements $PlaygroundFeedModelCopyWith<$Res> {
  factory _$$_PlaygroundFeedModelCopyWith(_$_PlaygroundFeedModel value,
          $Res Function(_$_PlaygroundFeedModel) then) =
      __$$_PlaygroundFeedModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? prompt,
      String? generatedFeedUrl,
      UserMinimum? userDetails,
      List<PlaygroundFeedCommentModel>? comments,
      @TimestampConverter() DateTime? createdAt,
      List<UserReaction>? reactions});

  @override
  $UserMinimumCopyWith<$Res>? get userDetails;
}

/// @nodoc
class __$$_PlaygroundFeedModelCopyWithImpl<$Res>
    extends _$PlaygroundFeedModelCopyWithImpl<$Res, _$_PlaygroundFeedModel>
    implements _$$_PlaygroundFeedModelCopyWith<$Res> {
  __$$_PlaygroundFeedModelCopyWithImpl(_$_PlaygroundFeedModel _value,
      $Res Function(_$_PlaygroundFeedModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? prompt = freezed,
    Object? generatedFeedUrl = freezed,
    Object? userDetails = freezed,
    Object? comments = freezed,
    Object? createdAt = freezed,
    Object? reactions = freezed,
  }) {
    return _then(_$_PlaygroundFeedModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      prompt: freezed == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String?,
      generatedFeedUrl: freezed == generatedFeedUrl
          ? _value.generatedFeedUrl
          : generatedFeedUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserMinimum?,
      comments: freezed == comments
          ? _value._comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<PlaygroundFeedCommentModel>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reactions: freezed == reactions
          ? _value._reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<UserReaction>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlaygroundFeedModel implements _PlaygroundFeedModel {
  const _$_PlaygroundFeedModel(
      {this.id,
      this.prompt,
      this.generatedFeedUrl,
      this.userDetails,
      final List<PlaygroundFeedCommentModel>? comments,
      @TimestampConverter() this.createdAt,
      final List<UserReaction>? reactions})
      : _comments = comments,
        _reactions = reactions;

  factory _$_PlaygroundFeedModel.fromJson(Map<String, dynamic> json) =>
      _$$_PlaygroundFeedModelFromJson(json);

  @override
  final String? id;
  @override
  final String? prompt;
  @override
  final String? generatedFeedUrl;
  @override
  final UserMinimum? userDetails;
  final List<PlaygroundFeedCommentModel>? _comments;
  @override
  List<PlaygroundFeedCommentModel>? get comments {
    final value = _comments;
    if (value == null) return null;
    if (_comments is EqualUnmodifiableListView) return _comments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @TimestampConverter()
  final DateTime? createdAt;
  final List<UserReaction>? _reactions;
  @override
  List<UserReaction>? get reactions {
    final value = _reactions;
    if (value == null) return null;
    if (_reactions is EqualUnmodifiableListView) return _reactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'PlaygroundFeedModel(id: $id, prompt: $prompt, generatedFeedUrl: $generatedFeedUrl, userDetails: $userDetails, comments: $comments, createdAt: $createdAt, reactions: $reactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaygroundFeedModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.generatedFeedUrl, generatedFeedUrl) ||
                other.generatedFeedUrl == generatedFeedUrl) &&
            (identical(other.userDetails, userDetails) ||
                other.userDetails == userDetails) &&
            const DeepCollectionEquality().equals(other._comments, _comments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality()
                .equals(other._reactions, _reactions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      prompt,
      generatedFeedUrl,
      userDetails,
      const DeepCollectionEquality().hash(_comments),
      createdAt,
      const DeepCollectionEquality().hash(_reactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaygroundFeedModelCopyWith<_$_PlaygroundFeedModel> get copyWith =>
      __$$_PlaygroundFeedModelCopyWithImpl<_$_PlaygroundFeedModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlaygroundFeedModelToJson(
      this,
    );
  }
}

abstract class _PlaygroundFeedModel implements PlaygroundFeedModel {
  const factory _PlaygroundFeedModel(
      {final String? id,
      final String? prompt,
      final String? generatedFeedUrl,
      final UserMinimum? userDetails,
      final List<PlaygroundFeedCommentModel>? comments,
      @TimestampConverter() final DateTime? createdAt,
      final List<UserReaction>? reactions}) = _$_PlaygroundFeedModel;

  factory _PlaygroundFeedModel.fromJson(Map<String, dynamic> json) =
      _$_PlaygroundFeedModel.fromJson;

  @override
  String? get id;
  @override
  String? get prompt;
  @override
  String? get generatedFeedUrl;
  @override
  UserMinimum? get userDetails;
  @override
  List<PlaygroundFeedCommentModel>? get comments;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  List<UserReaction>? get reactions;
  @override
  @JsonKey(ignore: true)
  _$$_PlaygroundFeedModelCopyWith<_$_PlaygroundFeedModel> get copyWith =>
      throw _privateConstructorUsedError;
}
