// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'open_ai_chat_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OpenAiChatModel _$OpenAiChatModelFromJson(Map<String, dynamic> json) {
  return _OpenAiChatModel.fromJson(json);
}

/// @nodoc
mixin _$OpenAiChatModel {
  String? get message => throw _privateConstructorUsedError;
  int? get chatIndex => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OpenAiChatModelCopyWith<OpenAiChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OpenAiChatModelCopyWith<$Res> {
  factory $OpenAiChatModelCopyWith(
          OpenAiChatModel value, $Res Function(OpenAiChatModel) then) =
      _$OpenAiChatModelCopyWithImpl<$Res, OpenAiChatModel>;
  @useResult
  $Res call({String? message, int? chatIndex});
}

/// @nodoc
class _$OpenAiChatModelCopyWithImpl<$Res, $Val extends OpenAiChatModel>
    implements $OpenAiChatModelCopyWith<$Res> {
  _$OpenAiChatModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? chatIndex = freezed,
  }) {
    return _then(_value.copyWith(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      chatIndex: freezed == chatIndex
          ? _value.chatIndex
          : chatIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_OpenAiChatModelCopyWith<$Res>
    implements $OpenAiChatModelCopyWith<$Res> {
  factory _$$_OpenAiChatModelCopyWith(
          _$_OpenAiChatModel value, $Res Function(_$_OpenAiChatModel) then) =
      __$$_OpenAiChatModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? message, int? chatIndex});
}

/// @nodoc
class __$$_OpenAiChatModelCopyWithImpl<$Res>
    extends _$OpenAiChatModelCopyWithImpl<$Res, _$_OpenAiChatModel>
    implements _$$_OpenAiChatModelCopyWith<$Res> {
  __$$_OpenAiChatModelCopyWithImpl(
      _$_OpenAiChatModel _value, $Res Function(_$_OpenAiChatModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = freezed,
    Object? chatIndex = freezed,
  }) {
    return _then(_$_OpenAiChatModel(
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      chatIndex: freezed == chatIndex
          ? _value.chatIndex
          : chatIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OpenAiChatModel implements _OpenAiChatModel {
  const _$_OpenAiChatModel({this.message, this.chatIndex});

  factory _$_OpenAiChatModel.fromJson(Map<String, dynamic> json) =>
      _$$_OpenAiChatModelFromJson(json);

  @override
  final String? message;
  @override
  final int? chatIndex;

  @override
  String toString() {
    return 'OpenAiChatModel(message: $message, chatIndex: $chatIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OpenAiChatModel &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.chatIndex, chatIndex) ||
                other.chatIndex == chatIndex));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, message, chatIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OpenAiChatModelCopyWith<_$_OpenAiChatModel> get copyWith =>
      __$$_OpenAiChatModelCopyWithImpl<_$_OpenAiChatModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OpenAiChatModelToJson(
      this,
    );
  }
}

abstract class _OpenAiChatModel implements OpenAiChatModel {
  const factory _OpenAiChatModel(
      {final String? message, final int? chatIndex}) = _$_OpenAiChatModel;

  factory _OpenAiChatModel.fromJson(Map<String, dynamic> json) =
      _$_OpenAiChatModel.fromJson;

  @override
  String? get message;
  @override
  int? get chatIndex;
  @override
  @JsonKey(ignore: true)
  _$$_OpenAiChatModelCopyWith<_$_OpenAiChatModel> get copyWith =>
      throw _privateConstructorUsedError;
}
