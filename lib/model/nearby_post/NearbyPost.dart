import 'package:json_annotation/json_annotation.dart';

part 'NearbyPost.g.dart';

@JsonSerializable()
class NearbyPost {
  num? total;
  List<DataBean>? data;

  NearbyPost({this.total, this.data});

  factory NearbyPost.fromJson(Map<String, dynamic> json) =>
      _$NearbyPostFromJson(json);

  Map<String, dynamic> toJson() => _$NearbyPostToJson(this);
}

@JsonSerializable()
class DataBean {
  String? id;
  List<HasLocationsBean>? hasLocations;
  List<HasJobsBean>? hasJobs;
  List<String>? requiredSkills;
  String? jobTitle;
  String? aliasPost;
  JobTypeBean? jobType;
  JobLevel_IdBean? jobLevel_Id;
  Company_IdBean? company_Id;
  SalaryRange_IdBean? salaryRange_Id;
  bool? isRequiredCoverLetter;
  LanguageRequiredBean? languageRequired;
  LocationBean? location;
  String? jobDescription;
  String? jobRequirement;
  String? contactPersonName;
  String? contactEmail;
  num? expiredTime;
  num? publishedDate;
  num? countView;
  num? v;
  num? distance;

  DataBean(
      {this.id,
      this.hasLocations,
      this.hasJobs,
      this.requiredSkills,
      this.jobTitle,
      this.aliasPost,
      this.jobType,
      this.jobLevel_Id,
      this.company_Id,
      this.salaryRange_Id,
      this.isRequiredCoverLetter,
      this.languageRequired,
      this.location,
      this.jobDescription,
      this.jobRequirement,
      this.contactPersonName,
      this.contactEmail,
      this.expiredTime,
      this.publishedDate,
      this.countView,
      this.v,
      this.distance});

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
class LanguageRequiredBean {
  String? language;
  String? proficiency;

  LanguageRequiredBean({this.language, this.proficiency});

  factory LanguageRequiredBean.fromJson(Map<String, dynamic> json) =>
      _$LanguageRequiredBeanFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageRequiredBeanToJson(this);
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
  String? id;
  List<String>? hasBenefits;
  List<String>? hasJobs;
  List<String>? hasLocations;
  String? companyName;
  String? companyNameEn;
  String? companySlug;
  String? employer_Id;
  String? optionalDetailCompany_Id;
  String? exactAddress;
  String? phoneNumber;
  num? viewCount;
  num? followerCount;
  String? createdAt;
  String? updatedAt;
  num? v;

  Company_IdBean(
      {this.id,
      this.hasBenefits,
      this.hasJobs,
      this.hasLocations,
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
class JobLevel_IdBean {
  String? id;
  String? jobLevelName;
  String? jobLevelNameEn;
  num? scrapeId;
  String? createdAt;
  String? updatedAt;
  num? v;

  JobLevel_IdBean(
      {this.id,
      this.jobLevelName,
      this.jobLevelNameEn,
      this.scrapeId,
      this.createdAt,
      this.updatedAt,
      this.v});

  factory JobLevel_IdBean.fromJson(Map<String, dynamic> json) =>
      _$JobLevel_IdBeanFromJson(json);

  Map<String, dynamic> toJson() => _$JobLevel_IdBeanToJson(this);
}

@JsonSerializable()
class JobTypeBean {
  String? id;
  String? jobTypeName;
  num? scrapeId;
  num? v;

  JobTypeBean({this.id, this.jobTypeName, this.scrapeId, this.v});

  factory JobTypeBean.fromJson(Map<String, dynamic> json) =>
      _$JobTypeBeanFromJson(json);

  Map<String, dynamic> toJson() => _$JobTypeBeanToJson(this);
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
