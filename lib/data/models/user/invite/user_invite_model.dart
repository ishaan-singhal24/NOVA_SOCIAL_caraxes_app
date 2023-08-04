import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_invite_model.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class UserInviteModel {
  String? userId;
  String? name;
  String? userProfileImageUrl;
  String? username;
  String? inviteCode;

  UserInviteModel({
    this.userId,
    this.name,
    this.userProfileImageUrl,
    this.username,
    this.inviteCode,
  });
  factory UserInviteModel.fromJson(Map<String, dynamic> json) =>
      _$UserInviteModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserInviteModelToJson(this);
}
