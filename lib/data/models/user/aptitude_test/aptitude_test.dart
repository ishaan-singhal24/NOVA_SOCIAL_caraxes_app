import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:nova_social/data/models/misc/converters/converters.dart';
import 'package:json_annotation/json_annotation.dart';
part 'aptitude_test.g.dart';

@CopyWith()
@JsonSerializable(explicitToJson: true)
class AptitudeTest {
  String? id;
  String? name;
  String? issuedBy;
  String? website;
  @TimestampConverter()
  DateTime? issueDate;
  String? description;

  AptitudeTest({
    this.id,
    this.name,
    this.issuedBy,
    this.website,
    this.issueDate,
    this.description,
  });

  factory AptitudeTest.fromJson(Map<String, dynamic> json) =>
      _$AptitudeTestFromJson(json);

  Map<String, dynamic> toJson() => _$AptitudeTestToJson(this);
}
