// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeedCommentModel _$FeedCommentModelFromJson(Map<String, dynamic> json) {
  return _FeedCommentModel.fromJson(json);
}

/// @nodoc
mixin _$FeedCommentModel {
  String? get id => throw _privateConstructorUsedError;
  String? get feedId => throw _privateConstructorUsedError;
  UserMinimum? get userDetails => throw _privateConstructorUsedError;
  List<FeedCommentReplyModel>? get replies =>
      throw _privateConstructorUsedError;
  String? get commentText => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  List<UserReaction>? get reactions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedCommentModelCopyWith<FeedCommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedCommentModelCopyWith<$Res> {
  factory $FeedCommentModelCopyWith(
          FeedCommentModel value, $Res Function(FeedCommentModel) then) =
      _$FeedCommentModelCopyWithImpl<$Res, FeedCommentModel>;
  @useResult
  $Res call(
      {String? id,
      String? feedId,
      UserMinimum? userDetails,
      List<FeedCommentReplyModel>? replies,
      String? commentText,
      @TimestampConverter() DateTime? createdAt,
      List<UserReaction>? reactions});

  $UserMinimumCopyWith<$Res>? get userDetails;
}

/// @nodoc
class _$FeedCommentModelCopyWithImpl<$Res, $Val extends FeedCommentModel>
    implements $FeedCommentModelCopyWith<$Res> {
  _$FeedCommentModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? feedId = freezed,
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
      feedId: freezed == feedId
          ? _value.feedId
          : feedId // ignore: cast_nullable_to_non_nullable
              as String?,
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserMinimum?,
      replies: freezed == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<FeedCommentReplyModel>?,
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
abstract class _$$_FeedCommentModelCopyWith<$Res>
    implements $FeedCommentModelCopyWith<$Res> {
  factory _$$_FeedCommentModelCopyWith(
          _$_FeedCommentModel value, $Res Function(_$_FeedCommentModel) then) =
      __$$_FeedCommentModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? feedId,
      UserMinimum? userDetails,
      List<FeedCommentReplyModel>? replies,
      String? commentText,
      @TimestampConverter() DateTime? createdAt,
      List<UserReaction>? reactions});

  @override
  $UserMinimumCopyWith<$Res>? get userDetails;
}

/// @nodoc
class __$$_FeedCommentModelCopyWithImpl<$Res>
    extends _$FeedCommentModelCopyWithImpl<$Res, _$_FeedCommentModel>
    implements _$$_FeedCommentModelCopyWith<$Res> {
  __$$_FeedCommentModelCopyWithImpl(
      _$_FeedCommentModel _value, $Res Function(_$_FeedCommentModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? feedId = freezed,
    Object? userDetails = freezed,
    Object? replies = freezed,
    Object? commentText = freezed,
    Object? createdAt = freezed,
    Object? reactions = freezed,
  }) {
    return _then(_$_FeedCommentModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      feedId: freezed == feedId
          ? _value.feedId
          : feedId // ignore: cast_nullable_to_non_nullable
              as String?,
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserMinimum?,
      replies: freezed == replies
          ? _value.replies
          : replies // ignore: cast_nullable_to_non_nullable
              as List<FeedCommentReplyModel>?,
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
class _$_FeedCommentModel implements _FeedCommentModel {
  const _$_FeedCommentModel(
      {this.id,
      this.feedId,
      this.userDetails,
      this.replies,
      this.commentText,
      @TimestampConverter() this.createdAt,
      this.reactions});

  factory _$_FeedCommentModel.fromJson(Map<String, dynamic> json) =>
      _$$_FeedCommentModelFromJson(json);

  @override
  final String? id;
  @override
  final String? feedId;
  @override
  final UserMinimum? userDetails;
  @override
  final List<FeedCommentReplyModel>? replies;
  @override
  final String? commentText;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  final List<UserReaction>? reactions;

  @override
  String toString() {
    return 'FeedCommentModel(id: $id, feedId: $feedId, userDetails: $userDetails, replies: $replies, commentText: $commentText, createdAt: $createdAt, reactions: $reactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeedCommentModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.feedId, feedId) || other.feedId == feedId) &&
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
      feedId,
      userDetails,
      const DeepCollectionEquality().hash(replies),
      commentText,
      createdAt,
      const DeepCollectionEquality().hash(reactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeedCommentModelCopyWith<_$_FeedCommentModel> get copyWith =>
      __$$_FeedCommentModelCopyWithImpl<_$_FeedCommentModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeedCommentModelToJson(
      this,
    );
  }
}

abstract class _FeedCommentModel implements FeedCommentModel {
  const factory _FeedCommentModel(
      {final String? id,
      final String? feedId,
      final UserMinimum? userDetails,
      final List<FeedCommentReplyModel>? replies,
      final String? commentText,
      @TimestampConverter() final DateTime? createdAt,
      final List<UserReaction>? reactions}) = _$_FeedCommentModel;

  factory _FeedCommentModel.fromJson(Map<String, dynamic> json) =
      _$_FeedCommentModel.fromJson;

  @override
  String? get id;
  @override
  String? get feedId;
  @override
  UserMinimum? get userDetails;
  @override
  List<FeedCommentReplyModel>? get replies;
  @override
  String? get commentText;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  List<UserReaction>? get reactions;
  @override
  @JsonKey(ignore: true)
  _$$_FeedCommentModelCopyWith<_$_FeedCommentModel> get copyWith =>
      throw _privateConstructorUsedError;
}
