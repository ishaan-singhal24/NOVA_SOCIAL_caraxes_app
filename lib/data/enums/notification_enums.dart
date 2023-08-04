import 'package:freezed_annotation/freezed_annotation.dart';

//Run build runner command if you make any changes in these enums

enum NotificationType {
  @JsonValue('comment')
  comment,
  @JsonValue('replyToComment')
  replyToComment,
  @JsonValue('reaction')
  reaction,
  @JsonValue('share')
  share,
  @JsonValue('connectionRequest')
  connectionRequest,
  @JsonValue('viewedProfile')
  viewedProfile,
}

//Where does this notification refers to
enum NotificationReferenceType {
  @JsonValue('collection')
  collection,
  @JsonValue('post')
  post,
  @JsonValue('aiArt')
  aiArt,
  @JsonValue('connectionSent')
  connectionSent,
  @JsonValue('connectionAccept')
  connectionAccept,
  @JsonValue('comment')
  comment,
}
