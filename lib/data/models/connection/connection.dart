import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/enums/enums.dart';
import 'package:nova_social/data/models/connection/connection_blocked_user.dart';
import 'package:nova_social/data/models/misc/misc.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
part 'connection.g.dart';
part 'connection.freezed.dart';

@freezed
class ConnectionModel with _$ConnectionModel {
  @JsonSerializable(includeIfNull: false)
  const factory ConnectionModel({
    String? id,
    UserMinimum? user1,
    UserMinimum? user2,
    Map<String, bool>? users,
    ConnectionStatus? status,
    bool? isSeen,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
    ConnectionBlockedUser? blocked,
  }) = _ConnectionModel;

  factory ConnectionModel.fromJson(Map<String, dynamic> json) =>
      _$ConnectionModelFromJson(json);
}
