// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playground_suggestions_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PlaygroundSuggestionsModel _$PlaygroundSuggestionsModelFromJson(
    Map<String, dynamic> json) {
  return _PlaygroundSuggestionsModel.fromJson(json);
}

/// @nodoc
mixin _$PlaygroundSuggestionsModel {
  String? get tip => throw _privateConstructorUsedError;
  String? get prompt => throw _privateConstructorUsedError;
  String? get imageUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaygroundSuggestionsModelCopyWith<PlaygroundSuggestionsModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaygroundSuggestionsModelCopyWith<$Res> {
  factory $PlaygroundSuggestionsModelCopyWith(PlaygroundSuggestionsModel value,
          $Res Function(PlaygroundSuggestionsModel) then) =
      _$PlaygroundSuggestionsModelCopyWithImpl<$Res,
          PlaygroundSuggestionsModel>;
  @useResult
  $Res call({String? tip, String? prompt, String? imageUrl});
}

/// @nodoc
class _$PlaygroundSuggestionsModelCopyWithImpl<$Res,
        $Val extends PlaygroundSuggestionsModel>
    implements $PlaygroundSuggestionsModelCopyWith<$Res> {
  _$PlaygroundSuggestionsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tip = freezed,
    Object? prompt = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_value.copyWith(
      tip: freezed == tip
          ? _value.tip
          : tip // ignore: cast_nullable_to_non_nullable
              as String?,
      prompt: freezed == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PlaygroundSuggestionsModelCopyWith<$Res>
    implements $PlaygroundSuggestionsModelCopyWith<$Res> {
  factory _$$_PlaygroundSuggestionsModelCopyWith(
          _$_PlaygroundSuggestionsModel value,
          $Res Function(_$_PlaygroundSuggestionsModel) then) =
      __$$_PlaygroundSuggestionsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? tip, String? prompt, String? imageUrl});
}

/// @nodoc
class __$$_PlaygroundSuggestionsModelCopyWithImpl<$Res>
    extends _$PlaygroundSuggestionsModelCopyWithImpl<$Res,
        _$_PlaygroundSuggestionsModel>
    implements _$$_PlaygroundSuggestionsModelCopyWith<$Res> {
  __$$_PlaygroundSuggestionsModelCopyWithImpl(
      _$_PlaygroundSuggestionsModel _value,
      $Res Function(_$_PlaygroundSuggestionsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tip = freezed,
    Object? prompt = freezed,
    Object? imageUrl = freezed,
  }) {
    return _then(_$_PlaygroundSuggestionsModel(
      tip: freezed == tip
          ? _value.tip
          : tip // ignore: cast_nullable_to_non_nullable
              as String?,
      prompt: freezed == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as String?,
      imageUrl: freezed == imageUrl
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PlaygroundSuggestionsModel implements _PlaygroundSuggestionsModel {
  const _$_PlaygroundSuggestionsModel({this.tip, this.prompt, this.imageUrl});

  factory _$_PlaygroundSuggestionsModel.fromJson(Map<String, dynamic> json) =>
      _$$_PlaygroundSuggestionsModelFromJson(json);

  @override
  final String? tip;
  @override
  final String? prompt;
  @override
  final String? imageUrl;

  @override
  String toString() {
    return 'PlaygroundSuggestionsModel(tip: $tip, prompt: $prompt, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PlaygroundSuggestionsModel &&
            (identical(other.tip, tip) || other.tip == tip) &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.imageUrl, imageUrl) ||
                other.imageUrl == imageUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tip, prompt, imageUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PlaygroundSuggestionsModelCopyWith<_$_PlaygroundSuggestionsModel>
      get copyWith => __$$_PlaygroundSuggestionsModelCopyWithImpl<
          _$_PlaygroundSuggestionsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PlaygroundSuggestionsModelToJson(
      this,
    );
  }
}

abstract class _PlaygroundSuggestionsModel
    implements PlaygroundSuggestionsModel {
  const factory _PlaygroundSuggestionsModel(
      {final String? tip,
      final String? prompt,
      final String? imageUrl}) = _$_PlaygroundSuggestionsModel;

  factory _PlaygroundSuggestionsModel.fromJson(Map<String, dynamic> json) =
      _$_PlaygroundSuggestionsModel.fromJson;

  @override
  String? get tip;
  @override
  String? get prompt;
  @override
  String? get imageUrl;
  @override
  @JsonKey(ignore: true)
  _$$_PlaygroundSuggestionsModelCopyWith<_$_PlaygroundSuggestionsModel>
      get copyWith => throw _privateConstructorUsedError;
}
