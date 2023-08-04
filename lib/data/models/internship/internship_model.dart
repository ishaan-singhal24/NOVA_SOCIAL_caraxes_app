import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/models/internship/categories/internship_category_model.dart';
import 'package:nova_social/data/models/internship/tags/internship_tags_model.dart';
import 'package:nova_social/data/models/misc/converters/converters.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
part 'internship_model.freezed.dart';
part 'internship_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class InternshipModel with _$InternshipModel {
  const factory InternshipModel({
    String? id,
    String? title,
    String? internshipDescription,
    String? location,
    String? companyName,
    String? companyDescription,
    String? companyIconUrl,
    InternshipCategoryModel? internshipCategory,
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? expiry,
    String? durationInDays,
    List<UserMinimum>? interestedUsers,
    List<InternshipTagsModel>? relatedTags,
    bool? isLive,
  }) = _InternshipModel;

  factory InternshipModel.fromJson(Map<String, dynamic> json) =>
      _$InternshipModelFromJson(json);
}
