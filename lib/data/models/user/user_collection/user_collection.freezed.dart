// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_collection.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserCollection _$UserCollectionFromJson(Map<String, dynamic> json) {
  return _UserCollection.fromJson(json);
}

/// @nodoc
mixin _$UserCollection {
  String? get id => throw _privateConstructorUsedError;
  String? get name => throw _privateConstructorUsedError;
  String? get tagline => throw _privateConstructorUsedError;
  String? get iconUrl => throw _privateConstructorUsedError;
  @ColorConverter()
  Color? get color => throw _privateConstructorUsedError;
  List<UserCollectionItem>? get item => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCollectionCopyWith<UserCollection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCollectionCopyWith<$Res> {
  factory $UserCollectionCopyWith(
          UserCollection value, $Res Function(UserCollection) then) =
      _$UserCollectionCopyWithImpl<$Res, UserCollection>;
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? tagline,
      String? iconUrl,
      @ColorConverter() Color? color,
      List<UserCollectionItem>? item});
}

/// @nodoc
class _$UserCollectionCopyWithImpl<$Res, $Val extends UserCollection>
    implements $UserCollectionCopyWith<$Res> {
  _$UserCollectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? tagline = freezed,
    Object? iconUrl = freezed,
    Object? color = freezed,
    Object? item = freezed,
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
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as List<UserCollectionItem>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCollectionCopyWith<$Res>
    implements $UserCollectionCopyWith<$Res> {
  factory _$$_UserCollectionCopyWith(
          _$_UserCollection value, $Res Function(_$_UserCollection) then) =
      __$$_UserCollectionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? name,
      String? tagline,
      String? iconUrl,
      @ColorConverter() Color? color,
      List<UserCollectionItem>? item});
}

/// @nodoc
class __$$_UserCollectionCopyWithImpl<$Res>
    extends _$UserCollectionCopyWithImpl<$Res, _$_UserCollection>
    implements _$$_UserCollectionCopyWith<$Res> {
  __$$_UserCollectionCopyWithImpl(
      _$_UserCollection _value, $Res Function(_$_UserCollection) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? tagline = freezed,
    Object? iconUrl = freezed,
    Object? color = freezed,
    Object? item = freezed,
  }) {
    return _then(_$_UserCollection(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      iconUrl: freezed == iconUrl
          ? _value.iconUrl
          : iconUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      color: freezed == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as Color?,
      item: freezed == item
          ? _value.item
          : item // ignore: cast_nullable_to_non_nullable
              as List<UserCollectionItem>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UserCollection implements _UserCollection {
  const _$_UserCollection(
      {this.id,
      this.name,
      this.tagline,
      this.iconUrl,
      @ColorConverter() this.color,
      this.item});

  factory _$_UserCollection.fromJson(Map<String, dynamic> json) =>
      _$$_UserCollectionFromJson(json);

  @override
  final String? id;
  @override
  final String? name;
  @override
  final String? tagline;
  @override
  final String? iconUrl;
  @override
  @ColorConverter()
  final Color? color;
  @override
  final List<UserCollectionItem>? item;

  @override
  String toString() {
    return 'UserCollection(id: $id, name: $name, tagline: $tagline, iconUrl: $iconUrl, color: $color, item: $item)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserCollection &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.tagline, tagline) || other.tagline == tagline) &&
            (identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl) &&
            (identical(other.color, color) || other.color == color) &&
            const DeepCollectionEquality().equals(other.item, item));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, tagline, iconUrl,
      color, const DeepCollectionEquality().hash(item));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCollectionCopyWith<_$_UserCollection> get copyWith =>
      __$$_UserCollectionCopyWithImpl<_$_UserCollection>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_UserCollectionToJson(
      this,
    );
  }
}

abstract class _UserCollection implements UserCollection {
  const factory _UserCollection(
      {final String? id,
      final String? name,
      final String? tagline,
      final String? iconUrl,
      @ColorConverter() final Color? color,
      final List<UserCollectionItem>? item}) = _$_UserCollection;

  factory _UserCollection.fromJson(Map<String, dynamic> json) =
      _$_UserCollection.fromJson;

  @override
  String? get id;
  @override
  String? get name;
  @override
  String? get tagline;
  @override
  String? get iconUrl;
  @override
  @ColorConverter()
  Color? get color;
  @override
  List<UserCollectionItem>? get item;
  @override
  @JsonKey(ignore: true)
  _$$_UserCollectionCopyWith<_$_UserCollection> get copyWith =>
      throw _privateConstructorUsedError;
}
