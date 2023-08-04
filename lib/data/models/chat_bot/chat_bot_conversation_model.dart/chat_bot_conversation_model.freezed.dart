// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bot_conversation_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatBotConversationModel _$ChatBotConversationModelFromJson(
    Map<String, dynamic> json) {
  return _ChatBotConversationModel.fromJson(json);
}

/// @nodoc
mixin _$ChatBotConversationModel {
  String? get userQuery => throw _privateConstructorUsedError;
  String? get botResponse => throw _privateConstructorUsedError;
  String? get entity => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatBotConversationModelCopyWith<ChatBotConversationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatBotConversationModelCopyWith<$Res> {
  factory $ChatBotConversationModelCopyWith(ChatBotConversationModel value,
          $Res Function(ChatBotConversationModel) then) =
      _$ChatBotConversationModelCopyWithImpl<$Res, ChatBotConversationModel>;
  @useResult
  $Res call(
      {String? userQuery,
      String? botResponse,
      String? entity,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class _$ChatBotConversationModelCopyWithImpl<$Res,
        $Val extends ChatBotConversationModel>
    implements $ChatBotConversationModelCopyWith<$Res> {
  _$ChatBotConversationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userQuery = freezed,
    Object? botResponse = freezed,
    Object? entity = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      userQuery: freezed == userQuery
          ? _value.userQuery
          : userQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      botResponse: freezed == botResponse
          ? _value.botResponse
          : botResponse // ignore: cast_nullable_to_non_nullable
              as String?,
      entity: freezed == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatBotConversationModelCopyWith<$Res>
    implements $ChatBotConversationModelCopyWith<$Res> {
  factory _$$_ChatBotConversationModelCopyWith(
          _$_ChatBotConversationModel value,
          $Res Function(_$_ChatBotConversationModel) then) =
      __$$_ChatBotConversationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? userQuery,
      String? botResponse,
      String? entity,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$$_ChatBotConversationModelCopyWithImpl<$Res>
    extends _$ChatBotConversationModelCopyWithImpl<$Res,
        _$_ChatBotConversationModel>
    implements _$$_ChatBotConversationModelCopyWith<$Res> {
  __$$_ChatBotConversationModelCopyWithImpl(_$_ChatBotConversationModel _value,
      $Res Function(_$_ChatBotConversationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userQuery = freezed,
    Object? botResponse = freezed,
    Object? entity = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_ChatBotConversationModel(
      userQuery: freezed == userQuery
          ? _value.userQuery
          : userQuery // ignore: cast_nullable_to_non_nullable
              as String?,
      botResponse: freezed == botResponse
          ? _value.botResponse
          : botResponse // ignore: cast_nullable_to_non_nullable
              as String?,
      entity: freezed == entity
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatBotConversationModel implements _ChatBotConversationModel {
  const _$_ChatBotConversationModel(
      {this.userQuery,
      this.botResponse,
      this.entity,
      @TimestampConverter() this.createdAt});

  factory _$_ChatBotConversationModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatBotConversationModelFromJson(json);

  @override
  final String? userQuery;
  @override
  final String? botResponse;
  @override
  final String? entity;
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'ChatBotConversationModel(userQuery: $userQuery, botResponse: $botResponse, entity: $entity, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatBotConversationModel &&
            (identical(other.userQuery, userQuery) ||
                other.userQuery == userQuery) &&
            (identical(other.botResponse, botResponse) ||
                other.botResponse == botResponse) &&
            (identical(other.entity, entity) || other.entity == entity) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userQuery, botResponse, entity, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatBotConversationModelCopyWith<_$_ChatBotConversationModel>
      get copyWith => __$$_ChatBotConversationModelCopyWithImpl<
          _$_ChatBotConversationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatBotConversationModelToJson(
      this,
    );
  }
}

abstract class _ChatBotConversationModel implements ChatBotConversationModel {
  const factory _ChatBotConversationModel(
          {final String? userQuery,
          final String? botResponse,
          final String? entity,
          @TimestampConverter() final DateTime? createdAt}) =
      _$_ChatBotConversationModel;

  factory _ChatBotConversationModel.fromJson(Map<String, dynamic> json) =
      _$_ChatBotConversationModel.fromJson;

  @override
  String? get userQuery;
  @override
  String? get botResponse;
  @override
  String? get entity;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_ChatBotConversationModelCopyWith<_$_ChatBotConversationModel>
      get copyWith => throw _privateConstructorUsedError;
}
