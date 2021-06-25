// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'JobType.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobType _$JobTypeFromJson(Map<String, dynamic> json) {
  return JobType(
    total: json['total'] as num?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => DataBean.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$JobTypeToJson(JobType instance) => <String, dynamic>{
      'total': instance.total,
      'data': instance.data,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) {
  return DataBean(
    id: json['_id'] as String?,
    jobTypeName: json['jobTypeName'] as String?,
    scrapeId: json['scrapeId'] as num?,
    v: json['v'] as num?,
  );
}

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'id': instance.id,
      'jobTypeName': instance.jobTypeName,
      'scrapeId': instance.scrapeId,
      'v': instance.v,
    };
