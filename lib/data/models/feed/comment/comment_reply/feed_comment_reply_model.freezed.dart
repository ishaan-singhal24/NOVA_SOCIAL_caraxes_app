// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_comment_reply_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeedCommentReplyModel _$FeedCommentReplyModelFromJson(
    Map<String, dynamic> json) {
  return _FeedCommentReplyModel.fromJson(json);
}

/// @nodoc
mixin _$FeedCommentReplyModel {
  String? get id => throw _privateConstructorUsedError;
  String? get commentId => throw _privateConstructorUsedError;
  String? get feedId => throw _privateConstructorUsedError;
  UserMinimum? get userDetails => throw _privateConstructorUsedError;
  UserMinimum? get repliedToUserDetails => throw _privateConstructorUsedError;
  String? get commentReplyText => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  List<UserReaction>? get reactions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedCommentReplyModelCopyWith<FeedCommentReplyModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedCommentReplyModelCopyWith<$Res> {
  factory $FeedCommentReplyModelCopyWith(FeedCommentReplyModel value,
          $Res Function(FeedCommentReplyModel) then) =
      _$FeedCommentReplyModelCopyWithImpl<$Res, FeedCommentReplyModel>;
  @useResult
  $Res call(
      {String? id,
      String? commentId,
      String? feedId,
      UserMinimum? userDetails,
      UserMinimum? repliedToUserDetails,
      String? commentReplyText,
      @TimestampConverter() DateTime? createdAt,
      List<UserReaction>? reactions});

  $UserMinimumCopyWith<$Res>? get userDetails;
  $UserMinimumCopyWith<$Res>? get repliedToUserDetails;
}

/// @nodoc
class _$FeedCommentReplyModelCopyWithImpl<$Res,
        $Val extends FeedCommentReplyModel>
    implements $FeedCommentReplyModelCopyWith<$Res> {
  _$FeedCommentReplyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? commentId = freezed,
    Object? feedId = freezed,
    Object? userDetails = freezed,
    Object? repliedToUserDetails = freezed,
    Object? commentReplyText = freezed,
    Object? createdAt = freezed,
    Object? reactions = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String?,
      feedId: freezed == feedId
          ? _value.feedId
          : feedId // ignore: cast_nullable_to_non_nullable
              as String?,
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserMinimum?,
      repliedToUserDetails: freezed == repliedToUserDetails
          ? _value.repliedToUserDetails
          : repliedToUserDetails // ignore: cast_nullable_to_non_nullable
              as UserMinimum?,
      commentReplyText: freezed == commentReplyText
          ? _value.commentReplyText
          : commentReplyText // ignore: cast_nullable_to_non_nullable
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

  @override
  @pragma('vm:prefer-inline')
  $UserMinimumCopyWith<$Res>? get repliedToUserDetails {
    if (_value.repliedToUserDetails == null) {
      return null;
    }

    return $UserMinimumCopyWith<$Res>(_value.repliedToUserDetails!, (value) {
      return _then(_value.copyWith(repliedToUserDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_FeedCommentReplyModelCopyWith<$Res>
    implements $FeedCommentReplyModelCopyWith<$Res> {
  factory _$$_FeedCommentReplyModelCopyWith(_$_FeedCommentReplyModel value,
          $Res Function(_$_FeedCommentReplyModel) then) =
      __$$_FeedCommentReplyModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? commentId,
      String? feedId,
      UserMinimum? userDetails,
      UserMinimum? repliedToUserDetails,
      String? commentReplyText,
      @TimestampConverter() DateTime? createdAt,
      List<UserReaction>? reactions});

  @override
  $UserMinimumCopyWith<$Res>? get userDetails;
  @override
  $UserMinimumCopyWith<$Res>? get repliedToUserDetails;
}

/// @nodoc
class __$$_FeedCommentReplyModelCopyWithImpl<$Res>
    extends _$FeedCommentReplyModelCopyWithImpl<$Res, _$_FeedCommentReplyModel>
    implements _$$_FeedCommentReplyModelCopyWith<$Res> {
  __$$_FeedCommentReplyModelCopyWithImpl(_$_FeedCommentReplyModel _value,
      $Res Function(_$_FeedCommentReplyModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? commentId = freezed,
    Object? feedId = freezed,
    Object? userDetails = freezed,
    Object? repliedToUserDetails = freezed,
    Object? commentReplyText = freezed,
    Object? createdAt = freezed,
    Object? reactions = freezed,
  }) {
    return _then(_$_FeedCommentReplyModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      commentId: freezed == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as String?,
      feedId: freezed == feedId
          ? _value.feedId
          : feedId // ignore: cast_nullable_to_non_nullable
              as String?,
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserMinimum?,
      repliedToUserDetails: freezed == repliedToUserDetails
          ? _value.repliedToUserDetails
          : repliedToUserDetails // ignore: cast_nullable_to_non_nullable
              as UserMinimum?,
      commentReplyText: freezed == commentReplyText
          ? _value.commentReplyText
          : commentReplyText // ignore: cast_nullable_to_non_nullable
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
class _$_FeedCommentReplyModel implements _FeedCommentReplyModel {
  const _$_FeedCommentReplyModel(
      {this.id,
      this.commentId,
      this.feedId,
      this.userDetails,
      this.repliedToUserDetails,
      this.commentReplyText,
      @TimestampConverter() this.createdAt,
      this.reactions});

  factory _$_FeedCommentReplyModel.fromJson(Map<String, dynamic> json) =>
      _$$_FeedCommentReplyModelFromJson(json);

  @override
  final String? id;
  @override
  final String? commentId;
  @override
  final String? feedId;
  @override
  final UserMinimum? userDetails;
  @override
  final UserMinimum? repliedToUserDetails;
  @override
  final String? commentReplyText;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  final List<UserReaction>? reactions;

  @override
  String toString() {
    return 'FeedCommentReplyModel(id: $id, commentId: $commentId, feedId: $feedId, userDetails: $userDetails, repliedToUserDetails: $repliedToUserDetails, commentReplyText: $commentReplyText, createdAt: $createdAt, reactions: $reactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeedCommentReplyModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.feedId, feedId) || other.feedId == feedId) &&
            (identical(other.userDetails, userDetails) ||
                other.userDetails == userDetails) &&
            (identical(other.repliedToUserDetails, repliedToUserDetails) ||
                other.repliedToUserDetails == repliedToUserDetails) &&
            (identical(other.commentReplyText, commentReplyText) ||
                other.commentReplyText == commentReplyText) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.reactions, reactions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      commentId,
      feedId,
      userDetails,
      repliedToUserDetails,
      commentReplyText,
      createdAt,
      const DeepCollectionEquality().hash(reactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeedCommentReplyModelCopyWith<_$_FeedCommentReplyModel> get copyWith =>
      __$$_FeedCommentReplyModelCopyWithImpl<_$_FeedCommentReplyModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeedCommentReplyModelToJson(
      this,
    );
  }
}

abstract class _FeedCommentReplyModel implements FeedCommentReplyModel {
  const factory _FeedCommentReplyModel(
      {final String? id,
      final String? commentId,
      final String? feedId,
      final UserMinimum? userDetails,
      final UserMinimum? repliedToUserDetails,
      final String? commentReplyText,
      @TimestampConverter() final DateTime? createdAt,
      final List<UserReaction>? reactions}) = _$_FeedCommentReplyModel;

  factory _FeedCommentReplyModel.fromJson(Map<String, dynamic> json) =
      _$_FeedCommentReplyModel.fromJson;

  @override
  String? get id;
  @override
  String? get commentId;
  @override
  String? get feedId;
  @override
  UserMinimum? get userDetails;
  @override
  UserMinimum? get repliedToUserDetails;
  @override
  String? get commentReplyText;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  List<UserReaction>? get reactions;
  @override
  @JsonKey(ignore: true)
  _$$_FeedCommentReplyModelCopyWith<_$_FeedCommentReplyModel> get copyWith =>
      throw _privateConstructorUsedError;
}
