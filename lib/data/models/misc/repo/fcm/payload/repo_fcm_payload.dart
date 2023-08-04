import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/models/misc/misc.dart';
part 'repo_fcm_payload.g.dart';
part 'repo_fcm_payload.freezed.dart';

@freezed
class RepoFcmPayload with _$RepoFcmPayload {
  @JsonSerializable(includeIfNull: false)
  const factory RepoFcmPayload({
    @RepoFcmPayloadDataConverter() RepoFcmPayloadData? data,
    RepoFcmPayloadNotification? notification,
  }) = _RepoFcmPayload;

  factory RepoFcmPayload.fromJson(Map<String, dynamic> json) =>
      _$RepoFcmPayloadFromJson(json);
}
