import 'package:freezed_annotation/freezed_annotation.dart';
part 'connection_blocked_user.g.dart';
part 'connection_blocked_user.freezed.dart';

@freezed
class ConnectionBlockedUser with _$ConnectionBlockedUser {
  @JsonSerializable(includeIfNull: false)
  const factory ConnectionBlockedUser({
    String? from,
    String? to,
  }) = _ConnectionBlockedUser;

  factory ConnectionBlockedUser.fromJson(Map<String, dynamic> json) =>
      _$ConnectionBlockedUserFromJson(json);
}
