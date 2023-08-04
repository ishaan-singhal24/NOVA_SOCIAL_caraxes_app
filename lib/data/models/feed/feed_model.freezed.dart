// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'feed_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FeedModel _$FeedModelFromJson(Map<String, dynamic> json) {
  return _FeedModel.fromJson(json);
}

/// @nodoc
mixin _$FeedModel {
  String? get id => throw _privateConstructorUsedError;
  UserMinimum? get userDetails => throw _privateConstructorUsedError;
  String? get feedText => throw _privateConstructorUsedError;
  List<String>? get generatedFeedUrl => throw _privateConstructorUsedError;
  List<FeedCommentModel>? get comments => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;
  List<UserReaction>? get reactions => throw _privateConstructorUsedError;
  List<UserMinimum>? get reportedAbusiveBy =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FeedModelCopyWith<FeedModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FeedModelCopyWith<$Res> {
  factory $FeedModelCopyWith(FeedModel value, $Res Function(FeedModel) then) =
      _$FeedModelCopyWithImpl<$Res, FeedModel>;
  @useResult
  $Res call(
      {String? id,
      UserMinimum? userDetails,
      String? feedText,
      List<String>? generatedFeedUrl,
      List<FeedCommentModel>? comments,
      @TimestampConverter() DateTime? createdAt,
      List<UserReaction>? reactions,
      List<UserMinimum>? reportedAbusiveBy});

  $UserMinimumCopyWith<$Res>? get userDetails;
}

/// @nodoc
class _$FeedModelCopyWithImpl<$Res, $Val extends FeedModel>
    implements $FeedModelCopyWith<$Res> {
  _$FeedModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userDetails = freezed,
    Object? feedText = freezed,
    Object? generatedFeedUrl = freezed,
    Object? comments = freezed,
    Object? createdAt = freezed,
    Object? reactions = freezed,
    Object? reportedAbusiveBy = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserMinimum?,
      feedText: freezed == feedText
          ? _value.feedText
          : feedText // ignore: cast_nullable_to_non_nullable
              as String?,
      generatedFeedUrl: freezed == generatedFeedUrl
          ? _value.generatedFeedUrl
          : generatedFeedUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<FeedCommentModel>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reactions: freezed == reactions
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<UserReaction>?,
      reportedAbusiveBy: freezed == reportedAbusiveBy
          ? _value.reportedAbusiveBy
          : reportedAbusiveBy // ignore: cast_nullable_to_non_nullable
              as List<UserMinimum>?,
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
abstract class _$$_FeedModelCopyWith<$Res> implements $FeedModelCopyWith<$Res> {
  factory _$$_FeedModelCopyWith(
          _$_FeedModel value, $Res Function(_$_FeedModel) then) =
      __$$_FeedModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      UserMinimum? userDetails,
      String? feedText,
      List<String>? generatedFeedUrl,
      List<FeedCommentModel>? comments,
      @TimestampConverter() DateTime? createdAt,
      List<UserReaction>? reactions,
      List<UserMinimum>? reportedAbusiveBy});

  @override
  $UserMinimumCopyWith<$Res>? get userDetails;
}

