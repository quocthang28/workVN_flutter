// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TopViewPosts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopViewPosts _$TopViewPostsFromJson(Map<String, dynamic> json) {
  return TopViewPosts(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => DataBean.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$TopViewPostsToJson(TopViewPosts instance) =>
    <String, dynamic>{
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
    hasJobs:
        (json['hasJobs'] as List<dynamic>?)?.map((e) => e as String).toList(),
    requiredSkills: (json['requiredSkills'] as List<dynamic>?)
        ?.map((e) => e as String)
        .toList(),
    id: json['_id'] as String?,
    jobTitle: json['jobTitle'] as String?,
    aliasPost: json['aliasPost'] as String?,
    jobType: json['jobType'] as String?,
    jobLevel_Id: json['jobLevel_Id'] as String?,
    company_Id: json['company_Id'] as String?,
    salaryRange_Id: json['salaryRange_Id'] as String?,
    isRequiredCoverLetter: json['isRequiredCoverLetter'] as bool?,
    location: json['location'] == null
        ? null
        : LocationBean.fromJson(json['location'] as Map<String, dynamic>),
    jobDescription: json['jobDescription'] as String?,
    jobRequirement: json['jobRequirement'] as String?,
    contactPersonName: json['contactPersonName'] as String?,
    contactEmail: json['contactEmail'] as String?,
    expiredTime: json['expiredTime'] as String?,
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
      'countView': instance.countView,
      'v': instance.v,
    };

LocationBean _$LocationBeanFromJson(Map<String, dynamic> json) {
  return LocationBean(
    type: json['type'] as String?,
    id: json['id'] as String?,
    coordinates:
        (json['coordinates'] as List<dynamic>?)?.map((e) => e as num).toList(),
  );
}

Map<String, dynamic> _$LocationBeanToJson(LocationBean instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'coordinates': instance.coordinates,
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
