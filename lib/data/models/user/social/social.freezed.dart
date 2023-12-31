// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Social _$SocialFromJson(Map<String, dynamic> json) {
  return _Social.fromJson(json);
}

/// @nodoc
mixin _$Social {
  SocialPlatforms? get platform => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SocialCopyWith<Social> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SocialCopyWith<$Res> {
  factory $SocialCopyWith(Social value, $Res Function(Social) then) =
      _$SocialCopyWithImpl<$Res, Social>;
  @useResult
  $Res call({SocialPlatforms? platform, String? url});
}

/// @nodoc
class _$SocialCopyWithImpl<$Res, $Val extends Social>
    implements $SocialCopyWith<$Res> {
  _$SocialCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as SocialPlatforms?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SocialCopyWith<$Res> implements $SocialCopyWith<$Res> {
  factory _$$_SocialCopyWith(_$_Social value, $Res Function(_$_Social) then) =
      __$$_SocialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SocialPlatforms? platform, String? url});
}

/// @nodoc
class __$$_SocialCopyWithImpl<$Res>
    extends _$SocialCopyWithImpl<$Res, _$_Social>
    implements _$$_SocialCopyWith<$Res> {
  __$$_SocialCopyWithImpl(_$_Social _value, $Res Function(_$_Social) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? platform = freezed,
    Object? url = freezed,
  }) {
    return _then(_$_Social(
      platform: freezed == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as SocialPlatforms?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Social implements _Social {
  const _$_Social({this.platform, this.url});

  factory _$_Social.fromJson(Map<String, dynamic> json) =>
      _$$_SocialFromJson(json);

  @override
  final SocialPlatforms? platform;
  @override
  final String? url;

  @override
  String toString() {
    return 'Social(platform: $platform, url: $url)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Social &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, platform, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SocialCopyWith<_$_Social> get copyWith =>
      __$$_SocialCopyWithImpl<_$_Social>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SocialToJson(
      this,
    );
  }
}

abstract class _Social implements Social {
  const factory _Social({final SocialPlatforms? platform, final String? url}) =
      _$_Social;

  factory _Social.fromJson(Map<String, dynamic> json) = _$_Social.fromJson;

  @override
  SocialPlatforms? get platform;
  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$_SocialCopyWith<_$_Social> get copyWith =>
      throw _privateConstructorUsedError;
}
