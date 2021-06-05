// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HotCategories.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotCategories _$HotCategoriesFromJson(Map<String, dynamic> json) {
  return HotCategories(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => DataBean.fromJson(e as Map<String, dynamic>))
        .toList(),
    total: json['total'] as num?,
  );
}

Map<String, dynamic> _$HotCategoriesToJson(HotCategories instance) =>
    <String, dynamic>{
      'data': instance.data,
      'total': instance.total,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) {
  return DataBean(
    detail: json['detail'] == null
        ? null
        : DetailBean.fromJson(json['detail'] as Map<String, dynamic>),
    countTotal: json['countTotal'] as num?,
  );
}

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'detail': instance.detail,
      'countTotal': instance.countTotal,
    };

DetailBean _$DetailBeanFromJson(Map<String, dynamic> json) {
  return DetailBean(
    id: json['_id'] as String?,
    jobCategory_Id: json['jobCategory_Id'] == null
        ? null
        : JobCategory_IdBean.fromJson(
            json['jobCategory_Id'] as Map<String, dynamic>),
    JobDetailName: json['JobDetailName'] as String?,
    JobDetailNameEn: json['JobDetailNameEn'] as String?,
    scrapeId: json['scrapeId'] as num?,
    description: json['description'] as String?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    v: json['v'] as num?,
  );
}

Map<String, dynamic> _$DetailBeanToJson(DetailBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobCategory_Id': instance.jobCategory_Id,
      'JobDetailName': instance.JobDetailName,
      'JobDetailNameEn': instance.JobDetailNameEn,
      'scrapeId': instance.scrapeId,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
    };

JobCategory_IdBean _$JobCategory_IdBeanFromJson(Map<String, dynamic> json) {
  return JobCategory_IdBean(
    id: json['id'] as String?,
    jobCategoryName: json['jobCategoryName'] as String?,
    jobCategoryNameEn: json['jobCategoryNameEn'] as String?,
    scrapeId: json['scrapeId'] as num?,
    description: json['description'] as String?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    v: json['v'] as num?,
  );
}

Map<String, dynamic> _$JobCategory_IdBeanToJson(JobCategory_IdBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobCategoryName': instance.jobCategoryName,
      'jobCategoryNameEn': instance.jobCategoryNameEn,
      'scrapeId': instance.scrapeId,
      'description': instance.description,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
    };