/// @nodoc
class __$$_FeedModelCopyWithImpl<$Res>
    extends _$FeedModelCopyWithImpl<$Res, _$_FeedModel>
    implements _$$_FeedModelCopyWith<$Res> {
  __$$_FeedModelCopyWithImpl(
      _$_FeedModel _value, $Res Function(_$_FeedModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userDetails = freezed,
    Object? feedText = freezed,
    Object? generatedFeedUrl = freezed,
    Object? comments = freezed,
    Object? createdAt = freezed,
    Object? reactions = freezed,
    Object? reportedAbusiveBy = freezed,
  }) {
    return _then(_$_FeedModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userDetails: freezed == userDetails
          ? _value.userDetails
          : userDetails // ignore: cast_nullable_to_non_nullable
              as UserMinimum?,
      feedText: freezed == feedText
          ? _value.feedText
          : feedText // ignore: cast_nullable_to_non_nullable
              as String?,
      generatedFeedUrl: freezed == generatedFeedUrl
          ? _value.generatedFeedUrl
          : generatedFeedUrl // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      comments: freezed == comments
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<FeedCommentModel>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      reactions: freezed == reactions
          ? _value.reactions
          : reactions // ignore: cast_nullable_to_non_nullable
              as List<UserReaction>?,
      reportedAbusiveBy: freezed == reportedAbusiveBy
          ? _value.reportedAbusiveBy
          : reportedAbusiveBy // ignore: cast_nullable_to_non_nullable
              as List<UserMinimum>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FeedModel implements _FeedModel {
  const _$_FeedModel(
      {this.id,
      this.userDetails,
      this.feedText,
      this.generatedFeedUrl,
      this.comments,
      @TimestampConverter() this.createdAt,
      this.reactions,
      this.reportedAbusiveBy});

  factory _$_FeedModel.fromJson(Map<String, dynamic> json) =>
      _$$_FeedModelFromJson(json);

  @override
  final String? id;
  @override
  final UserMinimum? userDetails;
  @override
  final String? feedText;
  @override
  final List<String>? generatedFeedUrl;
  @override
  final List<FeedCommentModel>? comments;
  @override
  @TimestampConverter()
  final DateTime? createdAt;
  @override
  final List<UserReaction>? reactions;
  @override
  final List<UserMinimum>? reportedAbusiveBy;

  @override
  String toString() {
    return 'FeedModel(id: $id, userDetails: $userDetails, feedText: $feedText, generatedFeedUrl: $generatedFeedUrl, comments: $comments, createdAt: $createdAt, reactions: $reactions, reportedAbusiveBy: $reportedAbusiveBy)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FeedModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userDetails, userDetails) ||
                other.userDetails == userDetails) &&
            (identical(other.feedText, feedText) ||
                other.feedText == feedText) &&
            const DeepCollectionEquality()
                .equals(other.generatedFeedUrl, generatedFeedUrl) &&
            const DeepCollectionEquality().equals(other.comments, comments) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other.reactions, reactions) &&
            const DeepCollectionEquality()
                .equals(other.reportedAbusiveBy, reportedAbusiveBy));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userDetails,
      feedText,
      const DeepCollectionEquality().hash(generatedFeedUrl),
      const DeepCollectionEquality().hash(comments),
      createdAt,
      const DeepCollectionEquality().hash(reactions),
      const DeepCollectionEquality().hash(reportedAbusiveBy));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FeedModelCopyWith<_$_FeedModel> get copyWith =>
      __$$_FeedModelCopyWithImpl<_$_FeedModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FeedModelToJson(
      this,
    );
  }
}

abstract class _FeedModel implements FeedModel {
  const factory _FeedModel(
      {final String? id,
      final UserMinimum? userDetails,
      final String? feedText,
      final List<String>? generatedFeedUrl,
      final List<FeedCommentModel>? comments,
      @TimestampConverter() final DateTime? createdAt,
      final List<UserReaction>? reactions,
      final List<UserMinimum>? reportedAbusiveBy}) = _$_FeedModel;

  factory _FeedModel.fromJson(Map<String, dynamic> json) =
      _$_FeedModel.fromJson;

  @override
  String? get id;
  @override
  UserMinimum? get userDetails;
  @override
  String? get feedText;
  @override
  List<String>? get generatedFeedUrl;
  @override
  List<FeedCommentModel>? get comments;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  List<UserReaction>? get reactions;
  @override
  List<UserMinimum>? get reportedAbusiveBy;
  @override
  @JsonKey(ignore: true)
  _$$_FeedModelCopyWith<_$_FeedModel> get copyWith =>
      throw _privateConstructorUsedError;
}
