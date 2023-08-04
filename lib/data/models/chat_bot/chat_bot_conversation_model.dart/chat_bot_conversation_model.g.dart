// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_bot_conversation_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatBotConversationModel _$$_ChatBotConversationModelFromJson(Map json) =>
    _$_ChatBotConversationModel(
      userQuery: json['userQuery'] as String?,
      botResponse: json['botResponse'] as String?,
      entity: json['entity'] as String?,
      createdAt:
          const TimestampConverter().fromJson(json['createdAt'] as Timestamp?),
    );

Map<String, dynamic> _$$_ChatBotConversationModelToJson(
        _$_ChatBotConversationModel instance) =>
    <String, dynamic>{
      'userQuery': instance.userQuery,
      'botResponse': instance.botResponse,
      'entity': instance.entity,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
