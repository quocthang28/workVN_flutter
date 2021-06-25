// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'NearbyPost.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NearbyPost _$NearbyPostFromJson(Map<String, dynamic> json) {
  return NearbyPost(
    total: json['total'] as num?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => DataBean.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$NearbyPostToJson(NearbyPost instance) =>
    <String, dynamic>{
      'total': instance.total,
      'data': instance.data,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) {
  return DataBean(
    id: json['_id'] as String?,
    hasLocations: (json['hasLocations'] as List<dynamic>?)
        ?.map((e) => HasLocationsBean.fromJson(e as Map<String, dynamic>))
        .toList(),
    hasJobs: (json['hasJobs'] as List<dynamic>?)
        ?.map((e) => HasJobsBean.fromJson(e as Map<String, dynamic>))
        .toList(),
    requiredSkills: (json['requiredSkills'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    jobTitle: json['jobTitle'] as String?,
    aliasPost: json['aliasPost'] as String?,
    jobType: json['jobType'] == null
        ? null
        : JobTypeBean.fromJson(json['jobType'] as Map<String, dynamic>),
    jobLevel_Id: json['jobLevel_Id'] == null
        ? null
        : JobLevel_IdBean.fromJson(json['jobLevel_Id'] as Map<String, dynamic>),
    company_Id: json['company_Id'] == null
        ? null
        : Company_IdBean.fromJson(json['company_Id'] as Map<String, dynamic>),
    salaryRange_Id: json['salaryRange_Id'] == null
        ? null
        : SalaryRange_IdBean.fromJson(
            json['salaryRange_Id'] as Map<String, dynamic>),
    isRequiredCoverLetter: json['isRequiredCoverLetter'] as bool?,
    languageRequired: json['languageRequired'] == null
        ? null
        : LanguageRequiredBean.fromJson(
            json['languageRequired'] as Map<String, dynamic>),
    location: json['location'] == null
        ? null
        : LocationBean.fromJson(json['location'] as Map<String, dynamic>),
    jobDescription: json['jobDescription'] as String?,
    jobRequirement: json['jobRequirement'] as String?,
    contactPersonName: json['contactPersonName'] as String?,
    contactEmail: json['contactEmail'] as String?,
    expiredTime: json['expiredTime'] as num?,
    publishedDate: json['publishedDate'] as num?,
    countView: json['countView'] as num?,
    v: json['v'] as num?,
    distance: json['distance'] as num?,
  );
}

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'id': instance.id,
      'hasLocations': instance.hasLocations,
      'hasJobs': instance.hasJobs,
      'requiredSkills': instance.requiredSkills,
      'jobTitle': instance.jobTitle,
      'aliasPost': instance.aliasPost,
      'jobType': instance.jobType,
      'jobLevel_Id': instance.jobLevel_Id,
      'company_Id': instance.company_Id,
      'salaryRange_Id': instance.salaryRange_Id,
      'isRequiredCoverLetter': instance.isRequiredCoverLetter,
      'languageRequired': instance.languageRequired,
      'location': instance.location,
      'jobDescription': instance.jobDescription,
      'jobRequirement': instance.jobRequirement,
      'contactPersonName': instance.contactPersonName,
      'contactEmail': instance.contactEmail,
      'expiredTime': instance.expiredTime,
      'publishedDate': instance.publishedDate,
      'countView': instance.countView,
      'v': instance.v,
      'distance': instance.distance,
    };

LocationBean _$LocationBeanFromJson(Map<String, dynamic> json) {
  return LocationBean(
    type: json['type'] as String?,
    coordinates:
        (json['coordinates'] as List<dynamic>?)?.map((e) => e as num).toList(),
    id: json['_id'] as String?,
  );
}

Map<String, dynamic> _$LocationBeanToJson(LocationBean instance) =>
    <String, dynamic>{
      'type': instance.type,
      'coordinates': instance.coordinates,
      'id': instance.id,
    };

LanguageRequiredBean _$LanguageRequiredBeanFromJson(Map<String, dynamic> json) {
  return LanguageRequiredBean(
    language: json['language'] as String?,
    proficiency: json['proficiency'] as String?,
  );
}

Map<String, dynamic> _$LanguageRequiredBeanToJson(
        LanguageRequiredBean instance) =>
    <String, dynamic>{
      'language': instance.language,
      'proficiency': instance.proficiency,
    };

SalaryRange_IdBean _$SalaryRange_IdBeanFromJson(Map<String, dynamic> json) {
  return SalaryRange_IdBean(
    id: json['_id'] as String?,
    salaryMin: json['salaryMin'] as num?,
    salaryMax: json['salaryMax'] as num?,
    isShowUp: json['isShowUp'] as bool?,
    v: json['v'] as num?,
  );
}

Map<String, dynamic> _$SalaryRange_IdBeanToJson(SalaryRange_IdBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'salaryMin': instance.salaryMin,
      'salaryMax': instance.salaryMax,
      'isShowUp': instance.isShowUp,
      'v': instance.v,
    };

Company_IdBean _$Company_IdBeanFromJson(Map<String, dynamic> json) {
  return Company_IdBean(
    id: json['_id'] as String?,
    hasBenefits: (json['hasBenefits'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    hasJobs:
        (json['hasJobs'] as List<dynamic>?)?.map((e) => e as String).toList(),
    hasLocations: (json['hasLocations'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
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

Map<String, dynamic> _$Company_IdBeanToJson(Company_IdBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hasBenefits': instance.hasBenefits,
      'hasJobs': instance.hasJobs,
      'hasLocations': instance.hasLocations,
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
    id: json['_id'] as String?,
    companyPics: (json['companyPics'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
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
      'id': instance.id,
      'companyPics': instance.companyPics,
      'logoUrl': instance.logoUrl,
      'bannerUrl': instance.bannerUrl,
      'companyAddress': instance.companyAddress,
      'contactName': instance.contactName,
      'companySize_Id': instance.companySize_Id,
      'v': instance.v,
    };

JobLevel_IdBean _$JobLevel_IdBeanFromJson(Map<String, dynamic> json) {
  return JobLevel_IdBean(
    id: json['_id'] as String?,
    jobLevelName: json['jobLevelName'] as String?,
    jobLevelNameEn: json['jobLevelNameEn'] as String?,
    scrapeId: json['scrapeId'] as num?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    v: json['v'] as num?,
  );
}

Map<String, dynamic> _$JobLevel_IdBeanToJson(JobLevel_IdBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobLevelName': instance.jobLevelName,
      'jobLevelNameEn': instance.jobLevelNameEn,
      'scrapeId': instance.scrapeId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
    };

JobTypeBean _$JobTypeBeanFromJson(Map<String, dynamic> json) {
  return JobTypeBean(
    id: json['_id'] as String?,
    jobTypeName: json['jobTypeName'] as String?,
    scrapeId: json['scrapeId'] as num?,
    v: json['v'] as num?,
  );
}

Map<String, dynamic> _$JobTypeBeanToJson(JobTypeBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'jobTypeName': instance.jobTypeName,
      'scrapeId': instance.scrapeId,
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
