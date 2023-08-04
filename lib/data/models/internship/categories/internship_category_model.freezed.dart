// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'internship_category_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

InternshipCategoryModel _$InternshipCategoryModelFromJson(
    Map<String, dynamic> json) {
  return _InternshipCategoryModel.fromJson(json);
}

/// @nodoc
mixin _$InternshipCategoryModel {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get coverImageUrl => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime? get createdAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InternshipCategoryModelCopyWith<InternshipCategoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InternshipCategoryModelCopyWith<$Res> {
  factory $InternshipCategoryModelCopyWith(InternshipCategoryModel value,
          $Res Function(InternshipCategoryModel) then) =
      _$InternshipCategoryModelCopyWithImpl<$Res, InternshipCategoryModel>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? coverImageUrl,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class _$InternshipCategoryModelCopyWithImpl<$Res,
        $Val extends InternshipCategoryModel>
    implements $InternshipCategoryModelCopyWith<$Res> {
  _$InternshipCategoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? coverImageUrl = freezed,
    Object? createdAt = freezed,
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
      coverImageUrl: freezed == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InternshipCategoryModelCopyWith<$Res>
    implements $InternshipCategoryModelCopyWith<$Res> {
  factory _$$_InternshipCategoryModelCopyWith(_$_InternshipCategoryModel value,
          $Res Function(_$_InternshipCategoryModel) then) =
      __$$_InternshipCategoryModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? coverImageUrl,
      @TimestampConverter() DateTime? createdAt});
}

/// @nodoc
class __$$_InternshipCategoryModelCopyWithImpl<$Res>
    extends _$InternshipCategoryModelCopyWithImpl<$Res,
        _$_InternshipCategoryModel>
    implements _$$_InternshipCategoryModelCopyWith<$Res> {
  __$$_InternshipCategoryModelCopyWithImpl(_$_InternshipCategoryModel _value,
      $Res Function(_$_InternshipCategoryModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? coverImageUrl = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$_InternshipCategoryModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      coverImageUrl: freezed == coverImageUrl
          ? _value.coverImageUrl
          : coverImageUrl // ignore: cast_nullable_to_non_nullable
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
class _$_InternshipCategoryModel implements _InternshipCategoryModel {
  const _$_InternshipCategoryModel(
      {this.id,
      this.name,
      this.coverImageUrl,
      @TimestampConverter() this.createdAt});

  factory _$_InternshipCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$$_InternshipCategoryModelFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? coverImageUrl;
  @override
  @TimestampConverter()
  final DateTime? createdAt;

  @override
  String toString() {
    return 'InternshipCategoryModel(id: $id, name: $name, coverImageUrl: $coverImageUrl, createdAt: $createdAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_InternshipCategoryModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.coverImageUrl, coverImageUrl) ||
                other.coverImageUrl == coverImageUrl) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, coverImageUrl, createdAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InternshipCategoryModelCopyWith<_$_InternshipCategoryModel>
      get copyWith =>
          __$$_InternshipCategoryModelCopyWithImpl<_$_InternshipCategoryModel>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_InternshipCategoryModelToJson(
      this,
    );
  }
}

abstract class _InternshipCategoryModel implements InternshipCategoryModel {
  const factory _InternshipCategoryModel(
          {final String? id,
          final String? name,
          final String? coverImageUrl,
          @TimestampConverter() final DateTime? createdAt}) =
      _$_InternshipCategoryModel;

  factory _InternshipCategoryModel.fromJson(Map<String, dynamic> json) =
      _$_InternshipCategoryModel.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get coverImageUrl;
  @override
  @TimestampConverter()
  DateTime? get createdAt;
  @override
  @JsonKey(ignore: true)
  _$$_InternshipCategoryModelCopyWith<_$_InternshipCategoryModel>
      get copyWith => throw _privateConstructorUsedError;
}
