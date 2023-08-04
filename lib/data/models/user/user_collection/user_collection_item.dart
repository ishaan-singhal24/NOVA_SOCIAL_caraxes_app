import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/models/misc/misc.dart';
import 'package:nova_social/data/models/user_reaction/user_reaction.dart';
part 'user_collection_item.freezed.dart';
part 'user_collection_item.g.dart';

@freezed
class UserCollectionItem with _$UserCollectionItem {
  const factory UserCollectionItem({
    String? id,
    String? name,
    String? tagline,
    String? description,
    String? thumbnailUrl,
    String? fileUrl,
    @TimestampConverter() DateTime? startDate,
    @TimestampConverter() DateTime? endDate,
    List<UserReaction>? reactions,
  }) = _UserCollectionItem;

  factory UserCollectionItem.fromJson(Map<String, dynamic> json) =>
      _$UserCollectionItemFromJson(json);
}
