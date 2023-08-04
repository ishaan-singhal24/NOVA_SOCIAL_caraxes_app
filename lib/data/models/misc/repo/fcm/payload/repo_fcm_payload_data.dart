import 'package:json_annotation/json_annotation.dart';
import 'package:nova_social/data/models/misc/repo/fcm/payload/repo_fcm_payload_data_payloads.dart';
part 'repo_fcm_payload_data.g.dart';

@JsonSerializable(explicitToJson: true)
class RepoFcmPayloadData {
  RepoFcmPayloadData({
    this.scheduleTime,
    this.payloads,
    this.pushFrom,
    this.gcmImageUrl,
    this.gcmSubtext,
    this.body,
  });

  List<String>? scheduleTime;
  List<RepoFcmPayloadDataPayloads>? payloads;
  String? pushFrom;
  String? gcmSubtext;
  String? gcmImageUrl;
  String? body;

  factory RepoFcmPayloadData.fromJson(Map<String, dynamic> json) =>
      _$RepoFcmPayloadDataFromJson(json);
  Map<String, dynamic> toJson() => _$RepoFcmPayloadDataToJson(this);
}
