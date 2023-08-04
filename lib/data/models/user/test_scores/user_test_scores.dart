import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:nova_social/data/models/misc/converters/converters.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_test_scores.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class UserTestScores {
  String? id;
  String? testName;
  String? conductedBy;
  String? website;
  String? testIconUrl;
  String? scoredMarks;
  String? maxMarks;
  String? relatedLink;
  String? description;
  @TimestampConverter()
  DateTime? testDate;

  UserTestScores({
    this.id,
    this.testName,
    this.conductedBy,
    this.website,
    this.testIconUrl,
    this.scoredMarks,
    this.maxMarks,
    this.relatedLink,
    this.testDate,
    this.description,
  });
  factory UserTestScores.fromJson(Map<String, dynamic> json) =>
      _$UserTestScoresFromJson(json);

  Map<String, dynamic> toJson() => _$UserTestScoresToJson(this);
}
