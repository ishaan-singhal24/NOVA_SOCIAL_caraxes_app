import 'package:json_annotation/json_annotation.dart';
import 'package:nova_social/data/models/misc/repo/fcm/option/repo_fcm_option.dart';
import 'package:nova_social/data/models/misc/repo/fcm/payload/repo_fcm_payload.dart';
part 'repo_fcm.g.dart';

@JsonSerializable(explicitToJson: true, includeIfNull: false)
class RepoFcm {
  RepoFcm({
    required this.registrationTokenOrTokens,
    required this.payload,
    this.options,
  });

  List<String?> registrationTokenOrTokens;
  RepoFcmPayload payload;
  RepoFcmOption? options;

  factory RepoFcm.fromJson(Map<String, dynamic> json) =>
      _$RepoFcmFromJson(json);
  Map<String, dynamic> toJson() => _$RepoFcmToJson(this);
}
