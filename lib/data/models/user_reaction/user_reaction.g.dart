// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_reaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserReaction _$$_UserReactionFromJson(Map json) => _$_UserReaction(
      id: json['id'] as String?,
      name: json['name'] as String?,
      username: json['username'] as String?,
      profilePictureUrl: json['profilePictureUrl'] as String?,
      reaction: $enumDecodeNullable(_$ReactionEnumEnumMap, json['reaction']),
    );

Map<String, dynamic> _$$_UserReactionToJson(_$_UserReaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'profilePictureUrl': instance.profilePictureUrl,
      'reaction': _$ReactionEnumEnumMap[instance.reaction],
    };

const _$ReactionEnumEnumMap = {
  ReactionEnum.upvote: 'upvote',
  ReactionEnum.downvote: 'downvote',
  ReactionEnum.love: 'love',
  ReactionEnum.haha: 'haha',
  ReactionEnum.wow: 'wow',
  ReactionEnum.sad: 'sad',
  ReactionEnum.angry: 'angry',
};
