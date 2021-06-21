// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'FeaturedCompany.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeaturedCompany _$FeaturedCompanyFromJson(Map<String, dynamic> json) {
  return FeaturedCompany(
    total: json['total'] as num?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => DataBean.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$FeaturedCompanyToJson(FeaturedCompany instance) =>
    <String, dynamic>{
      'total': instance.total,
      'data': instance.data,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) {
  return DataBean(
    hasBenefits: (json['hasBenefits'] as List<dynamic>?)
        ?.map((e) => HasBenefitsBean.fromJson(e as Map<String, dynamic>))
        .toList(),
    hasJobs: (json['hasJobs'] as List<dynamic>?)
        ?.map((e) => HasJobsBean.fromJson(e as Map<String, dynamic>))
        .toList(),
    hasLocations: (json['hasLocations'] as List<dynamic>?)
        ?.map((e) => HasLocationsBean.fromJson(e as Map<String, dynamic>))
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
    phoneNumber: json['phoneNumber'] as String?,
    viewCount: json['viewCount'] as num?,
    followerCount: json['followerCount'] as num?,
    scrapeId: json['scrapeId'] as num?,
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
      'phoneNumber': instance.phoneNumber,
      'viewCount': instance.viewCount,
      'followerCount': instance.followerCount,
      'scrapeId': instance.scrapeId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
    };

OptionalDetailCompany_IdBean _$OptionalDetailCompany_IdBeanFromJson(
    Map<String, dynamic> json) {
  return OptionalDetailCompany_IdBean(
    companyPics: json['companyPics'],
    id: json['_id'] as String?,
    logoUrl: json['logoUrl'] as String?,
    bannerUrl: json['bannerUrl'] as String?,
    companyAddress: json['companyAddress'] as String?,
    contactName: json['contactName'] as String?,
    companySize_Id: json['companySize_Id'] == null
        ? null
        : CompanySize_IdBean.fromJson(
            json['companySize_Id'] as Map<String, dynamic>),
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

CompanySize_IdBean _$CompanySize_IdBeanFromJson(Map<String, dynamic> json) {
  return CompanySize_IdBean(
    id: json['_id'] as String?,
    companySize: json['companySize'] as String?,
    v: json['v'] as num?,
  );
}

Map<String, dynamic> _$CompanySize_IdBeanToJson(CompanySize_IdBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'companySize': instance.companySize,
      'v': instance.v,
    };

HasLocationsBean _$HasLocationsBeanFromJson(Map<String, dynamic> json) {
  return HasLocationsBean(
    id: json['_id'] as String?,
    provinceName: json['provinceName'] as String?,
    fakeId: json['fakeId'] as num?,
    v: json['v'] as num?,
  );
}

Map<String, dynamic> _$HasLocationsBeanToJson(HasLocationsBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'provinceName': instance.provinceName,
      'fakeId': instance.fakeId,
      'v': instance.v,
    };

HasJobsBean _$HasJobsBeanFromJson(Map<String, dynamic> json) {
  return HasJobsBean(
    id: json['_id'] as String?,
    jobCategory_Id: json['jobCategory_Id'] as String?,
    JobDetailName: json['JobDetailName'] as String?,
    JobDetailNameEn: json['JobDetailNameEn'] as String?,
    scrapeId: json['scrapeId'] as num?,
    description: json['description'] as String?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    v: json['v'] as num?,
  );
}

Map<String, dynamic> _$HasJobsBeanToJson(HasJobsBean instance) =>
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

HasBenefitsBean _$HasBenefitsBeanFromJson(Map<String, dynamic> json) {
  return HasBenefitsBean(
    id: json['_id'] as String?,
    benefitName: json['benefitName'] as String?,
    benefitNameEn: json['benefitNameEn'] as String?,
    description: json['description'] as String?,
    scrapeId: json['scrapeId'] as num?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    v: json['v'] as num?,
  );
}

Map<String, dynamic> _$HasBenefitsBeanToJson(HasBenefitsBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'benefitName': instance.benefitName,
      'benefitNameEn': instance.benefitNameEn,
      'description': instance.description,
      'scrapeId': instance.scrapeId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
    };
