// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PostDetail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostDetail _$PostDetailFromJson(Map<String, dynamic> json) {
  return PostDetail(
    data: json['data'] == null
        ? null
        : DataBean.fromJson(json['data'] as Map<String, dynamic>),
    totalPostJob: json['totalPostJob'] as num?,
  );
}

Map<String, dynamic> _$PostDetailToJson(PostDetail instance) =>
    <String, dynamic>{
      'data': instance.data,
      'totalPostJob': instance.totalPostJob,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) {
  return DataBean(
    languageRequired: json['languageRequired'] == null
        ? null
        : LanguageRequiredBean.fromJson(
            json['languageRequired'] as Map<String, dynamic>),
    hasLocations: (json['hasLocations'] as List<dynamic>?)
        ?.map((e) => HasLocationsBean.fromJson(e as Map<String, dynamic>))
        .toList(),
    hasJobs: (json['hasJobs'] as List<dynamic>?)
        ?.map((e) => HasJobsBean.fromJson(e as Map<String, dynamic>))
        .toList(),
    requiredSkills: (json['requiredSkills'] as List<dynamic>?)
        ?.map((e) => RequiredSkillsBean.fromJson(e as Map<String, dynamic>))
        .toList(),
    id: json['_id'] as String?,
    jobTitle: json['jobTitle'] as String?,
    aliasPost: json['aliasPost'] as String?,
    jobType: json['jobType'] as String?,
    jobLevel_Id: json['jobLevel_Id'] as String?,
    company_Id: json['company_Id'] == null
        ? null
        : Company_IdBean.fromJson(json['company_Id'] as Map<String, dynamic>),
    salaryRange_Id: json['salaryRange_Id'] as String?,
    isRequiredCoverLetter: json['isRequiredCoverLetter'] as bool?,
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
  );
}

Map<String, dynamic> _$DataBeanToJson(DataBean instance) => <String, dynamic>{
      'languageRequired': instance.languageRequired,
      'hasLocations': instance.hasLocations,
      'hasJobs': instance.hasJobs,
      'requiredSkills': instance.requiredSkills,
      'id': instance.id,
      'jobTitle': instance.jobTitle,
      'aliasPost': instance.aliasPost,
      'jobType': instance.jobType,
      'jobLevel_Id': instance.jobLevel_Id,
      'company_Id': instance.company_Id,
      'salaryRange_Id': instance.salaryRange_Id,
      'isRequiredCoverLetter': instance.isRequiredCoverLetter,
      'location': instance.location,
      'jobDescription': instance.jobDescription,
      'jobRequirement': instance.jobRequirement,
      'contactPersonName': instance.contactPersonName,
      'contactEmail': instance.contactEmail,
      'expiredTime': instance.expiredTime,
      'publishedDate': instance.publishedDate,
      'countView': instance.countView,
      'v': instance.v,
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

Company_IdBean _$Company_IdBeanFromJson(Map<String, dynamic> json) {
  return Company_IdBean(
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

Map<String, dynamic> _$Company_IdBeanToJson(Company_IdBean instance) =>
    <String, dynamic>{
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

RequiredSkillsBean _$RequiredSkillsBeanFromJson(Map<String, dynamic> json) {
  return RequiredSkillsBean(
    id: json['_id'] as String?,
    scrapeId: json['scrapeId'] as num?,
    skillName: json['skillName'] as String?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    v: json['v'] as num?,
  );
}

Map<String, dynamic> _$RequiredSkillsBeanToJson(RequiredSkillsBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'scrapeId': instance.scrapeId,
      'skillName': instance.skillName,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
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

LanguageRequiredBean _$LanguageRequiredBeanFromJson(Map<String, dynamic> json) {
  return LanguageRequiredBean(
    language: json['language'] == null
        ? null
        : LanguageBean.fromJson(json['language'] as Map<String, dynamic>),
    proficiency: json['proficiency'] == null
        ? null
        : ProficiencyBean.fromJson(json['proficiency'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$LanguageRequiredBeanToJson(
        LanguageRequiredBean instance) =>
    <String, dynamic>{
      'language': instance.language,
      'proficiency': instance.proficiency,
    };

ProficiencyBean _$ProficiencyBeanFromJson(Map<String, dynamic> json) {
  return ProficiencyBean(
    id: json['_id'] as String?,
    proficiencyLevelName: json['proficiencyLevelName'] as String?,
    proficiencyLevelNameEn: json['proficiencyLevelNameEn'] as String?,
    scrapeId: json['scrapeId'] as num?,
    bgColor: json['bgColor'] as String?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    v: json['v'] as num?,
  );
}

Map<String, dynamic> _$ProficiencyBeanToJson(ProficiencyBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'proficiencyLevelName': instance.proficiencyLevelName,
      'proficiencyLevelNameEn': instance.proficiencyLevelNameEn,
      'scrapeId': instance.scrapeId,
      'bgColor': instance.bgColor,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
    };

LanguageBean _$LanguageBeanFromJson(Map<String, dynamic> json) {
  return LanguageBean(
    id: json['_id'] as String?,
    languageName: json['languageName'] as String?,
    languageNameEn: json['languageNameEn'] as String?,
    scrapeId: json['scrapeId'] as num?,
    createdAt: json['createdAt'] as String?,
    updatedAt: json['updatedAt'] as String?,
    v: json['v'] as num?,
  );
}

Map<String, dynamic> _$LanguageBeanToJson(LanguageBean instance) =>
    <String, dynamic>{
      'id': instance.id,
      'languageName': instance.languageName,
      'languageNameEn': instance.languageNameEn,
      'scrapeId': instance.scrapeId,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'v': instance.v,
    };
