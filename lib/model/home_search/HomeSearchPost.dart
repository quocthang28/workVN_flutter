import 'package:json_annotation/json_annotation.dart';

part 'HomeSearchPost.g.dart';

@JsonSerializable()
class HomeSearchPost {
  num? total;
  List<DataBean>? data;

  HomeSearchPost({this.total, this.data});

  factory HomeSearchPost.fromJson(Map<String, dynamic> json) =>
      _$HomeSearchPostFromJson(json);

  Map<String, dynamic> toJson() => _$HomeSearchPostToJson(this);
}

@JsonSerializable()
class DataBean {
  LanguageRequiredBean? languageRequired;
  List<String>? hasLocations;
  List<HasJobsBean>? hasJobs;
  List<String>? requiredSkills;
  String? id;
  String? jobTitle;
  String? aliasPost;
  String? jobType;
  String? jobLevel_Id;
  String? company_Id;
  SalaryRange_IdBean? salaryRange_Id;
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
  num? score;

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
      this.v,
      this.score});

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
class LanguageRequiredBean {
  String? language;
  String? proficiency;

  LanguageRequiredBean({this.language, this.proficiency});

  factory LanguageRequiredBean.fromJson(Map<String, dynamic> json) =>
      _$LanguageRequiredBeanFromJson(json);

  Map<String, dynamic> toJson() => _$LanguageRequiredBeanToJson(this);
}
