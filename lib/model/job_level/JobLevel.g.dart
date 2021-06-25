// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'JobLevel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobLevel _$JobLevelFromJson(Map<String, dynamic> json) {
  return JobLevel(
    total: json['total'] as num?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => DataBean.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$JobLevelToJson(JobLevel instance) => <String, dynamic>{
      'total': instance.total,
      'data': instance.data,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) {
  return DataBean(
    id: json['_id'] as String?,
    jobLevelName: json['jobLevelName'] as String?,
    jobLevelNameEn: json['jobLevelNameEn'] as String?,
    scrapeId: json['scrapeId'] as num?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    v: json['v'] as num?,
  );
}

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'id': instance.id,
      'jobLevelName': instance.jobLevelName,
      'jobLevelNameEn': instance.jobLevelNameEn,
      'scrapeId': instance.scrapeId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
    };
