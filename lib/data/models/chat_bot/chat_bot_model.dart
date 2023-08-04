import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/models/chat_bot/chat_bot_conversation_model.dart/chat_bot_conversation_model.dart';
part 'chat_bot_model.freezed.dart';
part 'chat_bot_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class ChatBotModel with _$ChatBotModel {
  const factory ChatBotModel({
    final String? id,
    final List<ChatBotConversationModel>? chatConversations,
  }) = _ChatBotModel;

  factory ChatBotModel.fromJson(Map<String, dynamic> json) =>
      _$ChatBotModelFromJson(json);
}
