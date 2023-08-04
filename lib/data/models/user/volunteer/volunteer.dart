import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:nova_social/data/models/misc/converters/converters.dart';
import 'package:json_annotation/json_annotation.dart';
part 'volunteer.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class Volunteer {
  String? id;
  String? title;
  String? organization;
  String? website;
  @TimestampConverter()
  DateTime? startDate;
  @TimestampConverter()
  DateTime? endDate;
  String? description;
  bool? currentlyVolunteering;

  Volunteer({
    this.id,
    this.title,
    this.organization,
    this.website,
    this.startDate,
    this.endDate,
    this.description,
    this.currentlyVolunteering,
  });

  factory Volunteer.fromJson(Map<String, dynamic> json) =>
      _$VolunteerFromJson(json);

  Map<String, dynamic> toJson() => _$VolunteerToJson(this);
}
