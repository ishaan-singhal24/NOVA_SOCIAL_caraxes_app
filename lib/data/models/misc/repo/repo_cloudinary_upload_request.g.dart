// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repo_cloudinary_upload_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CloudinaryUploadRequest _$$_CloudinaryUploadRequestFromJson(Map json) =>
    _$_CloudinaryUploadRequest(
      file: json['file'] as String?,
      publicId: json['public_id'] as String?,
      folder: json['folder'] as String?,
      useFilename: json['use_filename'] as bool?,
      uniqueFilename: json['unique_filename'] as bool?,
      filenameOverride: json['filename_override'] as String?,
      resourceType: json['resource_type'] as String?,
      type: json['type'] as String?,
      overwrite: json['overwrite'] as bool?,
      tags: json['tags'] as String?,
    );

Map<String, dynamic> _$$_CloudinaryUploadRequestToJson(
        _$_CloudinaryUploadRequest instance) =>
    <String, dynamic>{
      'file': instance.file,
      'public_id': instance.publicId,
      'folder': instance.folder,
      'use_filename': instance.useFilename,
      'unique_filename': instance.uniqueFilename,
      'filename_override': instance.filenameOverride,
      'resource_type': instance.resourceType,
      'type': instance.type,
      'overwrite': instance.overwrite,
      'tags': instance.tags,
    };
