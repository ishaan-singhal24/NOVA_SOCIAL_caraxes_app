import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_blocked_users.g.dart';
part 'user_blocked_users.freezed.dart';

@freezed
class UserBlockedUsers with _$UserBlockedUsers {
  @JsonSerializable(includeIfNull: false)
  const factory UserBlockedUsers({
    Map<String, bool>? from,
    Map<String, bool>? to,
  }) = _UserBlockedUsers;

  factory UserBlockedUsers.fromJson(Map<String, dynamic> json) =>
      _$UserBlockedUsersFromJson(json);
}
