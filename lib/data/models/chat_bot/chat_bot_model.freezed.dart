// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_bot_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ChatBotModel _$ChatBotModelFromJson(Map<String, dynamic> json) {
  return _ChatBotModel.fromJson(json);
}

/// @nodoc
mixin _$ChatBotModel {
  String? get id => throw _privateConstructorUsedError;
  List<ChatBotConversationModel>? get chatConversations =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ChatBotModelCopyWith<ChatBotModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatBotModelCopyWith<$Res> {
  factory $ChatBotModelCopyWith(
          ChatBotModel value, $Res Function(ChatBotModel) then) =
      _$ChatBotModelCopyWithImpl<$Res, ChatBotModel>;
  @useResult
  $Res call({String? id, List<ChatBotConversationModel>? chatConversations});
}

/// @nodoc
class _$ChatBotModelCopyWithImpl<$Res, $Val extends ChatBotModel>
    implements $ChatBotModelCopyWith<$Res> {
  _$ChatBotModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chatConversations = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      chatConversations: freezed == chatConversations
          ? _value.chatConversations
          : chatConversations // ignore: cast_nullable_to_non_nullable
              as List<ChatBotConversationModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ChatBotModelCopyWith<$Res>
    implements $ChatBotModelCopyWith<$Res> {
  factory _$$_ChatBotModelCopyWith(
          _$_ChatBotModel value, $Res Function(_$_ChatBotModel) then) =
      __$$_ChatBotModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, List<ChatBotConversationModel>? chatConversations});
}

/// @nodoc
class __$$_ChatBotModelCopyWithImpl<$Res>
    extends _$ChatBotModelCopyWithImpl<$Res, _$_ChatBotModel>
    implements _$$_ChatBotModelCopyWith<$Res> {
  __$$_ChatBotModelCopyWithImpl(
      _$_ChatBotModel _value, $Res Function(_$_ChatBotModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? chatConversations = freezed,
  }) {
    return _then(_$_ChatBotModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      chatConversations: freezed == chatConversations
          ? _value.chatConversations
          : chatConversations // ignore: cast_nullable_to_non_nullable
              as List<ChatBotConversationModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ChatBotModel implements _ChatBotModel {
  const _$_ChatBotModel({this.id, this.chatConversations});

  factory _$_ChatBotModel.fromJson(Map<String, dynamic> json) =>
      _$$_ChatBotModelFromJson(json);

  @override
  final String? id;
  @override
  final List<ChatBotConversationModel>? chatConversations;

  @override
  String toString() {
    return 'ChatBotModel(id: $id, chatConversations: $chatConversations)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChatBotModel &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality()
                .equals(other.chatConversations, chatConversations));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, const DeepCollectionEquality().hash(chatConversations));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChatBotModelCopyWith<_$_ChatBotModel> get copyWith =>
      __$$_ChatBotModelCopyWithImpl<_$_ChatBotModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ChatBotModelToJson(
      this,
    );
  }
}

abstract class _ChatBotModel implements ChatBotModel {
  const factory _ChatBotModel(
          {final String? id,
          final List<ChatBotConversationModel>? chatConversations}) =
      _$_ChatBotModel;

  factory _ChatBotModel.fromJson(Map<String, dynamic> json) =
      _$_ChatBotModel.fromJson;

  @override
  String? get id;
  @override
  List<ChatBotConversationModel>? get chatConversations;
  @override
  @JsonKey(ignore: true)
  _$$_ChatBotModelCopyWith<_$_ChatBotModel> get copyWith =>
      throw _privateConstructorUsedError;
}
