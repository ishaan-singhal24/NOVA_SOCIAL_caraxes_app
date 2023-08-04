// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playground_feed_comment_reply_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaygroundFeedCommentReplyModel _$PlaygroundFeedCommentReplyModelFromJson(
    Map<String, dynamic> json) {
  return _PlaygroundFeedCommentReplyModel.fromJson(json);
}

/// @nodoc
mixin _$PlaygroundFeedCommentReplyModel {
  String? get id => throw _privateConstructorUsedError;
  String? get playgroundcommentId => throw _privateConstructorUsedError;
  String? get playgroundFeedId => throw _privateConstructorUsedError;
  UserMinimum? get userDetails => throw _privateConstructorUsedError;
  UserMinimum? get repliedToUserDetails => throw _privateConstructorUsedError;
  String? get commentReplyText => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  List<UserReaction>? get reactions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaygroundFeedCommentReplyModelCopyWith<PlaygroundFeedCommentReplyModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaygroundFeedCommentReplyModelCopyWith<$Res> {
  factory $PlaygroundFeedCommentReplyModelCopyWith(
          PlaygroundFeedCommentReplyModel value,
          $Res Function(PlaygroundFeedCommentReplyModel) then) =
      _$PlaygroundFeedCommentReplyModelCopyWithImpl<$Res,
          PlaygroundFeedCommentReplyModel>;
  @useResult
  $Res call(
      {String? id,
      String? playgroundcommentId,
      String? playgroundFeedId,
      UserMinimum? userDetails,
      UserMinimum? repliedToUserDetails,
      String? commentReplyText,
      @TimestampConverter() DateTime? createdAt,
      List<UserReaction>? reactions});

  $UserMinimumCopyWith<$Res>? get userDetails;
  $UserMinimumCopyWith<$Res>? get repliedToUserDetails;
}

/// @nodoc
class _$PlaygroundFeedCommentReplyModelCopyWithImpl<$Res,
        $Val extends PlaygroundFeedCommentReplyModel>
    implements $PlaygroundFeedCommentReplyModelCopyWith<$Res> {
  _$PlaygroundFeedCommentReplyModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? playgroundcommentId = freezed,
    Object? playgroundFeedId = freezed,
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
      playgroundcommentId: freezed == playgroundcommentId
          ? _value.playgroundcommentId
          : playgroundcommentId // ignore: cast_nullable_to_non_nullable
              as String?,
      playgroundFeedId: freezed == playgroundFeedId
          ? _value.playgroundFeedId
          : playgroundFeedId // ignore: cast_nullable_to_non_nullable
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
abstract class _$$_PlaygroundFeedCommentReplyModelCopyWith<$Res>
    implements $PlaygroundFeedCommentReplyModelCopyWith<$Res> {
  factory _$$_PlaygroundFeedCommentReplyModelCopyWith(
          _$_PlaygroundFeedCommentReplyModel value,
          $Res Function(_$_PlaygroundFeedCommentReplyModel) then) =
      __$$_PlaygroundFeedCommentReplyModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? playgroundcommentId,
      String? playgroundFeedId,
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
class __$$_PlaygroundFeedCommentReplyModelCopyWithImpl<$Res>
    extends _$PlaygroundFeedCommentReplyModelCopyWithImpl<$Res,
        _$_PlaygroundFeedCommentReplyModel>
    implements _$$_PlaygroundFeedCommentReplyModelCopyWith<$Res> {
  __$$_PlaygroundFeedCommentReplyModelCopyWithImpl(
      _$_PlaygroundFeedCommentReplyModel _value,
      $Res Function(_$_PlaygroundFeedCommentReplyModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? playgroundcommentId = freezed,
    Object? playgroundFeedId = freezed,
    Object? userDetails = freezed,
    Object? repliedToUserDetails = freezed,
    Object? commentReplyText = freezed,
    Object? createdAt = freezed,
    Object? reactions = freezed,
  }) {
    return _then(_$_PlaygroundFeedCommentReplyModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      playgroundcommentId: freezed == playgroundcommentId
          ? _value.playgroundcommentId
          : playgroundcommentId // ignore: cast_nullable_to_non_nullable
              as String?,
      playgroundFeedId: freezed == playgroundFeedId
          ? _value.playgroundFeedId
          : playgroundFeedId // ignore: cast_nullable_to_non_nullable
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
class _$_PlaygroundFeedCommentReplyModel
    implements _PlaygroundFeedCommentReplyModel {
  const _$_PlaygroundFeedCommentReplyModel(
      {this.id,
      this.playgroundcommentId,
      this.playgroundFeedId,
      this.userDetails,
      this.repliedToUserDetails,
      this.commentReplyText,
      @TimestampConverter() this.createdAt,
      this.reactions});

  factory _$_PlaygroundFeedCommentReplyModel.fromJson(
          Map<String, dynamic> json) =>
      _$$_PlaygroundFeedCommentReplyModelFromJson(json);

  @override
  final String? id;
  @override
  final String? playgroundcommentId;
  @override
  final String? playgroundFeedId;
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
    return 'PlaygroundFeedCommentReplyModel(id: $id, playgroundcommentId: $playgroundcommentId, playgroundFeedId: $playgroundFeedId, userDetails: $userDetails, repliedToUserDetails: $repliedToUserDetails, commentReplyText: $commentReplyText, createdAt: $createdAt, reactions: $reactions)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaygroundFeedCommentReplyModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.playgroundcommentId, playgroundcommentId) ||
                other.playgroundcommentId == playgroundcommentId) &&
            (identical(other.playgroundFeedId, playgroundFeedId) ||
                other.playgroundFeedId == playgroundFeedId) &&
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
      playgroundcommentId,
      playgroundFeedId,
      userDetails,
      repliedToUserDetails,
      commentReplyText,
      createdAt,
      const DeepCollectionEquality().hash(reactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaygroundFeedCommentReplyModelCopyWith<
          _$_PlaygroundFeedCommentReplyModel>
      get copyWith => __$$_PlaygroundFeedCommentReplyModelCopyWithImpl<
          _$_PlaygroundFeedCommentReplyModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlaygroundFeedCommentReplyModelToJson(
      this,
    );
  }
}

abstract class _PlaygroundFeedCommentReplyModel
    implements PlaygroundFeedCommentReplyModel {
  const factory _PlaygroundFeedCommentReplyModel(
          {final String? id,
          final String? playgroundcommentId,
          final String? playgroundFeedId,
          final UserMinimum? userDetails,
          final UserMinimum? repliedToUserDetails,
          final String? commentReplyText,
          @TimestampConverter() final DateTime? createdAt,
          final List<UserReaction>? reactions}) =
      _$_PlaygroundFeedCommentReplyModel;

  factory _PlaygroundFeedCommentReplyModel.fromJson(Map<String, dynamic> json) =
      _$_PlaygroundFeedCommentReplyModel.fromJson;

  @override
  String? get id;
  @override
  String? get playgroundcommentId;
  @override
  String? get playgroundFeedId;
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
  _$$_PlaygroundFeedCommentReplyModelCopyWith<
          _$_PlaygroundFeedCommentReplyModel>
      get copyWith => throw _privateConstructorUsedError;
}
