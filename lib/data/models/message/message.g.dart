// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map json) => Message(
      text: json['text'] as String?,
      user: json['user'] == null
          ? null
          : UserModel.fromJson(Map<String, dynamic>.from(json['user'] as Map)),
      sentAt: const TimestampConverter().fromJson(json['sentAt'] as Timestamp?),
      readReciept: json['readReciept'] as bool?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'text': instance.text,
      'user': instance.user?.toJson(),
      'sentAt': const TimestampConverter().toJson(instance.sentAt),
      'readReciept': instance.readReciept,
    };
