import 'package:json_annotation/json_annotation.dart';

part 'PostDetail.g.dart';

@JsonSerializable()
class PostDetail {
  DataBean? data;
  num? totalPostJob;

  PostDetail({this.data, this.totalPostJob});

  factory PostDetail.fromJson(Map<String, dynamic> json) =>
      _$PostDetailFromJson(json);

  Map<String, dynamic> toJson() => _$PostDetailToJson(this);
}

@JsonSerializable()
class DataBean {
  LanguageRequiredBean? languageRequired;
  List<HasLocationsBean>? hasLocations;
  List<HasJobsBean>? hasJobs;
  List<RequiredSkillsBean>? requiredSkills;
  String? id;
  String? jobTitle;
  String? aliasPost;
  String? jobType;
  String? jobLevel_Id;
  Company_IdBean? company_Id;
  String? salaryRange_Id;
  bool? isRequiredCoverLetter;
  LocationBean? location;
  String? jobDescription;
  String? jobRequirement;
  String? contactPersonName;
  String? contactEmail;
  num? expiredTime;
  num? publishedDate;
  num? countView;
  num? v;

  DataBean(
      {this.languageRequired,
      this.hasLocations,
      this.hasJobs,
      this.requiredSkills,
      this.id,
      this.jobTitle,
      this.aliasPost,
      this.jobType,
      this.jobLevel_Id,
      this.company_Id,
      this.salaryRange_Id,
      this.isRequiredCoverLetter,
      this.location,
      this.jobDescription,
      this.jobRequirement,
      this.contactPersonName,
      this.contactEmail,
      this.expiredTime,
      this.publishedDate,
      this.countView,
      this.v});

  factory DataBean.fromJson(Map<String, dynamic> json) =>
      _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

@JsonSerializable()
class LocationBean {
  String? type;
  List<num>? coordinates;
  String? id;

  LocationBean({this.type, this.coordinates, this.id});

  factory LocationBean.fromJson(Map<String, dynamic> json) =>
      _$LocationBeanFromJson(json);

  Map<String, dynamic> toJson() => _$LocationBeanToJson(this);
}

@JsonSerializable()
class Company_IdBean {
  List<String>? hasBenefits;
  List<String>? hasJobs;
  List<String>? hasLocations;
  String? id;
  String? companyName;
  String? companyNameEn;
  String? companySlug;
  String? employer_Id;
  OptionalDetailCompany_IdBean? optionalDetailCompany_Id;
  String? exactAddress;
  String? phoneNumber;
  num? viewCount;
  num? followerCount;
  String? createdAt;
  String? updatedAt;
  num? v;

  Company_IdBean(
      {this.hasBenefits,
      this.hasJobs,
      this.hasLocations,
      this.id,
      this.companyName,
      this.companyNameEn,
      this.companySlug,
      this.employer_Id,
      this.optionalDetailCompany_Id,
      this.exactAddress,
      this.phoneNumber,
      this.viewCount,
      this.followerCount,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory Company_IdBean.fromJson(Map<String, dynamic> json) =>
      _$Company_IdBeanFromJson(json);

  Map<String, dynamic> toJson() => _$Company_IdBeanToJson(this);
}

@JsonSerializable()
class OptionalDetailCompany_IdBean {
  List<String>? companyPics;
  String? id;
  String? logoUrl;
  String? bannerUrl;
  String? companyAddress;
  String? contactName;
  CompanySize_IdBean? companySize_Id;
  num? v;

  OptionalDetailCompany_IdBean(
      {this.companyPics,
      this.id,
      this.logoUrl,
      this.bannerUrl,
      this.companyAddress,
      this.contactName,
      this.companySize_Id,
      this.v});

  factory OptionalDetailCompany_IdBean.fromJson(Map<String, dynamic> json) =>
      _$OptionalDetailCompany_IdBeanFromJson(json);

  Map<String, dynamic> toJson() => _$OptionalDetailCompany_IdBeanToJson(this);
}

@JsonSerializable()
class CompanySize_IdBean {
  String? id;
  String? companySize;
  num? v;

  CompanySize_IdBean({this.id, this.companySize, this.v});

  factory CompanySize_IdBean.fromJson(Map<String, dynamic> json) =>
      _$CompanySize_IdBeanFromJson(json);

  Map<String, dynamic> toJson() => _$CompanySize_IdBeanToJson(this);
}

@JsonSerializable()
class RequiredSkillsBean {
  String? id;
  num? scrapeId;
  String? skillName;
  String? createdAt;
  String? updatedAt;
  num? v;

  RequiredSkillsBean(
      {this.id,
      this.scrapeId,
      this.skillName,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory RequiredSkillsBean.fromJson(Map<String, dynamic> json) =>
      _$RequiredSkillsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$RequiredSkillsBeanToJson(this);
}

@JsonSerializable()
class HasJobsBean {
  String? id;
  String? jobCategory_Id;
  String? JobDetailName;
  String? JobDetailNameEn;
  num? scrapeId;
  String? description;
  String? createdAt;
  String? updatedAt;
  num? v;

  HasJobsBean(
      {this.id,
      this.jobCategory_Id,
      this.JobDetailName,
      this.JobDetailNameEn,
      this.scrapeId,
      this.description,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory HasJobsBean.fromJson(Map<String, dynamic> json) =>
      _$HasJobsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$HasJobsBeanToJson(this);
}

@JsonSerializable()
class HasLocationsBean {
  String? id;
  String? provinceName;
  num? fakeId;
  num? v;

  HasLocationsBean({this.id, this.provinceName, this.fakeId, this.v});

  factory HasLocationsBean.fromJson(Map<String, dynamic> json) =>
      _$HasLocationsBeanFromJson(json);

  Map<String, dynamic> toJson() => _$HasLocationsBeanToJson(this);
}

@JsonSerializable()
class LanguageRequiredBean {
  LanguageBean? language;
  ProficiencyBean? proficiency;

  LanguageRequiredBean({this.language, this.proficiency});

  factory LanguageRequiredBean.fromJson(Map<String, dynamic> json) =>
      _$LanguageRequiredBeanFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageRequiredBeanToJson(this);
}

@JsonSerializable()
class ProficiencyBean {
  String? id;
  String? proficiencyLevelName;
  String? proficiencyLevelNameEn;
  num? scrapeId;
  String? bgColor;
  String? createdAt;
  String? updatedAt;
  num? v;

  ProficiencyBean(
      {this.id,
      this.proficiencyLevelName,
      this.proficiencyLevelNameEn,
      this.scrapeId,
      this.bgColor,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory ProficiencyBean.fromJson(Map<String, dynamic> json) =>
      _$ProficiencyBeanFromJson(json);

  Map<String, dynamic> toJson() => _$ProficiencyBeanToJson(this);
}

@JsonSerializable()
class LanguageBean {
  String? id;
  String? languageName;
  String? languageNameEn;
  num? scrapeId;
  String? createdAt;
  String? updatedAt;
  num? v;

  LanguageBean(
      {this.id,
      this.languageName,
      this.languageNameEn,
      this.scrapeId,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory LanguageBean.fromJson(Map<String, dynamic> json) =>
      _$LanguageBeanFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageBeanToJson(this);
}
