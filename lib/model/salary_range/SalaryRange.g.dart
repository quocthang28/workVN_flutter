// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'SalaryRange.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SalaryRange _$SalaryRangeFromJson(Map<String, dynamic> json) {
  return SalaryRange(
    total: json['total'] as num?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => DataBean.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SalaryRangeToJson(SalaryRange instance) =>
    <String, dynamic>{
      'total': instance.total,
      'data': instance.data,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) {
  return DataBean(
    id: json['_id'] as String?,
    salaryMin: json['salaryMin'] as num?,
    salaryMax: json['salaryMax'] as num?,
    isShowUp: json['isShowUp'] as bool?,
    v: json['v'] as num?,
  );
}

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'id': instance.id,
      'salaryMin': instance.salaryMin,
      'salaryMax': instance.salaryMax,
      'isShowUp': instance.isShowUp,
      'v': instance.v,
    };
