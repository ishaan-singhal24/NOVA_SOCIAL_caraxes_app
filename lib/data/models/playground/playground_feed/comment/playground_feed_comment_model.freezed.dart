// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playground_feed_comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaygroundFeedCommentModel _$PlaygroundFeedCommentModelFromJson(
    Map<String, dynamic> json) {
  return _PlaygroundFeedCommentModel.fromJson(json);
}

/// @nodoc
mixin _$PlaygroundFeedCommentModel {
  String? get id => throw _privateConstructorUsedError;
  String? get playgroundFeedId => throw _privateConstructorUsedError;
  UserMinimum? get userDetails => throw _privateConstructorUsedError;
  List<PlaygroundFeedCommentReplyModel>? get replies =>
      throw _privateConstructorUsedError;
  String? get commentText => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  List<UserReaction>? get reactions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaygroundFeedCommentModelCopyWith<PlaygroundFeedCommentModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaygroundFeedCommentModelCopyWith<$Res> {
  factory $PlaygroundFeedCommentModelCopyWith(PlaygroundFeedCommentModel value,
          $Res Function(PlaygroundFeedCommentModel) then) =
      _$PlaygroundFeedCommentModelCopyWithImpl<$Res,
          PlaygroundFeedCommentModel>;
  @useResult
  $Res call(
      {String? id,
      String? playgroundFeedId,
      UserMinimum? userDetails,
      List<PlaygroundFeedCommentReplyModel>? replies,
      String? commentText,
      @TimestampConverter() DateTime? createdAt,
      List<UserReaction>? reactions});

  $UserMinimumCopyWith<$Res>? get userDetails;
}

/// @nodoc
class _$PlaygroundFeedCommentModelCopyWithImpl<$Res,
        $Val extends PlaygroundFeedCommentModel>
    implements $PlaygroundFeedCommentModelCopyWith<$Res> {
  _$PlaygroundFeedCommentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? playgroundFeedId = freezed,
    Object? userDetails = freezed,
    Object? replies = freezed,
    Object? commentText = freezed,
    Object? createdAt = freezed,
    Object? reactions = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      playgroundFeedId: freezed == playgroundFeedId
          ? _value.playgroundFeedId
          : playgroundFeedId // ignore: cast_nullable_to_non_nullable
              as String?,
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserMinimum?,
      replies: freezed == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<PlaygroundFeedCommentReplyModel>?,
      commentText: freezed == commentText
          ? _value.commentText
          : commentText // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$_PlaygroundFeedCommentModelCopyWith<$Res>
    implements $PlaygroundFeedCommentModelCopyWith<$Res> {
  factory _$$_PlaygroundFeedCommentModelCopyWith(
          _$_PlaygroundFeedCommentModel value,
          $Res Function(_$_PlaygroundFeedCommentModel) then) =
      __$$_PlaygroundFeedCommentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? playgroundFeedId,
      UserMinimum? userDetails,
      List<PlaygroundFeedCommentReplyModel>? replies,
      String? commentText,
      @TimestampConverter() DateTime? createdAt,
      List<UserReaction>? reactions});

  @override
  $UserMinimumCopyWith<$Res>? get userDetails;
}

/// @nodoc
class __$$_PlaygroundFeedCommentModelCopyWithImpl<$Res>
    extends _$PlaygroundFeedCommentModelCopyWithImpl<$Res,
        _$_PlaygroundFeedCommentModel>
    implements _$$_PlaygroundFeedCommentModelCopyWith<$Res> {
  __$$_PlaygroundFeedCommentModelCopyWithImpl(
      _$_PlaygroundFeedCommentModel _value,
      $Res Function(_$_PlaygroundFeedCommentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? playgroundFeedId = freezed,
    Object? userDetails = freezed,
    Object? replies = freezed,
    Object? commentText = freezed,
    Object? createdAt = freezed,
    Object? reactions = freezed,
  }) {
    return _then(_$_PlaygroundFeedCommentModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      playgroundFeedId: freezed == playgroundFeedId
          ? _value.playgroundFeedId
          : playgroundFeedId // ignore: cast_nullable_to_non_nullable
              as String?,
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserMinimum?,
      replies: freezed == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<PlaygroundFeedCommentReplyModel>?,
      commentText: freezed == commentText
          ? _value.commentText
          : commentText // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reactions: freezed == reactions
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<UserReaction>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlaygroundFeedCommentModel implements _PlaygroundFeedCommentModel {
  const _$_PlaygroundFeedCommentModel(
      {this.id,
      this.playgroundFeedId,
      this.userDetails,
      this.replies,
      this.commentText,
      @TimestampConverter() this.createdAt,
      this.reactions});

  factory _$_PlaygroundFeedCommentModel.fromJson(Map<String, dynamic> json) =>
      _$$_PlaygroundFeedCommentModelFromJson(json);

  @override
  final String? id;
  @override
  final String? playgroundFeedId;
  @override
  final UserMinimum? userDetails;
  @override
  final List<PlaygroundFeedCommentReplyModel>? replies;
  @override
  final String? commentText;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  final List<UserReaction>? reactions;

  @override
  String toString() {
    return 'PlaygroundFeedCommentModel(id: $id, playgroundFeedId: $playgroundFeedId, userDetails: $userDetails, replies: $replies, commentText: $commentText, createdAt: $createdAt, reactions: $reactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaygroundFeedCommentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.playgroundFeedId, playgroundFeedId) ||
                other.playgroundFeedId == playgroundFeedId) &&
            (identical(other.userDetails, userDetails) ||
                other.userDetails == userDetails) &&
            const DeepCollectionEquality().equals(other.replies, replies) &&
            (identical(other.commentText, commentText) ||
                other.commentText == commentText) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.reactions, reactions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      playgroundFeedId,
      userDetails,
      const DeepCollectionEquality().hash(replies),
      commentText,
      createdAt,
      const DeepCollectionEquality().hash(reactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaygroundFeedCommentModelCopyWith<_$_PlaygroundFeedCommentModel>
      get copyWith => __$$_PlaygroundFeedCommentModelCopyWithImpl<
          _$_PlaygroundFeedCommentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlaygroundFeedCommentModelToJson(
      this,
    );
  }
}

abstract class _PlaygroundFeedCommentModel
    implements PlaygroundFeedCommentModel {
  const factory _PlaygroundFeedCommentModel(
      {final String? id,
      final String? playgroundFeedId,
      final UserMinimum? userDetails,
      final List<PlaygroundFeedCommentReplyModel>? replies,
      final String? commentText,
      @TimestampConverter() final DateTime? createdAt,
      final List<UserReaction>? reactions}) = _$_PlaygroundFeedCommentModel;

  factory _PlaygroundFeedCommentModel.fromJson(Map<String, dynamic> json) =
      _$_PlaygroundFeedCommentModel.fromJson;

  @override
  String? get id;
  @override
  String? get playgroundFeedId;
  @override
  UserMinimum? get userDetails;
  @override
  List<PlaygroundFeedCommentReplyModel>? get replies;
  @override
  String? get commentText;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  List<UserReaction>? get reactions;
  @override
  @JsonKey(ignore: true)
  _$$_PlaygroundFeedCommentModelCopyWith<_$_PlaygroundFeedCommentModel>
      get copyWith => throw _privateConstructorUsedError;
}
