import 'package:json_annotation/json_annotation.dart';
part 'repo_fcm_payload_data_payloads.g.dart';

@JsonSerializable()
class RepoFcmPayloadDataPayloads {
  RepoFcmPayloadDataPayloads({
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

  factory RepoFcmPayloadDataPayloads.fromJson(Map<String, dynamic> json) =>
      _$RepoFcmPayloadDataPayloadsFromJson(json);
  Map<String, dynamic> toJson() => _$RepoFcmPayloadDataPayloadsToJson(this);
}
