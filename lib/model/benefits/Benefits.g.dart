// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Benefits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Benefits _$BenefitsFromJson(Map<String, dynamic> json) {
  return Benefits(
    total: json['total'] as num?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => DataBean.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$BenefitsToJson(Benefits instance) => <String, dynamic>{
      'total': instance.total,
      'data': instance.data,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) {
  return DataBean(
    id: json['id'] as String?,
    benefitName: json['benefitName'] as String?,
    benefitNameEn: json['benefitNameEn'] as String?,
    scrapeId: json['scrapeId'] as num?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    v: json['v'] as num?,
  );
}

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'id': instance.id,
      'benefitName': instance.benefitName,
      'benefitNameEn': instance.benefitNameEn,
      'scrapeId': instance.scrapeId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
    };
