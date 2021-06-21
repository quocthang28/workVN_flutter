import 'package:json_annotation/json_annotation.dart';

part 'TopViewPosts.g.dart';

@JsonSerializable()
class TopViewPosts {
  List<DataBean>? data;

  TopViewPosts({this.data});

  factory TopViewPosts.fromJson(Map<String, dynamic> json) =>
      _$TopViewPostsFromJson(json);

  Map<String, dynamic> toJson() => _$TopViewPostsToJson(this);
}

@JsonSerializable()
class DataBean {
  LanguageRequiredBean? languageRequired;
  List<HasLocationsBean>? hasLocations;
  List<String>? hasJobs;
  List<String>? requiredSkills;
  String? id;
  String? jobTitle;
  String? aliasPost;
  String? jobType;
  String? jobLevel_Id;
  Company_IdBean? company_Id;
  SalaryRange_IdBean? salaryRange_Id;
  bool? isRequiredCoverLetter;
  LocationBean? location;
  String? jobDescription;
  String? jobRequirement;
  String? contactPersonName;
  String? contactEmail;
  num? expiredTime;
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
      this.countView,
      this.v});

  factory DataBean.fromJson(Map<String, dynamic> json) =>
      _$DataBeanFromJson(json);

  Map<String, dynamic> toJson() => _$DataBeanToJson(this);
}

@JsonSerializable()
class LocationBean {
  String? type;
  String? id;
  List<num>? coordinates;

  LocationBean({this.type, this.id, this.coordinates});

  factory LocationBean.fromJson(Map<String, dynamic> json) =>
      _$LocationBeanFromJson(json);

  Map<String, dynamic> toJson() => _$LocationBeanToJson(this);
}

@JsonSerializable()
class SalaryRange_IdBean {
  String? id;
  num? salaryMin;
  num? salaryMax;
  bool? isShowUp;
  num? v;

  SalaryRange_IdBean(
      {this.id, this.salaryMin, this.salaryMax, this.isShowUp, this.v});

  factory SalaryRange_IdBean.fromJson(Map<String, dynamic> json) =>
      _$SalaryRange_IdBeanFromJson(json);

  Map<String, dynamic> toJson() => _$SalaryRange_IdBeanToJson(this);
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
  String? companySize_Id;
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
  String? language;
  String? proficiency;

  LanguageRequiredBean({this.language, this.proficiency});

  factory LanguageRequiredBean.fromJson(Map<String, dynamic> json) =>
      _$LanguageRequiredBeanFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageRequiredBeanToJson(this);
}
