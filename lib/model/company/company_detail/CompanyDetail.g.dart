// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'CompanyDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyDetail _$CompanyDetailFromJson(Map<String, dynamic> json) {
  return CompanyDetail(
    data: json['data'] == null
        ? null
        : DataBean.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CompanyDetailToJson(CompanyDetail instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) {
  return DataBean(
    hasBenefits: (json['hasBenefits'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    hasJobs:
        (json['hasJobs'] as List<dynamic>?)?.map((e) => e as String).toList(),
    hasLocations: (json['hasLocations'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    id: json['_id'] as String?,
    companyName: json['companyName'] as String?,
    companyNameEn: json['companyNameEn'] as String?,
    companySlug: json['companySlug'] as String?,
    employer_Id: json['employer_Id'] as String?,
    optionalDetailCompany_Id: json['optionalDetailCompany_Id'] == null
        ? null
        : OptionalDetailCompany_IdBean.fromJson(
            json['optionalDetailCompany_Id'] as Map<String, dynamic>),
    exactAddress: json['exactAddress'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    viewCount: json['viewCount'] as num?,
    followerCount: json['followerCount'] as num?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    v: json['v'] as num?,
  );
}

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'hasBenefits': instance.hasBenefits,
      'hasJobs': instance.hasJobs,
      'hasLocations': instance.hasLocations,
      'id': instance.id,
      'companyName': instance.companyName,
      'companyNameEn': instance.companyNameEn,
      'companySlug': instance.companySlug,
      'employer_Id': instance.employer_Id,
      'optionalDetailCompany_Id': instance.optionalDetailCompany_Id,
      'exactAddress': instance.exactAddress,
      'phoneNumber': instance.phoneNumber,
      'viewCount': instance.viewCount,
      'followerCount': instance.followerCount,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
    };

OptionalDetailCompany_IdBean _$OptionalDetailCompany_IdBeanFromJson(
    Map<String, dynamic> json) {
  return OptionalDetailCompany_IdBean(
    companyPics: (json['companyPics'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    id: json['_id'] as String?,
    logoUrl: json['logoUrl'] as String?,
    bannerUrl: json['bannerUrl'] as String?,
    companyAddress: json['companyAddress'] as String?,
    contactName: json['contactName'] as String?,
    companySize_Id: json['companySize_Id'] as String?,
    v: json['v'] as num?,
  );
}

Map<String, dynamic> _$OptionalDetailCompany_IdBeanToJson(
        OptionalDetailCompany_IdBean instance) =>
    <String, dynamic>{
      'companyPics': instance.companyPics,
      'id': instance.id,
      'logoUrl': instance.logoUrl,
      'bannerUrl': instance.bannerUrl,
      'companyAddress': instance.companyAddress,
      'contactName': instance.contactName,
      'companySize_Id': instance.companySize_Id,
      'v': instance.v,
    };
