import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:nova_social/data/models/misc/converters/converters.dart';
import 'package:nova_social/data/models/models.dart';
import 'package:nova_social/data/models/user/user_minimum.dart';
part 'internship_category_model.freezed.dart';
part 'internship_category_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class InternshipCategoryModel with _$InternshipCategoryModel {
  const factory InternshipCategoryModel({
    String? id,
    String? name,
    String? coverImageUrl,
    @TimestampConverter() DateTime? createdAt,
  }) = _InternshipCategoryModel;

  factory InternshipCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$InternshipCategoryModelFromJson(json);
}
