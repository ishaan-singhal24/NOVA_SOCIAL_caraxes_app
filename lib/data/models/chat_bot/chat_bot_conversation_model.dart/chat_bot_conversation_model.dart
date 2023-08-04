import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/models/models.dart';
part 'chat_bot_conversation_model.freezed.dart';
part 'chat_bot_conversation_model.g.dart';

@freezed
class ChatBotConversationModel with _$ChatBotConversationModel {
  const factory ChatBotConversationModel({
    final String? userQuery,
    final String? botResponse,
    final String? entity,
    @TimestampConverter() DateTime? createdAt,
  }) = _ChatBotConversationModel;

  factory ChatBotConversationModel.fromJson(Map<String, dynamic> json) =>
      _$ChatBotConversationModelFromJson(json);
}
