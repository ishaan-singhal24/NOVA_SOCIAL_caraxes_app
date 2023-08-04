import 'package:json_annotation/json_annotation.dart';
part 'repo_fcm_option.g.dart';

@JsonSerializable()
class RepoFcmOption {
  RepoFcmOption({
    this.dryRun,
    this.priorityString,
    this.timeToLive,
    this.collapseKeyString,
    this.mutableContent,
    this.contentAvailable,
    this.restrictedPackageName,
  });

  bool? dryRun;
  String? priorityString;
  double? timeToLive;
  String? collapseKeyString;
  bool? mutableContent;
  bool? contentAvailable;
  String? restrictedPackageName;

  factory RepoFcmOption.fromJson(Map<String, dynamic> json) =>
      _$RepoFcmOptionFromJson(json);
  Map<String, dynamic> toJson() => _$RepoFcmOptionToJson(this);
}
