import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'internship_tags_model.freezed.dart';
part 'internship_tags_model.g.dart';

@Freezed(makeCollectionsUnmodifiable: false)
class InternshipTagsModel with _$InternshipTagsModel {
  const factory InternshipTagsModel({
    String? id,
    String? name,
    String? iconUrl,
  }) = _InternshipTagsModel;

  factory InternshipTagsModel.fromJson(Map<String, dynamic> json) =>
      _$InternshipTagsModelFromJson(json);
}
