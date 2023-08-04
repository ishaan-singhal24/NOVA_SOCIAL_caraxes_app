// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_location.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserLocation _$UserLocationFromJson(Map<String, dynamic> json) {
  return _UserLocation.fromJson(json);
}

/// @nodoc
mixin _$UserLocation {
  String? get id => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;
  String? get state => throw _privateConstructorUsedError;
  String? get country => throw _privateConstructorUsedError;
  String? get concatinated => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  String? get docName => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserLocationCopyWith<UserLocation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserLocationCopyWith<$Res> {
  factory $UserLocationCopyWith(
          UserLocation value, $Res Function(UserLocation) then) =
      _$UserLocationCopyWithImpl<$Res, UserLocation>;
  @useResult
  $Res call(
      {String? id,
      String? city,
      String? state,
      String? country,
      String? concatinated,
      @JsonKey(ignore: true) String? docName});
}

/// @nodoc
class _$UserLocationCopyWithImpl<$Res, $Val extends UserLocation>
    implements $UserLocationCopyWith<$Res> {
  _$UserLocationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? concatinated = freezed,
    Object? docName = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      concatinated: freezed == concatinated
          ? _value.concatinated
          : concatinated // ignore: cast_nullable_to_non_nullable
              as String?,
      docName: freezed == docName
          ? _value.docName
          : docName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserLocationCopyWith<$Res>
    implements $UserLocationCopyWith<$Res> {
  factory _$$_UserLocationCopyWith(
          _$_UserLocation value, $Res Function(_$_UserLocation) then) =
      __$$_UserLocationCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? city,
      String? state,
      String? country,
      String? concatinated,
      @JsonKey(ignore: true) String? docName});
}

/// @nodoc
class __$$_UserLocationCopyWithImpl<$Res>
    extends _$UserLocationCopyWithImpl<$Res, _$_UserLocation>
    implements _$$_UserLocationCopyWith<$Res> {
  __$$_UserLocationCopyWithImpl(
      _$_UserLocation _value, $Res Function(_$_UserLocation) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? concatinated = freezed,
    Object? docName = freezed,
  }) {
    return _then(_$_UserLocation(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      concatinated: freezed == concatinated
          ? _value.concatinated
          : concatinated // ignore: cast_nullable_to_non_nullable
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
class _$_UserLocation implements _UserLocation {
  const _$_UserLocation(
      {this.id,
      this.city,
      this.state,
      this.country,
      this.concatinated,
      @JsonKey(ignore: true) this.docName = AppKeyNames.cities});

  factory _$_UserLocation.fromJson(Map<String, dynamic> json) =>
      _$$_UserLocationFromJson(json);

  @override
  final String? id;
  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? country;
  @override
  final String? concatinated;
  @override
  @JsonKey(ignore: true)
  final String? docName;

  @override
  String toString() {
    return 'UserLocation(id: $id, city: $city, state: $state, country: $country, concatinated: $concatinated, docName: $docName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserLocation &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.concatinated, concatinated) ||
                other.concatinated == concatinated) &&
            (identical(other.docName, docName) || other.docName == docName));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, city, state, country, concatinated, docName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserLocationCopyWith<_$_UserLocation> get copyWith =>
      __$$_UserLocationCopyWithImpl<_$_UserLocation>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserLocationToJson(
      this,
    );
  }
}

abstract class _UserLocation implements UserLocation {
  const factory _UserLocation(
      {final String? id,
      final String? city,
      final String? state,
      final String? country,
      final String? concatinated,
      @JsonKey(ignore: true) final String? docName}) = _$_UserLocation;

  factory _UserLocation.fromJson(Map<String, dynamic> json) =
      _$_UserLocation.fromJson;

  @override
  String? get id;
  @override
  String? get city;
  @override
  String? get state;
  @override
  String? get country;
  @override
  String? get concatinated;
  @override
  @JsonKey(ignore: true)
  String? get docName;
  @override
  @JsonKey(ignore: true)
  _$$_UserLocationCopyWith<_$_UserLocation> get copyWith =>
      throw _privateConstructorUsedError;
}
