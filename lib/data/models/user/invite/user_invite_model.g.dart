// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_invite_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$UserInviteModelCWProxy {
  UserInviteModel userId(String? userId);

  UserInviteModel name(String? name);

  UserInviteModel userProfileImageUrl(String? userProfileImageUrl);

  UserInviteModel username(String? username);

  UserInviteModel inviteCode(String? inviteCode);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserInviteModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserInviteModel(...).copyWith(id: 12, name: "My name")
  /// ````
  UserInviteModel call({
    String? userId,
    String? name,
    String? userProfileImageUrl,
    String? username,
    String? inviteCode,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfUserInviteModel.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfUserInviteModel.copyWith.fieldName(...)`
class _$UserInviteModelCWProxyImpl implements _$UserInviteModelCWProxy {
  const _$UserInviteModelCWProxyImpl(this._value);

  final UserInviteModel _value;

  @override
  UserInviteModel userId(String? userId) => this(userId: userId);

  @override
  UserInviteModel name(String? name) => this(name: name);

  @override
  UserInviteModel userProfileImageUrl(String? userProfileImageUrl) =>
      this(userProfileImageUrl: userProfileImageUrl);

  @override
  UserInviteModel username(String? username) => this(username: username);

  @override
  UserInviteModel inviteCode(String? inviteCode) =>
      this(inviteCode: inviteCode);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `UserInviteModel(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// UserInviteModel(...).copyWith(id: 12, name: "My name")
  /// ````
  UserInviteModel call({
    Object? userId = const $CopyWithPlaceholder(),
    Object? name = const $CopyWithPlaceholder(),
    Object? userProfileImageUrl = const $CopyWithPlaceholder(),
    Object? username = const $CopyWithPlaceholder(),
    Object? inviteCode = const $CopyWithPlaceholder(),
  }) {
    return UserInviteModel(
      userId: userId == const $CopyWithPlaceholder()
          ? _value.userId
          // ignore: cast_nullable_to_non_nullable
          : userId as String?,
      name: name == const $CopyWithPlaceholder()
          ? _value.name
          // ignore: cast_nullable_to_non_nullable
          : name as String?,
      userProfileImageUrl: userProfileImageUrl == const $CopyWithPlaceholder()
          ? _value.userProfileImageUrl
          // ignore: cast_nullable_to_non_nullable
          : userProfileImageUrl as String?,
      username: username == const $CopyWithPlaceholder()
          ? _value.username
          // ignore: cast_nullable_to_non_nullable
          : username as String?,
      inviteCode: inviteCode == const $CopyWithPlaceholder()
          ? _value.inviteCode
          // ignore: cast_nullable_to_non_nullable
          : inviteCode as String?,
    );
  }
}

extension $UserInviteModelCopyWith on UserInviteModel {
  /// Returns a callable class that can be used as follows: `instanceOfUserInviteModel.copyWith(...)` or like so:`instanceOfUserInviteModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$UserInviteModelCWProxy get copyWith => _$UserInviteModelCWProxyImpl(this);
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInviteModel _$UserInviteModelFromJson(Map json) => UserInviteModel(
      userId: json['userId'] as String?,
      name: json['name'] as String?,
      userProfileImageUrl: json['userProfileImageUrl'] as String?,
      username: json['username'] as String?,
      inviteCode: json['inviteCode'] as String?,
    );

Map<String, dynamic> _$UserInviteModelToJson(UserInviteModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'name': instance.name,
      'userProfileImageUrl': instance.userProfileImageUrl,
      'username': instance.username,
      'inviteCode': instance.inviteCode,
    };
