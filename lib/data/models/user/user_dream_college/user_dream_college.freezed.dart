// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_dream_college.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserDreamCollege _$UserDreamCollegeFromJson(Map<String, dynamic> json) {
  return _UserDreamCollege.fromJson(json);
}

/// @nodoc
mixin _$UserDreamCollege {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String? get docName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDreamCollegeCopyWith<UserDreamCollege> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDreamCollegeCopyWith<$Res> {
  factory $UserDreamCollegeCopyWith(
          UserDreamCollege value, $Res Function(UserDreamCollege) then) =
      _$UserDreamCollegeCopyWithImpl<$Res, UserDreamCollege>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? iconUrl,
      String? country,
      @JsonKey(ignore: true) String? docName});
}

/// @nodoc
class _$UserDreamCollegeCopyWithImpl<$Res, $Val extends UserDreamCollege>
    implements $UserDreamCollegeCopyWith<$Res> {
  _$UserDreamCollegeCopyWithImpl(this._value, this._then);

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
    Object? country = freezed,
    Object? docName = freezed,
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
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      docName: freezed == docName
          ? _value.docName
          : docName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserDreamCollegeCopyWith<$Res>
    implements $UserDreamCollegeCopyWith<$Res> {
  factory _$$_UserDreamCollegeCopyWith(
          _$_UserDreamCollege value, $Res Function(_$_UserDreamCollege) then) =
      __$$_UserDreamCollegeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? iconUrl,
      String? country,
      @JsonKey(ignore: true) String? docName});
}

/// @nodoc
class __$$_UserDreamCollegeCopyWithImpl<$Res>
    extends _$UserDreamCollegeCopyWithImpl<$Res, _$_UserDreamCollege>
    implements _$$_UserDreamCollegeCopyWith<$Res> {
  __$$_UserDreamCollegeCopyWithImpl(
      _$_UserDreamCollege _value, $Res Function(_$_UserDreamCollege) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? iconUrl = freezed,
    Object? country = freezed,
    Object? docName = freezed,
  }) {
    return _then(_$_UserDreamCollege(
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
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      docName: freezed == docName
          ? _value.docName
          : docName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserDreamCollege implements _UserDreamCollege {
  const _$_UserDreamCollege(
      {this.id,
      this.name,
      this.iconUrl,
      this.country,
      @JsonKey(ignore: true) this.docName = AppKeyNames.countries});

  factory _$_UserDreamCollege.fromJson(Map<String, dynamic> json) =>
      _$$_UserDreamCollegeFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? iconUrl;
  @override
  final String? country;
  @override
  @JsonKey(ignore: true)
  final String? docName;

  @override
  String toString() {
    return 'UserDreamCollege(id: $id, name: $name, iconUrl: $iconUrl, country: $country, docName: $docName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserDreamCollege &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.docName, docName) || other.docName == docName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, iconUrl, country, docName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserDreamCollegeCopyWith<_$_UserDreamCollege> get copyWith =>
      __$$_UserDreamCollegeCopyWithImpl<_$_UserDreamCollege>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserDreamCollegeToJson(
      this,
    );
  }
}

abstract class _UserDreamCollege
    implements UserDreamCollege, GlobalDocHelperInterface, DreamInterface {
  const factory _UserDreamCollege(
      {final String? id,
      final String? name,
      final String? iconUrl,
      final String? country,
      @JsonKey(ignore: true) final String? docName}) = _$_UserDreamCollege;

  factory _UserDreamCollege.fromJson(Map<String, dynamic> json) =
      _$_UserDreamCollege.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get iconUrl;
  @override
  String? get country;
  @override
  @JsonKey(ignore: true)
  String? get docName;
  @override
  @JsonKey(ignore: true)
  _$$_UserDreamCollegeCopyWith<_$_UserDreamCollege> get copyWith =>
      throw _privateConstructorUsedError;
}
