import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/enums/enums.dart';
part 'user_reaction.freezed.dart';
part 'user_reaction.g.dart';

@freezed
class UserReaction with _$UserReaction {
  const factory UserReaction({
    String? id,
    String? name,
    String? username,
    String? profilePictureUrl,
    ReactionEnum? reaction,
  }) = _UserReaction;

  factory UserReaction.fromJson(Map<String, dynamic> json) =>
      _$UserReactionFromJson(json);
}
