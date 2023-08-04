import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/models/connection/connection.dart';
import 'package:nova_social/data/models/user/user.dart';
part 'user_minimum.freezed.dart';
part 'user_minimum.g.dart';

@freezed
class UserMinimum with _$UserMinimum {
  const factory UserMinimum({
    String? id,
    String? name,
    String? username,
    String? email,
    String? profilePictureUrl,
    String? profileWallpaperUrl,
    String? tagline,
    String? fcmToken,
    Map<String, bool>? connections,
  }) = _UserMinimum;

  factory UserMinimum.getUserMinimum(UserModel? user) {
    return UserMinimum(
      id: user?.id,
      name: user?.name,
      username: user?.username,
      email: user?.email,
      profilePictureUrl: user?.profilePictureUrl,
      profileWallpaperUrl: user?.profileWallpaperUrl,
      tagline: user?.tagline,
      fcmToken: user?.fcmToken,
      connections: user?.connections,
    );
  }

  factory UserMinimum.fetchOtherFromConnection(
      ConnectionModel connection, String myUserId) {
    UserMinimum? user;
    if (connection.user1?.id == myUserId) {
      user = connection.user2;
    } else {
      user = connection.user1;
    }
    return UserMinimum(
      id: user?.id,
      name: user?.name,
      username: user?.username,
      email: user?.email,
      profilePictureUrl: user?.profilePictureUrl,
      profileWallpaperUrl: user?.profileWallpaperUrl,
      tagline: user?.tagline,
      fcmToken: user?.fcmToken,
      connections: user?.connections,
    );
  }

  factory UserMinimum.fromJson(Map<String, dynamic> json) =>
      _$UserMinimumFromJson(json);
}
