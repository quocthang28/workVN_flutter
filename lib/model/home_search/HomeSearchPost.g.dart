// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'HomeSearchPost.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeSearchPost _$HomeSearchPostFromJson(Map<String, dynamic> json) {
  return HomeSearchPost(
    total: json['total'] as num?,
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => DataBean.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$HomeSearchPostToJson(HomeSearchPost instance) =>
    <String, dynamic>{
      'total': instance.total,
      'data': instance.data,
    };

DataBean _$DataBeanFromJson(Map<String, dynamic> json) {
  return DataBean(
    languageRequired: json['languageRequired'] == null
        ? null
        : LanguageRequiredBean.fromJson(
            json['languageRequired'] as Map<String, dynamic>),
    hasLocations: (json['hasLocations'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    hasJobs: (json['hasJobs'] as List<dynamic>?)
        ?.map((e) => HasJobsBean.fromJson(e as Map<String, dynamic>))
        .toList(),
    requiredSkills: (json['requiredSkills'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    id: json['_id'] as String?,
    jobTitle: json['jobTitle'] as String?,
    aliasPost: json['aliasPost'] as String?,
    jobType: json['jobType'] as String?,
    jobLevel_Id: json['jobLevel_Id'] as String?,
    company_Id: json['company_Id'] as String?,
    salaryRange_Id: json['salaryRange_Id'] == null
        ? null
        : SalaryRange_IdBean.fromJson(
            json['salaryRange_Id'] as Map<String, dynamic>),
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
    score: json['score'] as num?,
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
      'score': instance.score,
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
