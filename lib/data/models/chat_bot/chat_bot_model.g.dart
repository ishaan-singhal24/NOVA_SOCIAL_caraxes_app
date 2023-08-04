// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_bot_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatBotModel _$$_ChatBotModelFromJson(Map json) => _$_ChatBotModel(
      id: json['id'] as String?,
      chatConversations: (json['chatConversations'] as List<dynamic>?)
          ?.map((e) => ChatBotConversationModel.fromJson(
              Map<String, dynamic>.from(e as Map)))
          .toList(),
    );

Map<String, dynamic> _$$_ChatBotModelToJson(_$_ChatBotModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'chatConversations':
          instance.chatConversations?.map((e) => e.toJson()).toList(),
    };
