import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:nova_social/data/models/misc/converters/converters.dart';
import 'package:json_annotation/json_annotation.dart';
part 'education.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class Education {
  String? id;
  String? school;
  String? degree;
  @TimestampConverter()
  DateTime? startDate;
  @TimestampConverter()
  DateTime? endDate;
  String? fieldOfStudy;
  String? description;
  String? location;
  bool? currentlyStudyHere;

  Education({
    this.id,
    this.school,
    this.degree,
    this.startDate,
    this.endDate,
    this.fieldOfStudy,
    this.description,
    this.location,
    this.currentlyStudyHere,
  });

  factory Education.fromJson(Map<String, dynamic> json) =>
      _$EducationFromJson(json);

  Map<String, dynamic> toJson() => _$EducationToJson(this);
}
