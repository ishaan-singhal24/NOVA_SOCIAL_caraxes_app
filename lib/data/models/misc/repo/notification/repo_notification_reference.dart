import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/enums/enums.dart';
part 'repo_notification_reference.freezed.dart';
part 'repo_notification_reference.g.dart';

@freezed
class RepoNotificationReference with _$RepoNotificationReference {
  @JsonSerializable(includeIfNull: false)
  const factory RepoNotificationReference({
    NotificationReferenceType? type,
    String? id,
    List<String>? subIds,
    List<NotificationReferenceType>? subTypes,
  }) = _RepoNotificationReference;

  factory RepoNotificationReference.fromJson(Map<String, dynamic> json) =>
      _$RepoNotificationReferenceFromJson(json);
}
