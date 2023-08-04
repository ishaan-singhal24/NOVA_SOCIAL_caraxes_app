import 'package:json_annotation/json_annotation.dart';
part 'repo_fcm_payload_notification.g.dart';

@JsonSerializable(includeIfNull: false)
class RepoFcmPayloadNotification {
  RepoFcmPayloadNotification({
    this.tag,
    this.body,
    this.icon,
    this.badge,
    this.color,
    this.sound,
    this.title,
    this.bodyLocKey,
    this.bodyLocArgs,
    this.clickAction,
    this.titleLocKey,
    this.titleLocArgs,
  });

  String? tag;
  String? body;
  String? icon;
  String? badge;
  String? color;
  String? sound;
  String? title;
  String? bodyLocKey;
  String? bodyLocArgs;
  String? clickAction;
  String? titleLocKey;
  String? titleLocArgs;

  factory RepoFcmPayloadNotification.fromJson(Map<String, dynamic> json) =>
      _$RepoFcmPayloadNotificationFromJson(json);
  Map<String, dynamic> toJson() => _$RepoFcmPayloadNotificationToJson(this);
}
