// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'internship_tags_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InternshipTagsModel _$InternshipTagsModelFromJson(Map<String, dynamic> json) {
  return _InternshipTagsModel.fromJson(json);
}

/// @nodoc
mixin _$InternshipTagsModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InternshipTagsModelCopyWith<InternshipTagsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InternshipTagsModelCopyWith<$Res> {
  factory $InternshipTagsModelCopyWith(
          InternshipTagsModel value, $Res Function(InternshipTagsModel) then) =
      _$InternshipTagsModelCopyWithImpl<$Res, InternshipTagsModel>;
  @useResult
  $Res call({String? id, String? name, String? iconUrl});
}

/// @nodoc
class _$InternshipTagsModelCopyWithImpl<$Res, $Val extends InternshipTagsModel>
    implements $InternshipTagsModelCopyWith<$Res> {
  _$InternshipTagsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? iconUrl = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InternshipTagsModelCopyWith<$Res>
    implements $InternshipTagsModelCopyWith<$Res> {
  factory _$$_InternshipTagsModelCopyWith(_$_InternshipTagsModel value,
          $Res Function(_$_InternshipTagsModel) then) =
      __$$_InternshipTagsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String? name, String? iconUrl});
}

/// @nodoc
class __$$_InternshipTagsModelCopyWithImpl<$Res>
    extends _$InternshipTagsModelCopyWithImpl<$Res, _$_InternshipTagsModel>
    implements _$$_InternshipTagsModelCopyWith<$Res> {
  __$$_InternshipTagsModelCopyWithImpl(_$_InternshipTagsModel _value,
      $Res Function(_$_InternshipTagsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? iconUrl = freezed,
  }) {
    return _then(_$_InternshipTagsModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_InternshipTagsModel implements _InternshipTagsModel {
  const _$_InternshipTagsModel({this.id, this.name, this.iconUrl});

  factory _$_InternshipTagsModel.fromJson(Map<String, dynamic> json) =>
      _$$_InternshipTagsModelFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? iconUrl;

  @override
  String toString() {
    return 'InternshipTagsModel(id: $id, name: $name, iconUrl: $iconUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InternshipTagsModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, iconUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InternshipTagsModelCopyWith<_$_InternshipTagsModel> get copyWith =>
      __$$_InternshipTagsModelCopyWithImpl<_$_InternshipTagsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InternshipTagsModelToJson(
      this,
    );
  }
}

abstract class _InternshipTagsModel implements InternshipTagsModel {
  const factory _InternshipTagsModel(
      {final String? id,
      final String? name,
      final String? iconUrl}) = _$_InternshipTagsModel;

  factory _InternshipTagsModel.fromJson(Map<String, dynamic> json) =
      _$_InternshipTagsModel.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get iconUrl;
  @override
  @JsonKey(ignore: true)
  _$$_InternshipTagsModelCopyWith<_$_InternshipTagsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
